import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuaiclock/common/clock_theme.dart';
import 'package:shuaiclock/common/providers.dart';
import 'package:shuaiclock/widgets/clock/turnpage_clock.dart';
import 'package:shuaiclock/widgets/menu.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Menu(),
        body: Center(
            child: new SizedBox(
                height: 300,
                child: Consumer<ThemeProvider>(
                    builder: (context, themeProvider, _) {
                  Widget clock;
                  switch (themeProvider.theme) {
                    case ClockTheme.TURN_PAGE:
                      clock = TurnPageClock();
                      break;

                    case ClockTheme.DIGITAL:
                      clock = DigitalClock(
                        areaWidth: 180,
                        areaDecoration: BoxDecoration(),
                        showSecondsDigit: false,
                      );
                      break;

                    default:
                      clock = TurnPageClock();
                  }

                  return clock;
                }))));
  }
}
