import 'package:flutter/material.dart';
// import 'package:flutter_demostration/configuration/firebase_crud.dart';
import 'package:flutter_demostration/items/menu_items.dart';
import 'package:flutter_demostration/presentation/ui/side_menu_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {

  static const String name = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    // @override
    // void initState() {
    //   FirebaseCRUD.saveToken();
    //   super.initState();
      
    // }

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

  

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Flutter demo"),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItem.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItem[index];
        return _CustomListTile(menuItem: menuItem);

      },
    );
  }
}


class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(menuItem.icon),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}


