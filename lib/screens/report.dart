import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text(
                "Report",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
        
              // Today's Report Card
              _buildTodayReportCard(),
        
              const SizedBox(height: 16),
        
              // Check Dashboard Card
              _buildDashboardCard(),
        
              const SizedBox(height: 24),
        
              // Check History
              _buildCheckHistory(),
        
              const SizedBox(height: 24),
        
              const MedicineSection(title: 'Morning 09:00 pm', medicines: [
                MedicineCard(
                  name: 'Calpol 500mg Tablet',
                  subtitle: 'Before Breakfast  Day 01',
                  status: 'Taken',
                  imagePath: 'assets/syrup.png', 
                  icon: Icons.notifications_none,
                  color: Colors.green,
                  boxColor: Colors.brown,
                ),
                MedicineCard(
                  name: 'Calpol 500mg Tablet',
                  subtitle: 'Before Breakfast  Day 01',
                  status: 'Taken',
                  imagePath: 'assets/tablet.png', 
                  icon: Icons.notifications_none,
                  color: Colors.red,
                  boxColor: Colors.green,
                ),
              ]),
              const MedicineSection(title: 'Afternoon 09:00 pm', medicines: [
                MedicineCard(
                  name: 'Calpol 500mg Tablet',
                  subtitle: 'Before Breakfast  Day 01',
                  status: 'Taken',
                  imagePath: 'assets/syrup.png', 
                  icon: Icons.notifications_none,
                  color: Colors.green,
                  boxColor: Colors.brown,
                ),
                
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTodayReportCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Report",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildReportItem("5", "Total"),
                _buildReportItem("3", "Taken"),
                _buildReportItem("1", "Missed"),
                _buildReportItem("1", "Snoozed"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildDashboardCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Check Dashboard",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Here you will find everything related to your active and past medicines.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _buildCircularGraph(),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularGraph() {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: Image.asset('assets/graph.png'),
      ),
    );
  }

  Widget _buildCheckHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
              child: Text(
                "Check History",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.blue),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60, 
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(6, (index) {
              return _buildDateChip(index + 1, index == 0);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildDateChip(int date, bool isSelected) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 22.0), 
      child: Column(
        children: [
          Text(
            ["SUN", "MON", "TUE", "WED", "THU", "FRI"][date - 1],
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          CircleAvatar(
            radius: 18, 
            backgroundColor: isSelected ? Colors.blue : Colors.grey.shade300,
            child: Text(
              "$date",
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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
