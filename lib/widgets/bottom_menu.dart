import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuaiclock/common/global.dart';
import 'package:shuaiclock/common/providers.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 300,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, //横轴三个子widget
              childAspectRatio: 1.0 //宽高比为1时，子widget
              ),
          itemCount: Global.themes.length,
          itemBuilder: (context, index) {
            return FlatButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .clockThemeIndex = index;
                },
                child: Text(Global.themes[index].toString()));
          }),
    );
  }
}
