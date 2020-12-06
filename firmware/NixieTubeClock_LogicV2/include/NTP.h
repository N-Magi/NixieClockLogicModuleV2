#include <Arduino.h>
#include <WiFiUdp.h>
#include <WiFi.h>
#include <IPAddress.h>

typedef struct NtpPacket
{
    int LI = 2; //2
    int VN = 4;
    int Mode = 3;
    int Stratum = 16;
    int POll;
    int Precision;
    uint32_t RootDelay;
    uint32_t RootDispersion;
    uint32_t ReferenceId;
    uint64_t ReferenceTimestamp;
    uint64_t OriginTimestamp;
    uint64_t ReceiveTimestamp;
    uint64_t TransmitTimestamp;
    
    static NtpPacket ConvertFromBytes(byte* buffer);
    static void ConvertToBytes(NtpPacket packet, byte *result);
} NtpPacket_t;

class NTP
{
private:
    IPAddress _address;
    WiFiUDP udp;
    const int port = 123;
    byte ntpPacket[48];

public:
    NtpPacket_t SendPacket(NtpPacket_t packet);
    NTP(IPAddress addr);
    ~NTP();
};
