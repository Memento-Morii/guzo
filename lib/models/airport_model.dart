import 'package:flutter/cupertino.dart';

class Airport {
  Airport({
    @required this.abbr,
    @required this.airport,
    @required this.city,
  });
  String abbr;
  String city;
  String airport;
  static List<Airport> directAirports = [
    Airport(
      abbr: "ABJ",
      airport: "Port Bouet",
      city: "Abijan",
    ),
    Airport(
      abbr: "ADD",
      airport: "Bole Airport",
      city: "Addis Ababa",
    ),
    Airport(
      abbr: "ACC",
      airport: "Kotoka Airport",
      city: "Accra",
    ),
    Airport(
      abbr: "ASM",
      airport: "Asmara Airport",
      city: "Asmara",
    ),
    Airport(
      abbr: "ASO",
      airport: "Asosa Airport",
      city: "Asosa",
    ),
    Airport(
      abbr: "BEW",
      airport: "Beira Airport",
      city: "Beira",
    ),
    Airport(
      abbr: "BSA",
      airport: "Bososa Airport",
      city: "Bososa",
    ),
    Airport(
      abbr: "BRU",
      airport: "Brussels Airport",
      city: "Brussels",
    ),
  ];
  static List<Airport> otherAirports = [
    Airport(
      abbr: "JOL",
      airport: "Jolo Airport",
      city: "ARMM",
    ),
    Airport(
      abbr: "AAL",
      airport: "Aalborg Airport",
      city: "Aalborg",
    ),
    Airport(
      abbr: "AKU",
      airport: "Aksu Airport",
      city: "Asku",
    ),
    Airport(
      abbr: "SCO",
      airport: "Akatu Airport",
      city: "Akatu",
    ),
    Airport(
      abbr: "ASO",
      airport: "Asosa Airport",
      city: "Asosa",
    ),
    Airport(
      abbr: "AEB",
      airport: "Tian Yang Air Base",
      city: "Baise",
    ),
    Airport(
      abbr: "BZO",
      airport: "Bolzano Airport",
      city: "Bolzano",
    ),
    Airport(
      abbr: "BXO",
      airport: "Buochs Airport",
      city: "Buochs",
    ),
  ];
}
