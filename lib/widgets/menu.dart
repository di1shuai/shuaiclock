import 'package:flutter/material.dart';
import 'package:shuaiclock/common/routes.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.tab),
                    title: const Text('Theme'),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.THEME_ROUTE),
                  ),
                  Divider(),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
