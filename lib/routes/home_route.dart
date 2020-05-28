import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shuaiclock/common/clock_theme.dart';
import 'package:shuaiclock/common/providers.dart';
import 'package:shuaiclock/widgets/bottom_menu.dart';
import 'package:shuaiclock/widgets/clock/turnpage_clock.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 2224, height: 1668, allowFontScaling: false);

    // final digitalClock = DigitalClock(
    //   digitAnimationStyle: Curves.decelerate,
    //   areaAligment: AlignmentDirectional.center,
    //   hourMinuteDigitTextStyle: GoogleFonts.bungee(
    //       fontSize: 400.ssp,
    //       textStyle: TextStyle(color: Colors.white),
    //       fontWeight: FontWeight.normal),
    //   areaDecoration: BoxDecoration(),
    //   showSecondsDigit: false,
    // );

    final digitalClock = DigitalClock(
      digitAnimationStyle: Curves.decelerate,
      areaAligment: AlignmentDirectional.center,
      hourMinuteDigitDecoration: BoxDecoration(),
      hourMinuteDigitTextStyle:
          TextStyle(color: Colors.white, fontSize: 500.ssp),
      areaDecoration: BoxDecoration(),
      showSecondsDigit: false,
    );

    final analogClock = AnalogClock(
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black),
          color: Colors.transparent,
          shape: BoxShape.circle),
      isLive: true,
      hourHandColor: Colors.black,
      minuteHandColor: Colors.black,
      showSecondHand: true,
      numberColor: Colors.black87,
      showNumbers: true,
      textScaleFactor: 1.4,
      showTicks: true,
      showDigitalClock: false,
      datetime: DateTime.now(),
    );

    final analogClockSimple = AnalogClock(
      decoration: BoxDecoration(
          border: Border.all(width: 2.ssp, color: Colors.black),
          color: Colors.transparent,
          shape: BoxShape.circle),
      isLive: true,
      hourHandColor: Colors.black,
      minuteHandColor: Colors.black,
      showSecondHand: false,
      numberColor: Colors.black87,
      showNumbers: true,
      textScaleFactor: 1.4,
      showTicks: false,
      showDigitalClock: false,
      datetime: DateTime.now(),
    );

    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      // drawer: Menu(),
      body: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (context) {
              return BottomMenu();
            },
          );
        },
        child: Container(

          color: Theme.of(context).backgroundColor,
          child: Center(
            child:
                Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
              Widget clock;
              switch (themeProvider.clockTheme) {
                case ClockTheme.TURN_PAGE:
                  clock = TurnPageClock();
                  break;

                case ClockTheme.DIGITAL:
                  clock = digitalClock;
                  break;

                case ClockTheme.ANALOG:
                  clock = analogClock;
                  break;

                case ClockTheme.ANALOG_SIMPLE:
                  clock = analogClockSimple;
                  break;

                default:
                  clock = digitalClock;
              }
              return clock;
            }),
          ),
        ),
      ),
    );
  }
}
