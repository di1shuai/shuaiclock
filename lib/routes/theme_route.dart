import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuaiclock/common/global.dart';
import 'package:shuaiclock/common/providers.dart';

class ThemeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Theme"),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //横轴三个子widget
                childAspectRatio: 1.0 //宽高比为1时，子widget
                ),
            itemCount: Global.themes.length,
            itemBuilder: (context, index) {
              return FlatButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context,listen: false).clockThemeIndex = index;
                  },
                  child: Text(Global.themes[index].toString()));
            }));
  }
}
