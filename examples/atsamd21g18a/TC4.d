module atsamd21g18a.tc4;

import atsamd21g18a.mmio;

/*****************************************************************************
 Basic Timer Counter 4
*/
final abstract class TC4 : Peripheral!(0x42003000)
{
    /*****************************************************************************
     8-bit Counter Mode
    */
    final abstract class COUNT8 : Peripheral!(0x42003000)
    {
        /*************************************************************************
         COUNT8 Compare/Capture
        */
        final abstract class CC1 : Register!(0x18)
        {
            /*********************************************************************
             Compare/Capture Value
            */
            alias CC = BitField!(7, 0, Mutability.rw);
        }
        /*************************************************************************
         COUNT8 Compare/Capture
        */
        final abstract class CC2 : Register!(0x19)
        {
            /*********************************************************************
             Compare/Capture Value
            */
            alias CC = BitField!(7, 0, Mutability.rw);
        }

        /*************************************************************************
         COUNT8 Counter Value
        */
        final abstract class COUNT : Register!(0x10)
        {
            /*********************************************************************
             Counter Value
            */
            alias COUNT = BitField!(7, 0, Mutability.rw);
        }

        /*************************************************************************
         COUNT8 Period Value
        */
        final abstract class PER : Register!(0x14)
        {
            /*********************************************************************
             Period Value
            */
            alias PER = BitField!(7, 0, Mutability.rw);
        }

        /*************************************************************************
         Control A
        */
        final abstract class CTRLA : Register!(00)
        {
            /*********************************************************************
             Software Reset
            */
            alias SWRST = Bit!(0, Mutability.w);

            /*********************************************************************
             Enable
            */
            alias ENABLE = Bit!(1, Mutability.rw);

            /*****************************************************************
             MODE's possible values
            */
            enum MODEValues
            {
                /*************************************************************
                 Counter in 16-bit mode
                */
                COUNT16 = 0x0,

                /*************************************************************
                 Counter in 8-bit mode
                */
                COUNT8 = 0x1,

                /*************************************************************
                 Counter in 32-bit mode
                */
                COUNT32 = 0x2,
            }

            /*********************************************************************
             TC Mode
            */
            alias MODE = BitField!(3, 2, Mutability.rw, MODEValues);

            /*****************************************************************
             WAVEGEN's possible values
            */
            enum WAVEGENValues
            {
                NFRQ = 0x0,

                MFRQ = 0x1,

                NPWM = 0x2,

                MPWM = 0x3,
            }

            /*********************************************************************
             Waveform Generation Operation
            */
            alias WAVEGEN = BitField!(6, 5, Mutability.rw, WAVEGENValues);

            /*****************************************************************
             PRESCALER's possible values
            */
            enum PRESCALERValues
            {
                /*************************************************************
                 Prescaler: GCLK_TC
                */
                DIV1 = 0x0,

                /*************************************************************
                 Prescaler: GCLK_TC/2
                */
                DIV2 = 0x1,

                /*************************************************************
                 Prescaler: GCLK_TC/4
                */
                DIV4 = 0x2,

                /*************************************************************
                 Prescaler: GCLK_TC/8
                */
                DIV8 = 0x3,

                /*************************************************************
                 Prescaler: GCLK_TC/16
                */
                DIV16 = 0x4,

                /*************************************************************
                 Prescaler: GCLK_TC/64
                */
                DIV64 = 0x5,

                /*************************************************************
                 Prescaler: GCLK_TC/256
                */
                DIV256 = 0x6,

                /*************************************************************
                 Prescaler: GCLK_TC/1024
                */
                DIV1024 = 0x7,
            }

            /*********************************************************************
             Prescaler
            */
            alias PRESCALER = BitField!(10, 8, Mutability.rw, PRESCALERValues);

            /*********************************************************************
             Run in Standby
            */
            alias RUNSTDBY = Bit!(11, Mutability.rw);

            /*****************************************************************
             PRESCSYNC's possible values
            */
            enum PRESCSYNCValues
            {
                /*************************************************************
                 Reload or reset the counter on next generic clock
                */
                GCLK = 0x0,

