%define SCAN_ESC		0x01
%define SCAN_1			0x02
%define SCAN_2			0x03
%define SCAN_3			0x04
%define SCAN_4			0x05
%define SCAN_5			0x06
%define SCAN_6			0x07
%define SCAN_7			0x08
%define SCAN_8			0x09
%define SCAN_9			0x0A
%define SCAN_0			0x0B
%define SCAN_DASH		0x0C
%define SCAN_EQU		0x0D
%define SCAN_BACK		0x0E
%define SCAN_TAB		0x0F
%define SCAN_Q			0x10
%define SCAN_W			0x11
%define SCAN_E			0x12
%define SCAN_R			0x13
%define SCAN_T			0x14
%define SCAN_Y			0x15
%define SCAN_U			0x16
%define SCAN_I			0x17
%define SCAN_O			0x18
%define SCAN_P			0x19
%define SCAN_LSQRBCK	0x1A
%define SCAN_RSQRBCK	0x1B
%define SCAN_ENTER		0x1C
%define SCAN_CTRL		0x1D ; Don't use this, use BIT_CTRL instead.
%define SCAN_A			0x1E
%define SCAN_S			0x1F
%define SCAN_D			0x20
%define SCAN_F			0x21
%define SCAN_G			0x22
%define SCAN_H			0x23
%define SCAN_J			0x24
%define SCAN_K			0x25
%define SCAN_L			0x26
%define SCAN_SEMI		0x27
%define SCAN_PRIME		0x28
%define SCAN_GRAVE		0x29
%define SCAN_SHIFT		0x2A ; Don't use this, use BIT_LSHIFT or BIT_RSHIFT instead.
%define SCAN_BSLASH		0x2B
%define SCAN_Z			0x2C
%define SCAN_X			0x2D
%define SCAN_C			0x2E
%define SCAN_V			0x2F
%define SCAN_B			0x30
%define SCAN_N			0x31
%define SCAN_M			0x32
%define SCAN_COMMA		0x33
%define SCAN_DOT		0x34
%define SCAN_SLASH		0x35
; TO-DO missing 0x36???
%define SCAN_NUM_TIMES	0x37
%define SCAN_ALT		0x38 ; Don't use this, use BIT_ALT instead.
%define SCAN_SPACE		0x39
%define SCAN_CAPS		0x3A ; Don't use this, use BIT_CAPS instead.
%define SCAN_F1			0x3B
%define SCAN_F2			0x3C
%define SCAN_F3			0x3D
%define SCAN_F4			0x3E
%define SCAN_F5			0x3F
%define SCAN_F6			0x40
%define SCAN_F7			0x41
%define SCAN_F8			0x42
%define SCAN_F9			0x43
%define SCAN_F10		0x44
%define SPEC_F11		0x85 ; \ Special keys, that use a different
%define SPEC_F12		0x86 ; / interrupt because OF COURSE THEY DO.
%define SCAN_NUM		0x45 ; Don't use this, BIT_NUM instead.
%define SCAN_SCROLL		0x46 ; Don't use this, BIT_SCROLL instead.
%define SCAN_HOME		0x47
%define SCAN_UP			0x48
%define SCAN_PGUP		0x49
%define SCAN_NUM_MINUS	0x4A
%define SCAN_LEFT		0x4B
%define SCAN_NUM_CENTER	0x4C
%define SCAN_NUM_MINUS	0x4D
%define SCAN_NUM_PLUS	0x4E
%define SCAN_END		0x4F
%define SCAN_DOWN		0x50
%define SCAN_PGDN		0x51
%define SCAN_INS		0x52
%define SCAN_DEL		0x53
; SysReq doesn't have an entry what
%define BIT_INS			0x80
%define BIT_CAPS		0x40
%define BIT_NUM			0x20
%define BIT_SCROLL		0x10
%define BIT_ALT			0x08
%define BIT_CTRL		0x04
%define BIT_LSHIFT		0x02
%define BIT_RSHIFT		0x01
