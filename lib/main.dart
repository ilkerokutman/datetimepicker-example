import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedDateTime = DateTime.now().toIso8601String();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('asdf'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Tarih/Saat:'),
                subtitle: Text(selectedDateTime),
                trailing: IconButton(
                  onPressed: onDatePickerClicked,
                  icon: const Icon(Icons.event),
                ),
              ),
              ElevatedButton(onPressed: submit, child: const Text('submit')),
            ],
          ),
        ));
  }

  Future<void> onDatePickerClicked() async {
    final dt = DateTime.now();
    final result = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.datetime,
      initialDate: DateTime.parse(selectedDateTime),
      maximumDate: DateTime.now().add(const Duration(days: 1)),
      minimumDate: DateTime(dt.year - 1, dt.month, dt.day),
      onChanged: (p0) {
        print(p0);
      },
      onResult: (p0) {
        print(p0);
      },
      useRootNavigator: true,
      useSafeArea: true,
      isDismissible: true,
      enableDrag: false,
      showDragHandle: false,
      options: const BoardDateTimeOptions(
        languages: BoardPickerLanguages(
          locale: 'tr',
          today: 'Bugün',
          tomorrow: 'Yarın',
          weekdays: [
            'Paz',
            'Pts',
            'Sal',
            'Çar',
            'Per',
            'Cum',
            'Cts',
          ],
          now: 'Şu an',
        ),
      ),
    );
    if (result != null) {
      selectedDateTime = result.toIso8601String();
      if (mounted) {
        setState(() {});
      }
    }
  }

  void submit() {
    print(selectedDateTime);
  }
}
