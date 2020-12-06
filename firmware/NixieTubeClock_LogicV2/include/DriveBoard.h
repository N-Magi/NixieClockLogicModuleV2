#include <Arduino.h>
#include <Wire.h>

#define SW_ACCEPT 12
#define SW_BACK 35
#define SW_N 15
#define SW_P 34
#define Vvol 36

#define EEPROM_SDA 21
#define EEPROM_SCL 22

class DriveBoard
{
private:
    uint8_t p_keyState = 0;

public:
    uint8_t ReadKeyState();
    float MesureVoltage();

    void SetSettingToROM(uint16_t addr, uint8_t* value);
    uint8_t* LoadSettingByROM(uint16_t addr, uint16_t size);

    DriveBoard(/* args */);
    ~DriveBoard();
};

