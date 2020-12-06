#include "../include/DriveBoard.h"

uint8_t DriveBoard::ReadKeyState()
{
    uint8_t c_keyState = (digitalRead(SW_ACCEPT) & 0x01) << 3 |
                         (digitalRead(SW_BACK) & 0x01) << 2 |
                         (digitalRead(SW_N) & 0x01) << 1 |
                         (digitalRead(SW_P) & 0x01);
    uint8_t diff = c_keyState & ~p_keyState;

    p_keyState = c_keyState;
    c_keyState = (diff << 4) + c_keyState;

    // if (diff > 0)
    // {
    //     Serial.println(diff, HEX);
    //     Serial.println(c_keyState, HEX);
    // }
    return c_keyState;
}

DriveBoard::DriveBoard()
{
    pinMode(SW_ACCEPT, INPUT);
    pinMode(SW_BACK, INPUT);
    pinMode(SW_N, INPUT);
    pinMode(SW_P, INPUT);
    pinMode(Vvol, INPUT);

    Wire.begin(EEPROM_SDA, EEPROM_SCL, 200000); //EEPROM Clock Speed = 400kHz
    Wire.beginTransmission(0x01);
}
float DriveBoard::MesureVoltage()
{
    //return analogRead(Vvol);
    return ((float)analogRead(Vvol) / (float)4096) * 3.3F * 63.6667F;
}

void DriveBoard::SetSettingToROM(uint16_t addr, uint8_t *value)
{
    Wire.begin(EEPROM_SDA, EEPROM_SCL, 200000); //EEPROM Clock Speed = 400kHz
    Wire.beginTransmission(0x01);
    //**** Set ADDR ****//
    Wire.write(addr >> 8);
    Wire.write(addr & 0xFF);
    //**** Transfer Value ****//
    Wire.write(value, sizeof(value));

    Wire.endTransmission(true);
}

uint8_t* DriveBoard::LoadSettingByROM(uint16_t addr, uint16_t size)
{
    uint8_t buffer[16];
    Wire.begin(EEPROM_SDA, EEPROM_SCL, 200000); //EEPROM Clock Speed = 400kHz
    Wire.beginTransmission(0x01);
    //**** Set ADDR ****//
    Wire.write(addr >> 8);
    Wire.write(addr & 0xFF);
    //**** Transfer Value ****//
    Wire.readBytes(buffer, (size_t)size);
    Wire.endTransmission(true);
    return buffer;
}

DriveBoard::~DriveBoard()
{
}
