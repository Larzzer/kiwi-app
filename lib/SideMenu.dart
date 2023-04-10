import 'package:flutter/material.dart';
import 'package:eksamesprojekt_kiwi_app/LogBookPage.dart';
import 'package:eksamesprojekt_kiwi_app/TurOprettelse.dart';
import 'package:eksamesprojekt_kiwi_app/MedlemsKartotek.dart';
import 'package:eksamesprojekt_kiwi_app/BrændstofsForbrug.dart';
import 'package:eksamesprojekt_kiwi_app/Gps.dart';
import 'package:eksamesprojekt_kiwi_app/BilledeUpload.dart';
import 'package:eksamesprojekt_kiwi_app/PresailCheck.dart';
import 'package:eksamesprojekt_kiwi_app/Kommunikation.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('John Doe'),
            accountEmail: const Text('johndoe@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.JPG'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.houseboat_sharp),
            title: const Text('Tur oprettelse'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TurOprettelse()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics_outlined),
            title: const Text('Logbog'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogbookPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text('Medlemskartotek'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Medlemskartotek()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_gas_station_outlined),
            title: const Text('Brændstofsforbrug'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BraendstofsForbrug()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('GPS'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Gps()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_a_photo_outlined),
            title: const Text('Billedupload'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BilledeUpload()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_box_outlined),
            title: const Text('Presail check'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PresailCheck()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text('Kommunikation'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Kommunikation()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiwi'),
      ),
      drawer: const SideMenu(title: 'Kiwi'),
      body: const Center(
        child: Text('Welcome to Kiwi!'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Kiwi App',
    home: HomePage(),
  ));
}