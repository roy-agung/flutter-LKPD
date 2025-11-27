import 'package:flutter/material.dart';


class Navigatorpage extends StatefulWidget {
  const Navigatorpage({super.key});

  @override
  State<Navigatorpage> createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigatorpage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NavigatorPage")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text("Menu", style: TextStyle(color: Colors.white)
                ),
              ),
            ),
            ListTile(
              title: Text('pengaturan'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/pengaturan');
              }
            ),
            Divider(),
            ListTile(
              title: Text("Tentang"),
              leading: Icon(Icons.info),
              onTap:() {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/tentang');
              },
            )
          ],
        ),
      ),
     
    );
  }
}
