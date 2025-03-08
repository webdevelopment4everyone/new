import 'package:doctor/screens/schedule.dart';
import 'package:doctor/screens/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text('5 Medicines Left',
                style: TextStyle(color: Colors.black54, fontSize: 14)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.blue),
            onPressed: () => _showCustomDialog(context),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MedicineSchedule()),
                        );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/user.png'),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const NavDrawer(),
      body: Column(
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
          const Spacer(),
          Center(
            child: Column(
              children: [
                Image.asset('assets/empty_box.png', height: 150),
                const SizedBox(height: 10),
                const Text('Nothing Is Here, Add a Medicine',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  "Your Device is not connected",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset("assets/robot.png", height: 120),
              const SizedBox(height: 16),
              const Text(
                "Connect your device with",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, 
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: EdgeInsets.zero, 
                          elevation: 0, 
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.bluetooth, color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 1, 
                      color: Colors.white, 
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: EdgeInsets.zero, 
                          elevation: 0, 
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.wifi, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
