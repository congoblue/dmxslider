
#define SHOWTIMEPANEL 40


#define DEVICE SHOWTIMEPANEL

#if DEVICE==SHOWTIMEPANEL
    #define DEVICE_NAME "Showtime Panel"
    #define DEVICE_NAME_WIFI "ShowtimePanel"
    #define VERSION 0
    #define SUBVERSION 1
    #define BUILDNUMBER 14
#else
    #define DEVICE_NAME "Device"
    #define DEVICE_NAME_WIFI "Device"
    #define VERSION 0
    #define SUBVERSION 1
    #define BUILDNUMBER 0004
#endif

//#define RGBWPIX 1


// Touchscreen Calibration and EEPROM Storage Defines
#define CFG_EEPROM_TOUCHSCREEN_CAL_AN 0       ///< EEPROM Storage Location
#define CFG_EEPROM_TOUCHSCREEN_CAL_BN 4       ///< EEPROM Storage Location
#define CFG_EEPROM_TOUCHSCREEN_CAL_CN 8       ///< EEPROM Storage Location
#define CFG_EEPROM_TOUCHSCREEN_CAL_DN 12      ///< EEPROM Storage Location
#define CFG_EEPROM_TOUCHSCREEN_CAL_EN 16      ///< EEPROM Storage Location
#define CFG_EEPROM_TOUCHSCREEN_CAL_FN 20      ///< EEPROM Storage Location
#define CFG_EEPROM_TOUCHSCREEN_CAL_DIVIDER 24 ///< EEPROM Storage Location
#define CFG_EEPROM_TOUCHSCREEN_CALIBRATED 28  ///< EEPROM Storage Location

#define EEPROM_SSID 32 //32
#define EEPROM_PWD 64 //16
#define EEPROM_WIFIMODE 80

#define EEPROM_USERPARAM_SIG 96
#define EEPROM_TW_SPEED 97
#define EEPROM_TW_FADE 98
#define EEPROM_TW_VOLUME 99
#define EEPROM_TW_COLOUR 100
#define EEPROM_TW_PATTERN 101
#define EEPROM_TW_DIMMER 102
#define EEPROM_TW_USERPROG 103
#define EEPROM_TW_MIDISONG 104
#define EEPROM_USERCOUNT 105

#define EEPROM_PAIR_TABLE 128 //16*8 bytes = 128
#define MAX_PAIR 8

#define EEPROM_DEVICE_PAIR 256 //32*8 bytes = 256
#define MAX_DEVICE_PAIR 32 //this allows 4 devices for each of the 8 switches

#define X_RESET 1
#define LEDDA0 2
#define MIDITX 4
#define SD_EN 5
#define D_CS 12
#define D_SCK 13
#define D_MOSI 14
#define TXRX 15
#define D_RXD 16
#define D_TXD 17
#define S_SCK 18
#define S_MISO 19
#define D_SDA 21
#define D_SCL 22
#define LEDG 21
#define LEDR 22
#define S_MOSI 23
#define LATCH 25
#define XCS 26
#define XDCS 27
#define RCK 32
#define CK 33
#define DI 34
#define DREQ 35 //(was 25 on proto)
#define D_DC 39
