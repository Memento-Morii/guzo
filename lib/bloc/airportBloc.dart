import 'dart:async';

import 'package:guzo/models/airport_model.dart';

class AirportBloc {
  StreamController _airportStateStreamController =
      StreamController<Airport>.broadcast();
  StreamSink<Airport> get airportSink => _airportStateStreamController.sink;
  Stream<Airport> get airportStream => _airportStateStreamController.stream;
  StreamController _landingStateStreamController =
      StreamController<Airport>.broadcast();
  StreamSink<Airport> get landingSink => _landingStateStreamController.sink;
  Stream<Airport> get landingStream => _landingStateStreamController.stream;
}