                /*************************************************************
                 Reload or reset the counter on next prescaler clock
                */
                PRESC = 0x1,

                /*************************************************************
                 Reload or reset the counter on next generic clock. Reset the prescaler counter
                */
                RESYNC = 0x2,
            }

            /*********************************************************************
             Prescaler and Counter Synchronization
            */
            alias PRESCSYNC = BitField!(13, 12, Mutability.rw, PRESCSYNCValues);
        }

        /*************************************************************************
         Control B Clear
        */
        final abstract class CTRLBCLR : Register!(0x4)
        {
            /*********************************************************************
             Counter Direction
            */
            alias DIR = Bit!(0, Mutability.rw);

            /*********************************************************************
             One-Shot
            */
            alias ONESHOT = Bit!(2, Mutability.rw);

            /*****************************************************************
             CMD's possible values
            */
            enum CMDValues
            {
                /*************************************************************
                 No action
                */
                NONE = 0x0,

                /*************************************************************
                 Force a start, restart or retrigger
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Force a stop
                */
                STOP = 0x2,
            }

            /*********************************************************************
             Command
            */
            alias CMD = BitField!(7, 6, Mutability.rw, CMDValues);
        }

        /*************************************************************************
         Control B Set
        */
        final abstract class CTRLBSET : Register!(0x5)
        {
            /*********************************************************************
             Counter Direction
            */
            alias DIR = Bit!(0, Mutability.rw);

            /*********************************************************************
             One-Shot
            */
            alias ONESHOT = Bit!(2, Mutability.rw);

            /*****************************************************************
             CMD's possible values
            */
            enum CMDValues
            {
                /*************************************************************
                 No action
                */
                NONE = 0x0,

                /*************************************************************
                 Force a start, restart or retrigger
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Force a stop
                */
                STOP = 0x2,
            }

            /*********************************************************************
             Command
            */
            alias CMD = BitField!(7, 6, Mutability.rw, CMDValues);
        }

        /*************************************************************************
         Control C
        */
        final abstract class CTRLC : Register!(0x6)
        {
            /*********************************************************************
             Output Waveform 0 Invert Enable
            */
            alias INVEN0 = Bit!(0, Mutability.rw);

            /*********************************************************************
             Output Waveform 1 Invert Enable
            */
            alias INVEN1 = Bit!(1, Mutability.rw);

            /*********************************************************************
             Capture Channel 0 Enable
            */
            alias CPTEN0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Capture Channel 1 Enable
            */
            alias CPTEN1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Debug Control
        */
        final abstract class DBGCTRL : Register!(0x8)
        {
            /*********************************************************************
             Debug Run Mode
            */
            alias DBGRUN = Bit!(0, Mutability.rw);
        }

        /*************************************************************************
         Event Control
        */
        final abstract class EVCTRL : Register!(0xa)
        {
            /*****************************************************************
             EVACT's possible values
            */
            enum EVACTValues
            {
                /*************************************************************
                 Event action disabled
                */
                OFF = 0x0,

                /*************************************************************
                 Start, restart or retrigger TC on event
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Count on event
                */
                COUNT = 0x2,

                /*************************************************************
                 Start TC on event
                */
                START = 0x3,

                /*************************************************************
                 Period captured in CC0, pulse width in CC1
                */
                PPW = 0x5,

                /*************************************************************
                 Period captured in CC1, pulse width in CC0
                */
                PWP = 0x6,
            }

            /*********************************************************************
             Event Action
            */
            alias EVACT = BitField!(2, 0, Mutability.rw, EVACTValues);

            /*********************************************************************
             TC Inverted Event Input
            */
            alias TCINV = Bit!(4, Mutability.rw);

            /*********************************************************************
             TC Event Input
            */
            alias TCEI = Bit!(5, Mutability.rw);

