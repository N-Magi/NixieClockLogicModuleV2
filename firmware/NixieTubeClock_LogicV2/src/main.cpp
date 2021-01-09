#include "DriveBoard.h"
#include "DS3234.h"
#include "Nixie.h"
#include <Arduino.h>
#include <SPI.h>
#include "main.h"
#include "time.h"
#include <WiFi.h>
#include <FreeRTOS.h>
#include "CliTerminal.h"

//#define TIME_OUT 5000

Nixie nixie;
DS3234 rtc;
DriveBoard board;
IPAddress addr;
Adjustment adj;

Cli_Terminal terminal(100);

uint TIME_OUT = 5000;
char NTP_SERVER[100] = "ntp.nict.jp";
int mode = CLOCK;
int schematic[6][2];
long elapsed_time = 0;
bool blinkFlag = false;

//*** PROTTYPE ***//
void IRAM_ATTR Display_Interrupt(void) { nixie.ShowDisplay(); }

int *SetSchematicByTimeCode(int d1, int d2, int d3);
void mode_ManualAdjustment(uint8_t SwState);
void mode_Ntpadjustment(uint8_t SwState);
void mode_SerialSetting(char *command, char *data);
void AdjustNtp();
void WifiEvent(WiFiEvent_t e);
void WiFiConnect(char *ssid, char *pass);
void WiFiConnect();
void SetupWiFi(String str);

int LimitDateValue(int parameter, int max_time, int min_time)
{
  if (parameter > max_time)
    parameter = min_time;
  if (parameter < min_time)
    parameter = max_time;
  return parameter;
}
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

void setup()
{
  Serial.begin(115200);
  Serial.print("Tube Voltage: ");
  Serial.println(board.MesureVoltage());

  terminal.commands[0] = Command("volt", [](String str) -> void { Serial.println(board.MesureVoltage()); });
  terminal.commands[1] = Command("wifi", SetupWiFi);
  terminal.commands[2] = Command("timeout", [](String str) -> void {
    if (str.length() <= 0)
    {
      Serial.print("Current WiFi Time Out is Setting in...");
      Serial.println(TIME_OUT);
      return;
    }
    TIME_OUT = str.toInt();
  });
  terminal.commands[3] = Command("ntp", [](String str) -> void {
    if (str.length() <= 0)
    {
      Serial.print("Adusting Time By Ntp via ");
      Serial.println(NTP_SERVER);
      AdjustNtp();
      Serial.println("Completed!!");
      return;
    }
    Serial.print("NTP Server address changed To  ");
    Serial.println(str);
    str.toCharArray(NTP_SERVER,sizeof(NTP_SERVER));
    Serial.println("Completed!!");
  });
  WiFiConnect();

  Serial.print("WiFi Connection: ");
  Serial.println(WiFi.isConnected() ? "true" : "false");
}

void loop()
{
  Display_Interrupt(); // manually Refresh Display

  terminal.cli_cal();

  uint8_t SwState = board.ReadKeyState();

  if (mode == CLOCK)
  {
    nixie.SetSchematic(SetSchematicByTimeCode(rtc.GetTime(HOUR), rtc.GetTime(MINUTE), rtc.GetTime(SECOND)));
    if (bitRead(SwState, 7)) //ACCEPT
      mode = DIVERGENCE;
    if (bitRead(SwState, 6)) //BACK
    {
      mode = ADJUSTMENT;
      if (WiFi.isConnected())
        mode = NTPADJUSTMENT;
      adj.selectIndex = YEAR;
      adj.year = rtc.GetTime(YEAR);
      adj.month = rtc.GetTime(MONTH);
      adj.day = rtc.GetTime(DAY);
      adj.hour = rtc.GetTime(HOUR);
      adj.minute = rtc.GetTime(MINUTE);
      adj.second = rtc.GetTime(SECOND);
    }
    return;
  }

  if (mode == DIVERGENCE)
  {
    mode = CLOCK;
    return;
  }

  if (mode == ADJUSTMENT)
  {
    mode_ManualAdjustment(SwState);
    return;
  }
  if (mode == NTPADJUSTMENT)
  {
    mode_Ntpadjustment(SwState);
    return;
  }
}

void mode_Ntpadjustment(uint8_t SwState)
{
  if (bitRead(SwState, 7)) //ACCEPT
  {
    AdjustNtp();
    mode = CLOCK;
  }
  if (bitRead(SwState, 6)) //BACK
    mode = CLOCK;
  if (bitRead(SwState, 5)) //-
    mode = ADJUSTMENT;
  if (bitRead(SwState, 4)) //+
    mode = ADJUSTMENT;

  if (elapsed_time + 350 <= millis())
  {
    blinkFlag = blinkFlag ? false : true;
    elapsed_time = millis();
  }

  if (blinkFlag)
  {
    SetSchematicByTimeCode(adj.hour, adj.minute, adj.second);
    nixie.SetSchematic(*schematic);
    return;
  }
  for (int n = 0; n <= 5; n++)
  {
    schematic[n][0] = 10;
    schematic[n][1] = DP_NONE;
  }
  nixie.SetSchematic(*schematic);
}

void mode_ManualAdjustment(uint8_t SwState)
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

void WifiEvent(WiFiEvent_t e)
{
}

void AdjustNtp()
{
  configTime(32400, 0, NTP_SERVER);
  struct tm timeinfo;
  getLocalTime(&timeinfo);
  rtc.SetDateTime(timeinfo.tm_year % 100, timeinfo.tm_mon, timeinfo.tm_mday, timeinfo.tm_hour, timeinfo.tm_min, timeinfo.tm_sec);
}
// Check Internet Connection
void WiFiConnect()
{
  WiFiConnect("", "");
}
void WiFiConnect(char *ssid = "", char *pass = "")
{
  //Connect Wifi
  WiFi.disconnect(true, true);
  if (sizeof(ssid) > 0)
    WiFi.begin(ssid, pass);
  WiFi.begin();
  Serial.println("Tries Connect WiFi");

  uint16_t time = millis();
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print("=");
    delay(250);
    if (time + TIME_OUT <= millis())
    {
      Serial.println("TIMEOUT!!!");
      break;
    }
  }
  Serial.println("Connected!!");
  WiFi.onEvent(WifiEvent);
}
///Str =SSID Password
///Str =
void SetupWiFi(String str)
{
  if (str.length() <= 0)
  {
    Serial.print("Current ESSID= ");
    Serial.println(WiFi.SSID());
    Serial.print("WiFi Connection= ");
    Serial.println(WiFi.isConnected() ? "true" : "false");
    Serial.print("WiFi Channel= ");
    Serial.print(WiFi.channel());

    Serial.print("Local IP Address= ");
    Serial.println(WiFi.localIP().toString());
    Serial.print("/");
    Serial.println(WiFi.subnetMask().toString());
    Serial.println(WiFi.localIPv6().toString());
    Serial.print("Mac Address= ");
    Serial.println(WiFi.macAddress());
    Serial.print("DNS Address= ");
    Serial.println(WiFi.dnsIP().toString());
    return;
  }
  int space = str.indexOf(" ");
  char ssid[32];
  char pass[64];
  str.substring(0, space).toCharArray(ssid, sizeof(ssid) / sizeof(ssid[0]), 0);
  str.substring(++space, str.length()).toCharArray(pass, sizeof(pass) / sizeof(ssid[0]), 0);
  WiFiConnect(ssid, pass);
}
