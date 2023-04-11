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

  void _navigateToCreateTur(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateTur()),
    );
    if (result != null) {
      setState(() {
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
      });
    }
  }

  @override
  void initState() {
    super.initState();
    List<String> storedTur = store.get("Tur") ?? [];
    if (!storedTur.isEmpty) {
      Ture tur1 = new Ture(
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
          spiler: storedTur[11]);
      _ture.add(tur1);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: _ture.isEmpty
                    ? Center(
                  child: Text(
                    'Ingen ture oprettet endnu.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                    : ListView.builder(
                  itemCount: _ture.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dato: ${_ture[index].Dato}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Tid: ${_ture[index].Tid}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Kaptajn: ${_ture[index].kaptajn}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Ror: ${_ture[index].Ror}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Forsejl styrbord: ${_ture[index].Forsejlstyrbord}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Forsejl bagbord: ${_ture[index].Forsejlbagbord}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Bagstag: ${_ture[index].Bagstag}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Storsejl: ${_ture[index].Storsejl}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Navigation: ${_ture[index].Navigation}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Fordæk: ${_ture[index].fordaek}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Pitmand: ${_ture[index].pitmand}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Spiler: ${_ture[index].spiler}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCreateTur(context),
        tooltip: 'Opret en ny tur',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Ture {
  String Dato;
  String Tid;
  String kaptajn;
  String Ror;
  String Forsejlstyrbord;
  String Forsejlbagbord;
  String Bagstag;
  String Storsejl;
  String Navigation;
  String fordaek;
  String pitmand;
  String spiler;

  Ture({
    required this.Dato,
    required this.Tid,
    required this.kaptajn,
    required this.Ror,
    required this.Forsejlstyrbord,
    required this.Forsejlbagbord,
    required this.Bagstag,
    required this.Storsejl,
    required this.Navigation,
    required this.fordaek,
    required this.pitmand,
    required this.spiler,
  });
}