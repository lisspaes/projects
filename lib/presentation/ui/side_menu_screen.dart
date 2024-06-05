import 'package:flutter/material.dart';
import 'package:flutter_demostration/items/menu_items.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItem[value];

        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      selectedIndex: navDrawerIndex,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Menu'),
        ),

        ...appMenuItem
        .sublist(0, 3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)
        )),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text('Más opciones'),
        ),
        ...appMenuItem
        .sublist(3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title))
        )
      ],
    );
  }
}