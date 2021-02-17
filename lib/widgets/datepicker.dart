import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guzo/bloc/datepickerBloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatelessWidget {
  bool isOneWay;
  PickerDateRange dateRange;
  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime.now();
  List<DateTime> dateTimes;
  DatePicker({
    Key key,
    this.isOneWay,
  }) : super(key: key);

  static final dateBloc = DatePickerBloc();
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (isOneWay == false) {
      dateRange = args.value;
      print(dateRange.endDate);
      startDate = dateRange.startDate;
      endDate = dateRange.endDate;
    } else
      dateBloc.dateSink.add(args.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
              height: MediaQuery.of(context).size.height * 0.6,
              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: isOneWay == false
                    ? DateRangePickerSelectionMode.range
                    : DateRangePickerSelectionMode.single,
                enablePastDates: false,
                navigationDirection:
                    DateRangePickerNavigationDirection.vertical,
                headerStyle: DateRangePickerHeaderStyle(
                  backgroundColor: Colors.deepPurple,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 320,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                color: Colors.amber,
                elevation: 10,
                onPressed: () {
                  if (endDate == null) {
                    endDate = startDate;
                  }
                  dateBloc.startDateSink.add(startDate);
                  dateBloc.endDateSink.add(endDate);
                  Navigator.pop(context);
                },
                child: Text(
                  'Continue',
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
