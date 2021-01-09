#include <Arduino.h>
//Set TubeIndex Shift Register's Pin assign
#define DISPLAY_SER 32 //6
#define DISPLAY_SCLK 14 //5
#define DISPLAY_RCLK 13 //4
//Set show Number
#define NUM_SER 33  //11
#define NUM_SCLK 25 //12
#define NUM_RCLK 27 //14
#define NUM_CLR 26 //13

#define OFF_TIME 300 //Micro Seconds
#define ON_TIME 500 //Micro Seconds

class Nixie
{
private:
    bool isDpShow[6];
    int _schematic[6][2]; //In [0] discribe Numerial 0-9 / In [1] discribe dp 0=none 1=ldp 2=rdp 3=both

    const int numCode[11] = {
        0b000000000001, //0
        0b001000000000, //1
        0b000100000000, //2
        0b000010000000, //3
        0b000001000000, //4
        0b000000100000, //5
        0b000000010000, //6
        0b000000001000, //7
        0b000000000100, //8
        0b000000000010,  //9
        0x000//none
    };

    const uint8_t indexCode[6] = {
        0b00000001,
        0b00000010,
        0b00000100,
        0b00001000,
        0b00010000,
        0b00100000,
    };

    int GetShiftCode(int number[2]);
    int JudgeDpCode(int code, int dpcode);
    void ActivateRegister(int pin_register);

public:
    Nixie();
    void ShowDisplay();
    bool SetSchematic(int* schematic);
};

enum DP_MODE
{
    DP_NONE = 0, DP_LDP = 1, DP_RDP = 2, DP_BOTH = 3
};
