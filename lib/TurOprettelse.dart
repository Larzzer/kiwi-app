import 'package:eksamesprojekt_kiwi_app/CreateTur.dart';
import 'package:flutter/material.dart';
import 'package:eksamesprojekt_kiwi_app/GlobalState.dart';
import 'Ture.dart';

class TurOprettelse extends StatefulWidget {
  const TurOprettelse({Key? key}) : super(key: key);

  @override
  _TurOprettelseState createState() => _TurOprettelseState();
}

class _TurOprettelseState extends State<TurOprettelse> {
  List<Ture> _ture = [];

  void _navigateToCreateTur(BuildContext context, [Ture? ture]) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTur(ture: ture)),
    );
    if (result != null) {
      setState(() {
        if (ture == null) {
          // create a new trip
          _ture.add(Ture(
            Dato: result[0],
            Tid: result[1],
            kaptajn: result[2],
            Ror: result[3],
            Forsejlstyrbord: result[4],
            Forsejlbagbord: result[5],
            Bagstag: result[6],
            Storsejl: result[7],
            Navigation: result[8],
            fordaek: result[9],
            pitmand: result[10],
            spiler: result[11],
          ));
        } else {
          // edit an existing trip
          ture.Dato = result[0];
          ture.Tid = result[1];
          ture.kaptajn = result[2];
          ture.Ror = result[3];
          ture.Forsejlstyrbord = result[4];
          ture.Forsejlbagbord = result[5];
          ture.Bagstag = result[6];
          ture.Storsejl = result[7];
          ture.Navigation = result[8];
          ture.fordaek = result[9];
          ture.pitmand = result[10];
          ture.spiler = result[11];
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    List<String>? storedTur = store.get("Tur");
    if (storedTur != null && storedTur.isNotEmpty) {
      Ture tur1 = Ture(
        Dato: storedTur[0],
        Tid: storedTur[1],
        kaptajn: storedTur[2],
        Ror: storedTur[3],
        Forsejlstyrbord: storedTur[4],
        Forsejlbagbord: storedTur[5],
        Bagstag: storedTur[6],
        Storsejl: storedTur[7],
        Navigation: storedTur[8],
        fordaek: storedTur[9],
        pitmand: storedTur[10],
        spiler: storedTur[11],
      );
      _ture.add(tur1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('TurOprettelse'),
    ),
    body: ListView.builder(
    itemCount: _ture.length,
    itemBuilder: (BuildContext context, int index) {
    Ture ture = _ture[index];
    return ListTile(
    title: Text('Tur ${index + 1}'),
    subtitle: Text('Dato${ture.Dato}, Tid: ${ture.Tid}'),
      onTap: () {
        _navigateToCreateTur(context, ture);
      },
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _ture.removeAt(index);
          });
        },
      ),
    );
    },
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToCreateTur(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



