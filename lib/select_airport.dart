import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guzo/bloc/airportBloc.dart';
import 'package:guzo/models/airport_model.dart';

class SelectAirport extends StatelessWidget {
  bool isLanding;
  static final airportBloc = AirportBloc();
  SelectAirport({
    Key key,
    this.isLanding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Airport",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Material(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                border: InputBorder.none,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Direct Airports",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: Airport.directAirports.length,
              itemBuilder: (context, index) {
                Airport airport = Airport.directAirports[index];
                return InkWell(
                  onTap: () {
                    if (isLanding == false) {
                      airportBloc.airportSink.add(airport);
                    } else if (isLanding == true) {
                      airportBloc.landingSink.add(airport);
                    }

                    Navigator.pop(context);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                          "${airport.city}, ${airport.airport} (${airport.abbr})"),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Other Airports",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: Airport.otherAirports.length,
              itemBuilder: (context, index) {
                Airport airport = Airport.otherAirports[index];
                return InkWell(
                  onTap: () {
                    if (isLanding == false) {
                      airportBloc.airportSink.add(airport);
                    } else if (isLanding == true) {
                      airportBloc.landingSink.add(airport);
                    }

                    Navigator.pop(context);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                          "${airport.city}, ${airport.airport} (${airport.abbr})"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
