import 'package:eksamesprojekt_kiwi_app/CreateTur.dart';
import 'package:flutter/material.dart';
import 'package:eksamesprojekt_kiwi_app/GlobalState.dart';
import 'Ture.dart';
class TurOprettelse extends StatelessWidget {
  const TurOprettelse({Key? key}) : super(key: key);

  void _navigateToCreateTur(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateTur()),
    );

  }

  @override
  Widget build(BuildContext context) {
    List <String> storedTur = store.get("Tur") ?? [];
    if (!storedTur.isEmpty)
      {
        Ture tur1 = new Ture(Dato: storedTur[0], Tid: storedTur[1], kaptajn: storedTur[2], Ror: storedTur[3], Forsejlstyrbord: storedTur[4], Forsejlbagbord: storedTur[5], Bagstag: storedTur[6], Storsejl: storedTur[7], Navigation: storedTur[8], fordaek: storedTur[9], pitmand: storedTur[10], spiler: storedTur[11]);
        List<Ture> ture = [];
        ture.add(tur1);
      }
    return Scaffold(
      appBar: AppBar(
        title: const Text('TurOprettelse'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ture:',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 2 / 3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToCreateTur(context); // Pass the BuildContext to the method
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}