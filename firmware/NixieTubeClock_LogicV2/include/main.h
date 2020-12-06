#include <Arduino.h>


enum Mode
{
    ADJUSTMENT = 0,
    CLOCK = 1,
    DIVERGENCE = 2
};

class Adjustment
{
private:

public:
    uint8_t selectIndex; // Based ON TimeType by DS3234.h
    int year,month,day,hour,minute,second;
};

