import 'package:uuid/uuid.dart';
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
  bool joined;
  int _numberOfPeople = 0;
  int get numberOfPeople => _numberOfPeople;
  set numberOfPeople(int value) => _numberOfPeople = value;

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
    this.joined = false, // initialize to false by default
  });

  List<String> toList() {
    return [
      Dato,
      Tid,
      kaptajn,
      Ror,
      Forsejlstyrbord,
      Forsejlbagbord,
      Bagstag,
      Storsejl,
      Navigation,
      fordaek,
      pitmand,
      spiler,
    ];
  }
}