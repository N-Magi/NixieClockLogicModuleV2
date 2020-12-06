#include "DriveBoard.h"
#include "DS3234.h"
#include "Nixie.h"
#include <Arduino.h>
#include <SPI.h>
#include "main.h"
#include "time.h"
#include <WiFi.h>
#include <FreeRTOS.h>

const char *ssid = "747747";
const char *password = "7e3aba54aa";

Nixie nixie;
DS3234 rtc;
DriveBoard board;
IPAddress addr;
Adjustment adj;

int mode = CLOCK;
int schematic[6][2];
long elapsed_time = 0;
bool blinkFlag = false;

void IRAM_ATTR Display_Interrupt(void) { nixie.ShowDisplay(); }

int *SetSchematicByTimeCode(int d1, int d2, int d3);
void mode_adjustment(uint8_t SwState);

int LimitDateValue(int parameter, int max_time, int min_time)
{
  if (parameter > max_time)
    parameter = min_time;
  if (parameter < min_time)
    parameter = max_time;
  return parameter;
}

void WifiEvent(WiFiEvent_t e);

void setup()
{
  
  // put your setup code here, to run once:
  Serial.begin(115200);

  Serial.println(board.MesureVoltage());
  
  //Connect Wifi
  if (!WiFi.isConnected())
  {
    WiFi.disconnect(true, true);
    WiFi.begin(ssid, password);
    WiFi.onEvent(WifiEvent);
  }
}

void WifiEvent(WiFiEvent_t e)
{
  if (e == SYSTEM_EVENT_STA_GOT_IP)
  {
    IPAddress localAddr = WiFi.localIP();
    Serial.println(localAddr);
    configTime(32400, 0, "192.168.10.34");
    struct tm timeinfo;
    getLocalTime(&timeinfo);
    // Serial.println(getYear(days));
    // Serial.println(getMonth(days));
    // Serial.println(mod);
    // Serial.println(ntpcli.getHours());
    // Serial.println(ntpcli.getMinutes());
    // Serial.println(ntpcli.getSeconds());
    rtc.SetDateTime(timeinfo.tm_year % 100, timeinfo.tm_mon, timeinfo.tm_mday, timeinfo.tm_hour, timeinfo.tm_min, timeinfo.tm_sec);
  }
}
// Check Internet Connection

int *SetSchematicByTimeCode(int d1, int d2, int d3)
{
  schematic[0][0] = d1 / 10;
  schematic[1][0] = d1 % 10;
  schematic[1][1] = DP_RDP;

  schematic[2][0] = d2 / 10;
  schematic[3][0] = d2 % 10;
  schematic[3][1] = DP_RDP;

  schematic[4][0] = d3 / 10;
  schematic[5][0] = d3 % 10;
  schematic[5][1] = DP_RDP;
  return *schematic;
}

void loop()
{
  Display_Interrupt();
  uint8_t SwState = board.ReadKeyState();

  if (mode == CLOCK)
  {
    //int hour = rtc.GetTime(SECOND);
    //Serial.println(hour);
    nixie.SetSchematic(SetSchematicByTimeCode(rtc.GetTime(HOUR), rtc.GetTime(MINUTE), rtc.GetTime(SECOND)));

    //nixie.ShowDisplay();

    if (bitRead(SwState, 7)) //ACCEPT
      mode = DIVERGENCE;
    if (bitRead(SwState, 6)) //BACK
      mode = ADJUSTMENT;
    adj.selectIndex = YEAR;
    adj.year = rtc.GetTime(YEAR);
    adj.month = rtc.GetTime(MONTH);
    adj.day = rtc.GetTime(DAY);
    adj.hour = rtc.GetTime(HOUR);
    adj.minute = rtc.GetTime(MINUTE);
    adj.second = rtc.GetTime(SECOND);
    return;
  }

  if (mode == DIVERGENCE)
  {
    mode = CLOCK;
    // if (bitRead(SwState, 4)) //ACCEPT
    //     adj.selectIndex = MONTH;
    // if (bitRead(SwState, 5)) //BACK
    //     mode = clock;
    return;
  }

  if (mode == ADJUSTMENT)
  {
    //Serial.println("MODE:ADUSTMENT");
    mode_adjustment(SwState);
    return;
  }
}

