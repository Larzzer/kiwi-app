import 'package:uuid/uuid.dart';

class Ture {
  String id;
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

  Ture(
      {required this.Dato,
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
        required this.spiler})
      : id = Uuid().v4();
}