            /*********************************************************************
             Overflow/Underflow Event Output Enable
            */
            alias OVFEO = Bit!(8, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Event Output Enable
            */
            alias MCEO0 = Bit!(12, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Event Output Enable
            */
            alias MCEO1 = Bit!(13, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Enable Clear
        */
        final abstract class INTENCLR : Register!(0xc)
        {
            /*********************************************************************
             Overflow Interrupt Enable
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error Interrupt Enable
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready Interrupt Enable
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Interrupt Enable
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Interrupt Enable
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Enable Set
        */
        final abstract class INTENSET : Register!(0xd)
        {
            /*********************************************************************
             Overflow Interrupt Enable
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error Interrupt Enable
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready Interrupt Enable
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Interrupt Enable
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Interrupt Enable
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Flag Status and Clear
        */
        final abstract class INTFLAG : Register!(0xe)
        {
            /*********************************************************************
             Overflow
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Read Request
        */
        final abstract class READREQ : Register!(0x2)
        {
            /*********************************************************************
             Address
            */
            alias ADDR = BitField!(4, 0, Mutability.rw);

            /*********************************************************************
             Read Continuously
            */
            alias RCONT = Bit!(14, Mutability.rw);

            /*********************************************************************
             Read Request
            */
            alias RREQ = Bit!(15, Mutability.rw);
        }

        /*************************************************************************
         Status
        */
        final abstract class STATUS : Register!(0xf)
        {
            /*********************************************************************
             Stop
            */
            alias STOP = Bit!(3, Mutability.r);

            /*********************************************************************
             Slave
            */
            alias SLAVE = Bit!(4, Mutability.r);

            /*********************************************************************
             Synchronization Busy
            */
            alias SYNCBUSY = Bit!(7, Mutability.r);
        }
    }
    /*****************************************************************************
     16-bit Counter Mode
    */
    final abstract class COUNT16 : Peripheral!(0x42003000)
    {
        /*************************************************************************
         COUNT16 Compare/Capture
        */
        final abstract class CC1 : Register!(0x18)
        {
            /*********************************************************************
             Compare/Capture Value
            */
            alias CC = BitField!(15, 0, Mutability.rw);
        }
        /*************************************************************************
         COUNT16 Compare/Capture
        */
        final abstract class CC2 : Register!(0x1a)
        {
            /*********************************************************************
             Compare/Capture Value
            */
            alias CC = BitField!(15, 0, Mutability.rw);
        }

        /*************************************************************************
         COUNT16 Counter Value
        */
        final abstract class COUNT : Register!(0x10)
        {
            /*********************************************************************
             Count Value
            */
            alias COUNT = BitField!(15, 0, Mutability.rw);
        }

        /*************************************************************************
         Control A
        */
        final abstract class CTRLA : Register!(00)
        {
            /*********************************************************************
             Software Reset
            */
            alias SWRST = Bit!(0, Mutability.w);

            /*********************************************************************
             Enable
            */
            alias ENABLE = Bit!(1, Mutability.rw);

            /*****************************************************************
             MODE's possible values
            */
            enum MODEValues
            {
                /*************************************************************
                 Counter in 16-bit mode
                */
                COUNT16 = 0x0,

                /*************************************************************
                 Counter in 8-bit mode
                */
                COUNT8 = 0x1,

                /*************************************************************
                 Counter in 32-bit mode
                */
                COUNT32 = 0x2,
            }

            /*********************************************************************
             TC Mode
            */
            alias MODE = BitField!(3, 2, Mutability.rw, MODEValues);

            /*****************************************************************
             WAVEGEN's possible values
            */
            enum WAVEGENValues
            {
                NFRQ = 0x0,

                MFRQ = 0x1,

                NPWM = 0x2,

                MPWM = 0x3,
            }

            /*********************************************************************
             Waveform Generation Operation
            */
            alias WAVEGEN = BitField!(6, 5, Mutability.rw, WAVEGENValues);

            /*****************************************************************
             PRESCALER's possible values
            */
            enum PRESCALERValues
            {
                /*************************************************************
                 Prescaler: GCLK_TC
                */
                DIV1 = 0x0,

                /*************************************************************
                 Prescaler: GCLK_TC/2
                */
                DIV2 = 0x1,

                /*************************************************************
                 Prescaler: GCLK_TC/4
                */
                DIV4 = 0x2,

                /*************************************************************
                 Prescaler: GCLK_TC/8
                */
                DIV8 = 0x3,

                /*************************************************************
                 Prescaler: GCLK_TC/16
                */
                DIV16 = 0x4,

                /*************************************************************
                 Prescaler: GCLK_TC/64
                */
                DIV64 = 0x5,

                /*************************************************************
                 Prescaler: GCLK_TC/256
                */
                DIV256 = 0x6,

                /*************************************************************
                 Prescaler: GCLK_TC/1024
                */
                DIV1024 = 0x7,
            }

            /*********************************************************************
             Prescaler
            */
            alias PRESCALER = BitField!(10, 8, Mutability.rw, PRESCALERValues);

            /*********************************************************************
             Run in Standby
            */
            alias RUNSTDBY = Bit!(11, Mutability.rw);

            /*****************************************************************
             PRESCSYNC's possible values
            */
            enum PRESCSYNCValues
            {
                /*************************************************************
                 Reload or reset the counter on next generic clock
                */
                GCLK = 0x0,

                /*************************************************************
                 Reload or reset the counter on next prescaler clock
                */
                PRESC = 0x1,

                /*************************************************************
                 Reload or reset the counter on next generic clock. Reset the prescaler counter
                */
                RESYNC = 0x2,
            }

            /*********************************************************************
             Prescaler and Counter Synchronization
            */
            alias PRESCSYNC = BitField!(13, 12, Mutability.rw, PRESCSYNCValues);
        }

        /*************************************************************************
         Control B Clear
        */
        final abstract class CTRLBCLR : Register!(0x4)
        {
            /*********************************************************************
             Counter Direction
            */
            alias DIR = Bit!(0, Mutability.rw);

            /*********************************************************************
             One-Shot
            */
            alias ONESHOT = Bit!(2, Mutability.rw);

            /*****************************************************************
             CMD's possible values
            */
            enum CMDValues
            {
                /*************************************************************
                 No action
                */
                NONE = 0x0,

                /*************************************************************
                 Force a start, restart or retrigger
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Force a stop
                */
                STOP = 0x2,
            }

            /*********************************************************************
             Command
            */
            alias CMD = BitField!(7, 6, Mutability.rw, CMDValues);
        }

        /*************************************************************************
         Control B Set
        */
        final abstract class CTRLBSET : Register!(0x5)
        {
            /*********************************************************************
             Counter Direction
            */
            alias DIR = Bit!(0, Mutability.rw);

            /*********************************************************************
             One-Shot
            */
            alias ONESHOT = Bit!(2, Mutability.rw);

            /*****************************************************************
             CMD's possible values
            */
            enum CMDValues
            {
                /*************************************************************
                 No action
                */
                NONE = 0x0,

                /*************************************************************
                 Force a start, restart or retrigger
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Force a stop
                */
                STOP = 0x2,
            }

            /*********************************************************************
             Command
            */
            alias CMD = BitField!(7, 6, Mutability.rw, CMDValues);
        }

        /*************************************************************************
         Control C
        */
        final abstract class CTRLC : Register!(0x6)
        {
            /*********************************************************************
             Output Waveform 0 Invert Enable
            */
            alias INVEN0 = Bit!(0, Mutability.rw);

            /*********************************************************************
             Output Waveform 1 Invert Enable
            */
            alias INVEN1 = Bit!(1, Mutability.rw);

            /*********************************************************************
             Capture Channel 0 Enable
            */
            alias CPTEN0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Capture Channel 1 Enable
            */
            alias CPTEN1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Debug Control
        */
        final abstract class DBGCTRL : Register!(0x8)
        {
            /*********************************************************************
             Debug Run Mode
            */
            alias DBGRUN = Bit!(0, Mutability.rw);
        }

        /*************************************************************************
         Event Control
        */
        final abstract class EVCTRL : Register!(0xa)
        {
            /*****************************************************************
             EVACT's possible values
            */
            enum EVACTValues
            {
                /*************************************************************
                 Event action disabled
                */
                OFF = 0x0,

                /*************************************************************
                 Start, restart or retrigger TC on event
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Count on event
                */
                COUNT = 0x2,

                /*************************************************************
                 Start TC on event
                */
                START = 0x3,

                /*************************************************************
                 Period captured in CC0, pulse width in CC1
                */
                PPW = 0x5,

                /*************************************************************
                 Period captured in CC1, pulse width in CC0
                */
                PWP = 0x6,
            }

            /*********************************************************************
             Event Action
            */
            alias EVACT = BitField!(2, 0, Mutability.rw, EVACTValues);

            /*********************************************************************
             TC Inverted Event Input
            */
            alias TCINV = Bit!(4, Mutability.rw);

            /*********************************************************************
             TC Event Input
            */
            alias TCEI = Bit!(5, Mutability.rw);

            /*********************************************************************
             Overflow/Underflow Event Output Enable
            */
            alias OVFEO = Bit!(8, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Event Output Enable
            */
            alias MCEO0 = Bit!(12, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Event Output Enable
            */
            alias MCEO1 = Bit!(13, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Enable Clear
        */
        final abstract class INTENCLR : Register!(0xc)
        {
            /*********************************************************************
             Overflow Interrupt Enable
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error Interrupt Enable
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready Interrupt Enable
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Interrupt Enable
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Interrupt Enable
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Enable Set
        */
        final abstract class INTENSET : Register!(0xd)
        {
            /*********************************************************************
             Overflow Interrupt Enable
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error Interrupt Enable
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready Interrupt Enable
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Interrupt Enable
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Interrupt Enable
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Flag Status and Clear
        */
        final abstract class INTFLAG : Register!(0xe)
        {
            /*********************************************************************
             Overflow
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Read Request
        */
        final abstract class READREQ : Register!(0x2)
        {
            /*********************************************************************
             Address
            */
            alias ADDR = BitField!(4, 0, Mutability.rw);

            /*********************************************************************
             Read Continuously
            */
            alias RCONT = Bit!(14, Mutability.rw);

            /*********************************************************************
             Read Request
            */
            alias RREQ = Bit!(15, Mutability.rw);
        }

        /*************************************************************************
         Status
        */
        final abstract class STATUS : Register!(0xf)
        {
            /*********************************************************************
             Stop
            */
            alias STOP = Bit!(3, Mutability.r);

            /*********************************************************************
             Slave
            */
            alias SLAVE = Bit!(4, Mutability.r);

            /*********************************************************************
             Synchronization Busy
            */
            alias SYNCBUSY = Bit!(7, Mutability.r);
        }
    }
    /*****************************************************************************
     32-bit Counter Mode
    */
    final abstract class COUNT32 : Peripheral!(0x42003000)
    {
        /*************************************************************************
         COUNT32 Compare/Capture
        */
        final abstract class CC1 : Register!(0x18)
        {
            /*********************************************************************
             Compare/Capture Value
            */
            alias CC = BitField!(31, 0, Mutability.rw);
        }
        /*************************************************************************
         COUNT32 Compare/Capture
        */
        final abstract class CC2 : Register!(0x1c)
        {
            /*********************************************************************
             Compare/Capture Value
            */
            alias CC = BitField!(31, 0, Mutability.rw);
        }

        /*************************************************************************
         COUNT32 Counter Value
        */
        final abstract class COUNT : Register!(0x10)
        {
            /*********************************************************************
             Count Value
            */
            alias COUNT = BitField!(31, 0, Mutability.rw);
        }

        /*************************************************************************
         Control A
        */
        final abstract class CTRLA : Register!(00)
        {
            /*********************************************************************
             Software Reset
            */
            alias SWRST = Bit!(0, Mutability.w);

            /*********************************************************************
             Enable
            */
            alias ENABLE = Bit!(1, Mutability.rw);

            /*****************************************************************
             MODE's possible values
            */
            enum MODEValues
            {
                /*************************************************************
                 Counter in 16-bit mode
                */
                COUNT16 = 0x0,

                /*************************************************************
                 Counter in 8-bit mode
                */
                COUNT8 = 0x1,

                /*************************************************************
                 Counter in 32-bit mode
                */
                COUNT32 = 0x2,
            }

            /*********************************************************************
             TC Mode
            */
            alias MODE = BitField!(3, 2, Mutability.rw, MODEValues);

            /*****************************************************************
             WAVEGEN's possible values
            */
            enum WAVEGENValues
            {
                NFRQ = 0x0,

                MFRQ = 0x1,

                NPWM = 0x2,

                MPWM = 0x3,
            }

            /*********************************************************************
             Waveform Generation Operation
            */
            alias WAVEGEN = BitField!(6, 5, Mutability.rw, WAVEGENValues);

            /*****************************************************************
             PRESCALER's possible values
            */
            enum PRESCALERValues
            {
                /*************************************************************
                 Prescaler: GCLK_TC
                */
                DIV1 = 0x0,

                /*************************************************************
                 Prescaler: GCLK_TC/2
                */
                DIV2 = 0x1,

                /*************************************************************
                 Prescaler: GCLK_TC/4
                */
                DIV4 = 0x2,

                /*************************************************************
                 Prescaler: GCLK_TC/8
                */
                DIV8 = 0x3,

                /*************************************************************
                 Prescaler: GCLK_TC/16
                */
                DIV16 = 0x4,

                /*************************************************************
                 Prescaler: GCLK_TC/64
                */
                DIV64 = 0x5,

                /*************************************************************
                 Prescaler: GCLK_TC/256
                */
                DIV256 = 0x6,

                /*************************************************************
                 Prescaler: GCLK_TC/1024
                */
                DIV1024 = 0x7,
            }

            /*********************************************************************
             Prescaler
            */
            alias PRESCALER = BitField!(10, 8, Mutability.rw, PRESCALERValues);

            /*********************************************************************
             Run in Standby
            */
            alias RUNSTDBY = Bit!(11, Mutability.rw);

            /*****************************************************************
             PRESCSYNC's possible values
            */
            enum PRESCSYNCValues
            {
                /*************************************************************
                 Reload or reset the counter on next generic clock
                */
                GCLK = 0x0,

                /*************************************************************
                 Reload or reset the counter on next prescaler clock
                */
                PRESC = 0x1,

                /*************************************************************
                 Reload or reset the counter on next generic clock. Reset the prescaler counter
                */
                RESYNC = 0x2,
            }

            /*********************************************************************
             Prescaler and Counter Synchronization
            */
            alias PRESCSYNC = BitField!(13, 12, Mutability.rw, PRESCSYNCValues);
        }

        /*************************************************************************
         Control B Clear
        */
        final abstract class CTRLBCLR : Register!(0x4)
        {
            /*********************************************************************
             Counter Direction
            */
            alias DIR = Bit!(0, Mutability.rw);

            /*********************************************************************
             One-Shot
            */
            alias ONESHOT = Bit!(2, Mutability.rw);

            /*****************************************************************
             CMD's possible values
            */
            enum CMDValues
            {
                /*************************************************************
                 No action
                */
                NONE = 0x0,

                /*************************************************************
                 Force a start, restart or retrigger
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Force a stop
                */
                STOP = 0x2,
            }

            /*********************************************************************
             Command
            */
            alias CMD = BitField!(7, 6, Mutability.rw, CMDValues);
        }

        /*************************************************************************
         Control B Set
        */
        final abstract class CTRLBSET : Register!(0x5)
        {
            /*********************************************************************
             Counter Direction
            */
            alias DIR = Bit!(0, Mutability.rw);

            /*********************************************************************
             One-Shot
            */
            alias ONESHOT = Bit!(2, Mutability.rw);

            /*****************************************************************
             CMD's possible values
            */
            enum CMDValues
            {
                /*************************************************************
                 No action
                */
                NONE = 0x0,

                /*************************************************************
                 Force a start, restart or retrigger
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Force a stop
                */
                STOP = 0x2,
            }

            /*********************************************************************
             Command
            */
            alias CMD = BitField!(7, 6, Mutability.rw, CMDValues);
        }

        /*************************************************************************
         Control C
        */
        final abstract class CTRLC : Register!(0x6)
        {
            /*********************************************************************
             Output Waveform 0 Invert Enable
            */
            alias INVEN0 = Bit!(0, Mutability.rw);

            /*********************************************************************
             Output Waveform 1 Invert Enable
            */
            alias INVEN1 = Bit!(1, Mutability.rw);

            /*********************************************************************
             Capture Channel 0 Enable
            */
            alias CPTEN0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Capture Channel 1 Enable
            */
            alias CPTEN1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Debug Control
        */
        final abstract class DBGCTRL : Register!(0x8)
        {
            /*********************************************************************
             Debug Run Mode
            */
            alias DBGRUN = Bit!(0, Mutability.rw);
        }

        /*************************************************************************
         Event Control
        */
        final abstract class EVCTRL : Register!(0xa)
        {
            /*****************************************************************
             EVACT's possible values
            */
            enum EVACTValues
            {
                /*************************************************************
                 Event action disabled
                */
                OFF = 0x0,

                /*************************************************************
                 Start, restart or retrigger TC on event
                */
                RETRIGGER = 0x1,

                /*************************************************************
                 Count on event
                */
                COUNT = 0x2,

                /*************************************************************
                 Start TC on event
                */
                START = 0x3,

                /*************************************************************
                 Period captured in CC0, pulse width in CC1
                */
                PPW = 0x5,

                /*************************************************************
                 Period captured in CC1, pulse width in CC0
                */
                PWP = 0x6,
            }

            /*********************************************************************
             Event Action
            */
            alias EVACT = BitField!(2, 0, Mutability.rw, EVACTValues);

            /*********************************************************************
             TC Inverted Event Input
            */
            alias TCINV = Bit!(4, Mutability.rw);

            /*********************************************************************
             TC Event Input
            */
            alias TCEI = Bit!(5, Mutability.rw);

            /*********************************************************************
             Overflow/Underflow Event Output Enable
            */
            alias OVFEO = Bit!(8, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Event Output Enable
            */
            alias MCEO0 = Bit!(12, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Event Output Enable
            */
            alias MCEO1 = Bit!(13, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Enable Clear
        */
        final abstract class INTENCLR : Register!(0xc)
        {
            /*********************************************************************
             Overflow Interrupt Enable
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error Interrupt Enable
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready Interrupt Enable
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Interrupt Enable
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Interrupt Enable
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Enable Set
        */
        final abstract class INTENSET : Register!(0xd)
        {
            /*********************************************************************
             Overflow Interrupt Enable
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error Interrupt Enable
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready Interrupt Enable
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0 Interrupt Enable
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1 Interrupt Enable
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Interrupt Flag Status and Clear
        */
        final abstract class INTFLAG : Register!(0xe)
        {
            /*********************************************************************
             Overflow
            */
            alias OVF = Bit!(0, Mutability.rw);

            /*********************************************************************
             Error
            */
            alias ERR = Bit!(1, Mutability.rw);

            /*********************************************************************
             Synchronization Ready
            */
            alias SYNCRDY = Bit!(3, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 0
            */
            alias MC0 = Bit!(4, Mutability.rw);

            /*********************************************************************
             Match or Capture Channel 1
            */
            alias MC1 = Bit!(5, Mutability.rw);
        }

        /*************************************************************************
         Read Request
        */
        final abstract class READREQ : Register!(0x2)
        {
            /*********************************************************************
             Address
            */
            alias ADDR = BitField!(4, 0, Mutability.rw);

            /*********************************************************************
             Read Continuously
            */
            alias RCONT = Bit!(14, Mutability.rw);

            /*********************************************************************
             Read Request
            */
            alias RREQ = Bit!(15, Mutability.rw);
        }

        /*************************************************************************
         Status
        */
        final abstract class STATUS : Register!(0xf)
        {
            /*********************************************************************
             Stop
            */
            alias STOP = Bit!(3, Mutability.r);

            /*********************************************************************
             Slave
            */
            alias SLAVE = Bit!(4, Mutability.r);

            /*********************************************************************
             Synchronization Busy
            */
            alias SYNCBUSY = Bit!(7, Mutability.r);
        }
    }
}