void mode_adjustment(uint8_t SwState)
{
  switch (adj.selectIndex)
  {
  case YEAR:
    if (bitRead(SwState, 7)) //ACCEPT
      adj.selectIndex = MONTH;
    if (bitRead(SwState, 6)) //BACK
      mode = CLOCK;
    if (bitRead(SwState, 5)) //-
      adj.year--;
    if (bitRead(SwState, 4)) //+
      adj.year++;
    break;
  case MONTH:
    if (bitRead(SwState, 7)) //ACCEPT
      adj.selectIndex = DAY;
    if (bitRead(SwState, 6)) //BACK
      adj.selectIndex = YEAR;
    if (bitRead(SwState, 5)) //-
      adj.month--;
    if (bitRead(SwState, 4)) //+
      adj.month++;
    break;
  case DAY:
    if (bitRead(SwState, 7)) //ACCEPT
      adj.selectIndex = HOUR;
    if (bitRead(SwState, 6)) //BACK
      adj.selectIndex = MONTH;
    if (bitRead(SwState, 5)) //-
      adj.day--;
    if (bitRead(SwState, 4)) //+
      adj.day++;
    break;
  case HOUR:
    if (bitRead(SwState, 7)) //ACCEPT
      adj.selectIndex = MINUTE;
    if (bitRead(SwState, 6)) //BACK
      adj.selectIndex = DAY;
    if (bitRead(SwState, 5)) //-
      adj.hour--;
    if (bitRead(SwState, 4)) //+
      adj.hour++;
    break;
  case MINUTE:
    if (bitRead(SwState, 7)) //ACCEPT
      adj.selectIndex = SECOND;
    if (bitRead(SwState, 6)) //BACK
      adj.selectIndex = HOUR;
    if (bitRead(SwState, 5)) //-
      adj.minute--;
    if (bitRead(SwState, 4)) //+
      adj.minute++;
    break;
  case SECOND:
    if (bitRead(SwState, 7)) //ACCEPT
    {
      rtc.SetDateTime(adj.year, adj.month, adj.day, adj.hour, adj.minute, adj.second);
      mode = CLOCK;
    }
    if (bitRead(SwState, 6)) //BACK
      adj.selectIndex = MINUTE;
    break;
    if (bitRead(SwState, 5)) //-
      adj.second--;
    if (bitRead(SwState, 4)) //+
      adj.second++;
    break;
  default:
    break;
  }

  adj.second = LimitDateValue(adj.second, 59, 0);
  adj.minute = LimitDateValue(adj.minute, 59, 0);
  adj.hour = LimitDateValue(adj.hour, 23, 0);
  adj.day = LimitDateValue(adj.day, 31, 1);
  adj.month = LimitDateValue(adj.month, 12, 1);
  adj.year = LimitDateValue(adj.year, 99, 0);

  //********* FOR BLINKING
  if (elapsed_time + 350 <= millis())
  {
    blinkFlag = blinkFlag ? false : true;
    elapsed_time = millis();
  }

  //**** OFF ****//
  if (blinkFlag)
  {
    if (adj.selectIndex >= DAY)
    {
      SetSchematicByTimeCode(adj.year, adj.month, adj.day);
    }
    if (adj.selectIndex <= HOUR)
    {
      SetSchematicByTimeCode(adj.hour, adj.minute, adj.second);
    }

    switch (adj.selectIndex)
    {
    case YEAR:
      schematic[0][0] = 10;
      schematic[0][1] = DP_NONE;
      schematic[1][0] = 10;
      schematic[1][1] = DP_RDP;
      break;
    case MONTH:
      schematic[2][0] = 10;
      schematic[3][0] = 10;
      schematic[2][1] = DP_NONE;
      schematic[3][1] = DP_RDP;
      break;
    case DAY:
      schematic[4][0] = 10;
      schematic[5][0] = 10;
      schematic[4][1] = DP_NONE;
      schematic[5][1] = DP_RDP;
      break;
    case HOUR:
      schematic[0][0] = 10;
      schematic[1][0] = 10;
      schematic[0][1] = DP_NONE;
      schematic[1][1] = DP_RDP;
      break;
    case MINUTE:
      schematic[2][0] = 10;
      schematic[3][0] = 10;
      schematic[2][1] = DP_NONE;
      schematic[3][1] = DP_RDP;
      break;
    case SECOND:
      schematic[4][0] = 10;
      schematic[5][0] = 10;
      schematic[4][1] = DP_NONE;
      schematic[5][1] = DP_RDP;
      break;
    default:
      break;
    }

    nixie.SetSchematic(*schematic);
    return;
  }

  //**** ON ****//
  if (adj.selectIndex >= DAY)
  {
    SetSchematicByTimeCode(adj.year, adj.month, adj.day);
  }
  if (adj.selectIndex <= HOUR)
  {
    SetSchematicByTimeCode(adj.hour, adj.minute, adj.second);
  }
  nixie.SetSchematic(*schematic);
}
