import 'package:flutter/material.dart';
import 'SideMenu.dart';
import 'package:eksamesprojekt_kiwi_app/LogBookPage.dart';
import 'package:eksamesprojekt_kiwi_app/TurOprettelse.dart';
import 'package:eksamesprojekt_kiwi_app/MedlemsKartotek.dart';
import 'package:eksamesprojekt_kiwi_app/BrændstofsForbrug.dart';
import 'package:eksamesprojekt_kiwi_app/Gps.dart';
import 'package:eksamesprojekt_kiwi_app/BilledeUpload.dart';
import 'package:eksamesprojekt_kiwi_app/PresailCheck.dart';
import 'package:eksamesprojekt_kiwi_app/Kommunikation.dart';
class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(title: 'Menu'),
      appBar: AppBar(
        title: const Text("Main Menu"),
      ),
      body: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _navigateToLogbook() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LogbookPage()),
    );
  }

  void _navigateToTurOprettelse() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TurOprettelse()),
    );
  }

  void _navigateToMedlemsKartotek() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Medlemskartotek()),
    );
  }

  void _navigateToBraendstofsForbrug() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BraendstofsForbrug()),
    );
  }

  void _navigateToGps() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Gps()),
    );
  }

  void _navigateToTurBilledeUpload() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BilledeUpload()),
    );
  }

  void _navigateToPresailCheck() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PresailCheck()),
    );
  }

  void _navigateToKommunikation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Kommunikation()),
    );
  }

  itemDashboard(String title, IconData iconData, Color background,
      Function()? onTap) =>
      InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5),
                    color: Colors.indigoAccent.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: Colors.white)),
              const SizedBox(height: 8),
              Text(title.toUpperCase(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1)
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .primaryColor,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 30),
                title: const Text('Hello User!',
                    style: TextStyle(color: Colors.white)),
                subtitle: const Text('Good Morning',
                    style: TextStyle(color: Colors.white54)),
                trailing: const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                  AssetImage('assets/images/user.JPG'),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
        Container(
          color: Theme
              .of(context)
              .primaryColor,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200))),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 30,
              children: [
                itemDashboard(
                    'Tur oprettelse', Icons.houseboat_sharp, Colors.deepOrange,
                    _navigateToTurOprettelse),
                itemDashboard('Logbog', Icons.analytics_outlined, Colors.green,
                    _navigateToLogbook),
                itemDashboard('Medlemskartotek', Icons.people_alt_outlined,
                    Colors.purple, _navigateToMedlemsKartotek),
                itemDashboard('brændstofsforbrug', Icons.comment_rounded,
                    Colors.brown, _navigateToBraendstofsForbrug),
                itemDashboard('GPS', Icons.map_outlined, Colors.indigo, _navigateToGps),
                itemDashboard('Billeder', Icons.cloud_upload_outlined,
                    Colors.teal, _navigateToTurBilledeUpload),
                itemDashboard(
                    'Pre-sail check', Icons.info_outline, Colors.blue, _navigateToPresailCheck),
                itemDashboard(
                    'Kommunikation', Icons.phone, Colors.pinkAccent, _navigateToKommunikation),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}