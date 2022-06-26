#include <Arduino.h>

#define DIVERGENCE_PERIOD 10 //m
#define DIVERGENCE_WHEEL_PERIOD 2 //ms

enum Mode
{
    ADJUSTMENT = 0,
    CLOCK = 1,
    DIVERGENCE = 2,
    NTPADJUSTMENT = 3
};

class Adjustment
{
private:

public:
    uint8_t selectIndex; // Based ON TimeType by DS3234.h
    int year,month,day,hour,minute,second;
};

