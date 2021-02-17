import 'dart:async';

class DatePickerBloc {
  StreamController<DateTime> _dateStateController =
      StreamController<DateTime>.broadcast();
  StreamSink<DateTime> get dateSink => _dateStateController.sink;
  Stream<DateTime> get dateStream => _dateStateController.stream;

  StreamController<DateTime> _startDateStateController =
      StreamController<DateTime>.broadcast();
  StreamSink<DateTime> get startDateSink => _startDateStateController.sink;
  Stream<DateTime> get startDateStream => _startDateStateController.stream;

  StreamController<DateTime> _endDateStateController =
      StreamController<DateTime>.broadcast();
  StreamSink<DateTime> get endDateSink => _endDateStateController.sink;
  Stream<DateTime> get endDateStream => _endDateStateController.stream;
}
