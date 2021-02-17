import 'dart:async';

enum ChoiceAction {
  Economy,
  Business,
  First,
}

class ChoiceBloc {
  String choice;
  StreamController _stateStreamController =
      StreamController<String>.broadcast();
  StreamSink<String> get choiceSink => _stateStreamController.sink;
  Stream<String> get choiceStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<ChoiceAction>.broadcast();
  StreamSink<ChoiceAction> get eventSink => _eventStreamController.sink;
  Stream<ChoiceAction> get eventStream => _eventStreamController.stream;

  ChoiceBloc() {
    choice = '';
    eventStream.listen(
      (event) {
        if (event == ChoiceAction.Economy) {
          choice = 'Economy';
        } else if (event == ChoiceAction.Business) {
          choice = 'Business';
        } else if (event == ChoiceAction.First) {
          choice = 'First';
        }
      },
    );
    void dispose() {
      _stateStreamController.close();
      _eventStreamController.close();
    }
  }
}
