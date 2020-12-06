#include <SPI.h>
#include <Arduino.h>

#define SS 5
//#define SS 16
//#define USE_MILITARY_TIME 1 

enum TimeType : byte
{
    SECOND = 0,
    MINUTE = 1,
    HOUR = 2,
    DAY_OF_WEEK = 3,
    DAY = 4,
    MONTH = 5,
    YEAR = 6
};

class DS3234
{
private:
    SPISettings DS3234Setting;
    //void WriteDataBySPI(uint8_t address,uint8_t data);
    uint8_t ReadDataBySPI(uint8_t address);
public:
    DS3234();

    void SetDateTime(int year, int month, int day, int hour, int min, int sec);

    uint8_t GetTime(TimeType type);
};