

' ============================================================================
' Alarm Clock
'
' Seven Segment display, plus Colon, plus AM/PM sign
' The display is driven from PORT-B, pins 1-7
' The Colon is driven by PORT-B pin 0
'
' The multiplexing of the four digits will be driven by PORTD, pins 0-3
'
' Five inputs are required for the following functions
'
'  Alarm enabled - Contact switch  - PORT-C 0
'  Alarm display/set - Press button - PORT-C 1
'  Fast set - Press button - PORT-C 2
'  Slow set - Press button - PORT-C 3
'  Summer/Winter toggle - Press button - PORT-C 4
'
' ============================================================================

$crystal = 1000000
$regfile = "m88adef.dat"
$hwstack = 40
$swstack = 40
$framesize = 60

' $baud = 4800


Config Sda = Portc.4
Config Scl = Portc.5


' Timer and interrupt Configuration ==========================================

On Pcint0 Pcint0_isr
Pcmsk1.0 = 1
Pcmsk1.1 = 1

Config Timer0 = Timer , Prescale = 256
On Timer0 Renderdisplay_isr
Const Timer0_count = 236                                    '200Hz For The Display


Config Timer1 = Timer , Prescale = 64
On Timer1 Tenthsecondtimer_isr
Const Timer1_tenthsecondcount = 63973                       ' 65535 - 1563


Enable Timer0
Enable Timer1
Enable Pcint0
Enable Interrupts

' I/O Configuration ===========================================================

' Config Portb = Output
' Colon Alias Portb.0
' Alarmset Alias Portb.1
' Buzzer Alias Portb.2

' Port D will represent the BCD value for the numbers to display
' 3 bits.
' 7 6 5 4 3 2 1 0
' D M M M V V V V
' D - Decimal point
' M - Multiplexor value - 3 bits
' V - Value 4 bits

Config Portd = Output

Config Pinc.0 = Input
Second_interrupt Alias Pinb.1
Dim New_second As Bit

Config Pinc.1 = Input
Dcf_interrupt Alias Pinb.2

Config Portb.3 = Output
Led1 Alias Portb.3

Config Portb.4 = Output
Led2 Alias Portb.4

Config Portb.5 = Output
Led3 Alias Portb.5


' RTC-DCF
Const Write_slaveaddress = &H02
Const Read_slaveaddress = &H03
Dim Slaveaddress As Byte


' Holding the values of the time as fields.
Dim Seconds As Byte
Dim Minutes As Byte
Dim Hours As Byte

Dim Hour_bcd As Byte
Dim Minute_bcd As Byte
Dim Second_bcd As Byte

Dim Tmins As Byte
Dim Thours As Byte

Dim Position As Byte
Position = 1

Dim Displaystr As String * 4
Dim Digitstring As String * 1
Dim Tempstr As String * 4
Dim Timestr As String * 4

Dim Value As Byte

Dim Tenthcount As Byte

Dim Time_dcf As Byte
Time_dcf = 250



' Main Loop ===================================================================

Seconds = 0
Minutes = 6
Hours = 18

Displaystr = "1806"

Reset Led1
Reset Led2
Reset Led3



Do
   Slaveaddress = Write_slaveaddress
   I2cstart
   I2cwbyte Slaveaddress
   If Err = 0 Then
      Toggle Led1
      Wait 2
   Else
     Slaveaddress = Slaveaddress + 2
   End If
   Toggle Led2

   I2cstop
Loop Until Err = 0


Reset Led1
Reset Led2
Reset Led3

Tenthcount = 0

Gosub Rtc_dcf_initialisation
' Gosub Write_time_to_dfc

Do
   ' If New_second = 1 Then
   '   New_second = 0

      If Time_dcf = 0 Then
         Gosub Read_time_from_dfc
         Set Led2
         Waitms 500
         Reset Led2
         Gosub Delete_dcf_interrupt_flag
      End If
      If Time_dcf < 250 Then Incr Time_dcf
   ' End If
Loop
End




' Subroutines =================================================================




Rtc_dcf_initialisation:
   I2cstart
   I2cwbyte Write_slaveaddress
   I2cwbyte &H0A
   I2cwbyte &B00000000
   I2cwbyte 0
   I2cwbyte &B00000010
   I2cwbyte &B00000111
   I2cstop
Return



Write_time_to_dfc:
   Hour_bcd = Makebcd(hours)
   Minute_bcd = Makebcd(minutes)
   Second_bcd = 0
   I2cstart
   I2cwbyte Write_slaveaddress
   I2cwbyte &H00
   I2cwbyte Second_bcd
   I2cwbyte Minute_bcd
   I2cwbyte Hour_bcd
   I2cstop
Return


Read_time_from_dfc:
   I2cstart
   I2cwbyte Write_slaveaddress
   I2cwbyte &H00
   I2cstart
   I2cwbyte Read_slaveaddress
   I2crbyte Second_bcd , Ack
   I2crbyte Minute_bcd , Ack
   I2crbyte Hour_bcd , Nack
   I2cstop

   Hours = Makedec(hour_bcd)
   Minutes = Makedec(minute_bcd)
   Seconds = Makedec(second_bcd)

Return

Delete_dcf_interrupt_flag:
   I2cstart
   I2cwbyte Write_slaveaddress
   I2cwbyte &H0E
   I2cwbyte &B00000001
   I2cstop
Return


' Timer ISR ===================================================================

Renderdisplay_isr:                                          '50 Hz
   Timer0 = Timer0_count

   Incr Position
   If Position > 4 Then
      Position = 0
   End If

   Digitstring = Mid(displaystr , Position , 1 )

   Value = Position - 1

   Shift Value , Left , 4
   Value = Value Or Val(digitstring)
   Portd = Value
Return


Pcint0_isr:
   If Second_interrupt = 0 Then New_second = 1
   If Dcf_interrupt = 0 Then Time_dcf = 0
Return


Tenthsecondtimer_isr:
   Timer1 = Timer1_tenthsecondcount

   Incr Tenthcount
   Timestr = Displaystr
   If Tenthcount = 5 Or Tenthcount = 10 Then
      ' Toggle Colonmarker
      Toggle Led3
   End If

   If Tenthcount > 9 Then                                   ' One Second

      Tenthcount = 0
      Timestr = Str(minutes)
      If Len(timestr) < 2 Then Timestr = "0" + Timestr
      Tempstr = Str(hours)
      Timestr = Tempstr + Timestr
      If Len(timestr) < 4 Then Timestr = "0" + Timestr
      Displaystr = Timestr
   End If

 Return
