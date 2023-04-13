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
  int numberOfPeople = 0;

  void _navigateToCreateTur(BuildContext context, {List<String>? initialTexts}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTur(initialTexts: initialTexts)),
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

  void _navigateToEditTur(BuildContext context, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTur(initialTexts: _ture[index].toList())),
    );
    if (result != null) {
      setState(() {
        _ture[index] = Ture(
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
        );
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

  void _deleteTur(BuildContext context) async {
    final selectedIndex = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vælg en tur at slette'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _ture.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("Tur ${index + 1}"),
                  subtitle: Row(
                    children: [
                      Text(_ture[index].Dato),
                      SizedBox(width: 8),
                      Text('${_ture[index].numberOfPeople}'),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context, index);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (selectedIndex != null) {
      setState(() {
        _ture.removeAt(selectedIndex);
      });
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
                    return ListTile(
                      title: Text("Tur ${index + 1}"),
                      subtitle: Row(
                        children: [
                          Text(_ture[index].Dato),
                          SizedBox(width: 8),
                          Text('|     Antal personer der deltager: ${_ture[index].numberOfPeople}'),
                        ],
                      ),
                      onTap: () => _navigateToEditTur(context, index),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Create trip button
          FloatingActionButton(
            onPressed: () => _navigateToCreateTur(context),
            child: Icon(Icons.add),
          ),
          SizedBox(width: 16), // Add some spacing between the buttons
          // Delete trip button
          FloatingActionButton(
            onPressed: () => _deleteTur(context),
            child: Icon(Icons.delete),
          ),
          SizedBox(width: 16),
          // Join trip button
          FloatingActionButton(
            onPressed: () {
              // Show a dialog with a list of available trips
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Vælg en tur at deltage i'),
                    content: Container(
                      width: double.maxFinite,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _ture.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text("Tur ${index + 1}"),
                            subtitle: Row(
                              children: [
                                Text(_ture[index].Dato),
                                SizedBox(width: 8),
                                Text('|     Antal personer der deltager: ${_ture[index].numberOfPeople}'),
                              ],
                            ),
                            onTap: () {
                              // Join the selected trip
                              setState(() {
                                _ture[index].numberOfPeople++;
                                numberOfPeople = _ture[index].numberOfPeople;
                              });
                              Navigator.pop(context); // Close the dialog
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.person_add),
          ),
        ],
      ),
    );
  }
}

GlobalState store = GlobalState.instance;