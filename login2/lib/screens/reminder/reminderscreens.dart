import 'package:flutter/material.dart';
import 'package:login2/utils/constants.dart';
import 'notification_service.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});
  static String routeName = "/reminder_screen";

  @override
  ReminderScreenState createState() => ReminderScreenState();
}

class ReminderScreenState extends State<ReminderScreen> {
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    NotificationService().init();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> _scheduleNotification() async {
    final DateTime reminderDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    const String title = 'Pengingat Pembayaran';
    const String body = 'Jangan lupa untuk melakukan pembayaran zakat!';

    print('Scheduling notification for: $reminderDateTime');
    await NotificationService()
        .scheduleNotification(reminderDateTime, title, body);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengingat telah dijadwalkan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengingat Pembayaran'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Tanggal Pembayaran: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              child: const Text('Pilih Tanggal Pembayaran',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Waktu Pengingat: ${selectedTime.format(context)}',
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              child: const Text('Pilih Waktu Pengingat',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _scheduleNotification(),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              child: const Text('Atur Pengingat di Notifikasi',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
