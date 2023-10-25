import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}'),
            ElevatedButton(onPressed: () async {
              final DateTime? datetime = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000));
              if (datetime != null){
                setState(() {
                  selectedDate = datetime;
                });
              }
            },
                child: Text('Choose Date')),
            SizedBox(height: 40,),
            Text('${selectedTime.hour} - ${selectedTime.minute}'),
            ElevatedButton(onPressed: () async {
              final TimeOfDay? timeofday = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                  initialEntryMode: TimePickerEntryMode.dial,);
              if (timeofday != null){
                setState(() {
                  selectedTime = timeofday;
                });
              }
            },
                child: Text('Choose Time')),
          ],
        ),
      ),
    );
  }
}

