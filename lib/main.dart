import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(),
      body: SfCalendar(
        dataSource: _getCalendarDataSource(),
        view: CalendarView.month,
        showDatePickerButton: true,
        monthViewSettings:
            const MonthViewSettings(dayFormat: 'EEE', appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        allowDragAndDrop: true,
        appointmentBuilder: (context, calAptDetails) {
          final Appointment day = calAptDetails.appointments.first;
          return Text(
            day.subject,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }

  AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    for (int i = 0; i < 4; i++) {
      appointments.add(Appointment(
          startTime: DateTime.now(),
          endTime: DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 3600000),
          subject: 'Appointment $i'));
    }

    return AppointmentDataSource(appointments);
  }
}


class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
