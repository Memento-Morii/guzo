import 'dart:async';

class CounterBloc {
  StreamController _adultCounterStateStreamController =
      StreamController<int>.broadcast();
  StreamSink<int> get adultcounterSink =>
      _adultCounterStateStreamController.sink;
  Stream<int> get adultcounterStream =>
      _adultCounterStateStreamController.stream;

  StreamController _childCounterStateStreamController =
      StreamController<int>.broadcast();
  StreamSink<int> get childcounterSink =>
      _childCounterStateStreamController.sink;
  Stream<int> get childcounterStream =>
      _childCounterStateStreamController.stream;

  StreamController _enfantCounterStateStreamController =
      StreamController<int>.broadcast();
  StreamSink<int> get enfantcounterSink =>
      _enfantCounterStateStreamController.sink;
  Stream<int> get enfantcounterStream =>
      _enfantCounterStateStreamController.stream;

  CounterBloc() {
    void dispose() {
      _adultCounterStateStreamController.close();
      _childCounterStateStreamController.close();
      _enfantCounterStateStreamController.close();
    }
  }
}
