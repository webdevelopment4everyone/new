import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';

class MedicineSchedule extends StatefulWidget {
  const MedicineSchedule({super.key});

  @override
  State<MedicineSchedule> createState() => _MedicineScheduleState();
}

class _MedicineScheduleState extends State<MedicineSchedule> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi Harry!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Text('5 Medicines Left',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.blue),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/user.png'),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlutterDatePickerTimeline(
                  startDate: DateTime.now().subtract(const Duration(days: 30)),
                  endDate: DateTime.now().add(const Duration(days: 30)),
                  initialSelectedDate: _selectedDate,
                  onSelectedDateChange: (date) {
                    setState(() {
                      _selectedDate = date!;
                    });
                  },
                  selectedItemBackgroundColor: Colors.black87,
                  selectedItemTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedItemTextStyle: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    MedicineSection(title: 'Morning 08:00 am', medicines: [
                      MedicineCard(
                        name: 'Calpol 500mg Tablet',
                        subtitle: 'Before Breakfast  Day 01',
                        status: 'Taken',
                        imagePath: 'assets/tablet.png',
                        icon: Icons.notifications_none,
                        color: Colors.green,
                        boxColor: Colors.purple,
                      ),
                      MedicineCard(
                        name: 'Calpol 500mg Tablet',
                        subtitle: 'Before Breakfast  Day 01',
                        status: 'Taken',
                        imagePath: 'assets/capsule.png',
                        icon: Icons.notifications_none,
                        color: Colors.red,
                        boxColor: Colors.blue,
                      ),
                    ]),
                    MedicineSection(title: 'Afternoon 02:00 pm', medicines: [
                      MedicineCard(
                        name: 'Calpol 500mg Tablet',
                        subtitle: 'Before Breakfast  Day 01',
                        status: 'Taken',
                        imagePath: 'assets/cream.png',
                        icon: Icons.notifications_none,
                        color: Color.fromARGB(255, 224, 224, 26),
                        boxColor: Colors.red,
                      ),
                    ]),
                    MedicineSection(title: 'Night 09:00 pm', medicines: [
                      MedicineCard(
                        name: 'Calpol 500mg Tablet',
                        subtitle: 'Before Breakfast  Day 01',
                        status: 'Taken',
                        imagePath: 'assets/syrup.png',
                        icon: Icons.notifications_none,
                        color: Colors.grey,
                        boxColor: Colors.brown,
                      ),
                      MedicineCard(
                        name: 'Calpol 500mg Tablet',
                        subtitle: 'Before Breakfast  Day 01',
                        status: 'Taken',
                        imagePath: 'assets/tablet.png',
                        icon: Icons.notifications_none,
                        color: Colors.grey,
                        boxColor: Colors.green,
                      ),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MedicineSection extends StatelessWidget {
  final String title;
  final List<Widget> medicines;

  const MedicineSection(
      {super.key, required this.title, required this.medicines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...medicines,
        const SizedBox(height: 20),
      ],
    );
  }
}

class MedicineCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String status;
  final String imagePath;
  final IconData icon;
  final Color color;
  final Color boxColor;

  const MedicineCard(
      {super.key,
      required this.name,
      required this.subtitle,
      required this.status,
      required this.imagePath,
      required this.icon,
      required this.color,
      required this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: boxColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            width: 30,
            height: 40,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              status,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
