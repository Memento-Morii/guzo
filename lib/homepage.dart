import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:guzo/bloc/choiceBloc.dart';
import 'package:guzo/bloc/counterBloc.dart';
import 'package:guzo/models/airport_model.dart';
import 'package:guzo/select_airport.dart';
import 'package:guzo/widgets/datepicker.dart';
import 'package:intl/intl.dart';

import 'bloc/datepickerBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final counterBloc = CounterBloc();
Airport _airport;
int adultCounter = 1;
int childCounter = 0;
int enfantCounter = 0;

class _HomePageState extends State<HomePage> {
  final choiceBloc = ChoiceBloc();
  DatePicker datePicker = DatePicker();

  int initNo;
  bool isOneWay = false;
  bool isLanding = false;
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2 * MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/planee.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(0.0, -0.40),
                  margin: EdgeInsets.all(20),
                  child: Text(
                    'Guzo',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 70, 40, 0),
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CustomRadioButton(
                      height: 30,
                      radioButtonValue: (value) {
                        print(value);
                        if (value == "One-Way") {
                          setState(() {
                            isOneWay = true;
                          });
                        } else
                          setState(() {
                            isOneWay = false;
                          });
                      },
                      elevation: 0,
                      enableShape: true,
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.black,
                          unSelectedColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                          )),
                      customShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      buttonLables: ["Return", "One-Way"],
                      buttonValues: ["Return", "One-Way"],
                      enableButtonWrap: false,
                      horizontal: false,
                      width: 120,
                      padding: 5,
                      unSelectedColor: Colors.transparent,
                      selectedColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 130, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLanding = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectAirport(
                                isLanding: isLanding,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          child: StreamBuilder(
                            initialData: Airport.directAirports[0],
                            stream: SelectAirport.airportBloc.airportStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<Airport> snapshot) {
                              _airport = snapshot.data;
                              return Column(
                                children: [
                                  Text(
                                    'From',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _airport.abbr,
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    _airport.city,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _airport.airport,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.swap_horizontal_circle_sharp,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {},
                      // ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLanding = true;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectAirport(
                                isLanding: isLanding,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          child: StreamBuilder(
                            initialData: Airport.directAirports[0],
                            stream: SelectAirport.airportBloc.landingStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<Airport> snapshot) {
                              _airport = snapshot.data;
                              return Column(
                                children: [
                                  Text(
                                    'To',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _airport.abbr,
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    _airport.city,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _airport.airport,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DatePicker(
                          isOneWay: isOneWay,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        Text(
                          'Depature Date',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        StreamBuilder(
                          stream: isOneWay == true
                              ? DatePicker.dateBloc.dateStream
                              : DatePicker.dateBloc.startDateStream,
                          initialData: DateTime.now(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DateTime> snapshot) {
                            String month =
                                DateFormat.MMM().format(snapshot.data);
                            String date = DateFormat.d().format(snapshot.data);
                            String day =
                                DateFormat.EEEE().format(snapshot.data);
                            print(snapshot.data);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  date,
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      month,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      day,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                isOneWay == false
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DatePicker(
                                isOneWay: isOneWay,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Text(
                                'Return Date',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              StreamBuilder(
                                stream: DatePicker.dateBloc.endDateStream,
                                initialData: DateTime.now(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DateTime> snapshot) {
                                  String month =
                                      DateFormat.MMM().format(snapshot.data);
                                  String date =
                                      DateFormat.d().format(snapshot.data);
                                  String day =
                                      DateFormat.EEEE().format(snapshot.data);
                                  print(snapshot.data);
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        date,
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            month,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            day,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showAdaptiveActionSheet(
                      context: context,
                      actions: <BottomSheetAction>[
                        BottomSheetAction(
                          title: 'Economy',
                          onPressed: () {
                            Navigator.pop(context);
                            choiceBloc.eventSink.add(ChoiceAction.Economy);
                          },
                        ),
                        BottomSheetAction(
                          title: 'Business',
                          onPressed: () {
                            Navigator.pop(context);
                            choiceBloc.eventSink.add(ChoiceAction.Business);
                          },
                        ),
                        BottomSheetAction(
                          title: 'First',
                          onPressed: () {
                            Navigator.pop(context);
                            choiceBloc.eventSink.add(ChoiceAction.First);
                          },
                        ),
                      ],
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Cabin Class',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          StreamBuilder(
                            stream: choiceBloc.eventStream,
                            initialData: ChoiceAction.Economy,
                            builder: (context, snapshot) {
                              if (snapshot.hasData == true) {
                                return Text(
                                  '${snapshot.data}'.substring(13),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else
                                return Container();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Passengers',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Done',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    StreamBuilder(
                                      stream: counterBloc.adultcounterStream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Adult",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                MaterialButton(
                                                  minWidth: 10,
                                                  shape: CircleBorder(),
                                                  child: Icon(Icons.add),
                                                  onPressed: () {
                                                    adultCounter++;
                                                    counterBloc.adultcounterSink
                                                        .add(adultCounter);
                                                  },
                                                ),
                                                Text(
                                                  adultCounter.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth: 10,
                                                  shape: CircleBorder(),
                                                  child: Icon(Icons.remove),
                                                  onPressed: () {
                                                    if (adultCounter >= 2) {
                                                      adultCounter--;
                                                      counterBloc
                                                          .adultcounterSink
                                                          .add(adultCounter);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    StreamBuilder(
                                      stream: counterBloc.childcounterStream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Children",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                MaterialButton(
                                                  minWidth: 10,
                                                  shape: CircleBorder(),
                                                  child: Icon(Icons.add),
                                                  onPressed: () {
                                                    childCounter++;
                                                    counterBloc.childcounterSink
                                                        .add(childCounter);
                                                  },
                                                ),
                                                Text(
                                                  childCounter.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth: 10,
                                                  shape: CircleBorder(),
                                                  child: Icon(Icons.remove),
                                                  onPressed: () {
                                                    if (childCounter >= 1) {
                                                      childCounter--;
                                                      counterBloc
                                                          .childcounterSink
                                                          .add(childCounter);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    StreamBuilder(
                                      stream: counterBloc.enfantcounterStream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Enfant",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                MaterialButton(
                                                  minWidth: 10,
                                                  shape: CircleBorder(),
                                                  child: Icon(Icons.add),
                                                  onPressed: () {
                                                    enfantCounter++;
                                                    counterBloc
                                                        .enfantcounterSink
                                                        .add(enfantCounter);
                                                  },
                                                ),
                                                Text(
                                                  enfantCounter.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth: 10,
                                                  shape: CircleBorder(),
                                                  child: Icon(Icons.remove),
                                                  onPressed: () {
                                                    if (enfantCounter >= 1) {
                                                      enfantCounter--;
                                                      counterBloc
                                                          .enfantcounterSink
                                                          .add(enfantCounter);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        Text(
                          'Passengers',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                ),
                                StreamBuilder(
                                  stream: counterBloc.adultcounterStream,
                                  initialData: adultCounter,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<dynamic> snapshot) {
                                    return Text(
                                      "${snapshot.data}",
                                    );
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                ),
                                StreamBuilder(
                                  stream: counterBloc.childcounterStream,
                                  initialData: childCounter,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<dynamic> snapshot) {
                                    return Text(
                                      "${snapshot.data}",
                                    );
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_add,
                                ),
                                StreamBuilder(
                                  stream: counterBloc.enfantcounterStream,
                                  initialData: enfantCounter,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<dynamic> snapshot) {
                                    return Text(
                                      "${snapshot.data}",
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              width: 320,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                color: Colors.amber,
                elevation: 10,
                onPressed: () {},
                child: Text(
                  'Search Flights',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
