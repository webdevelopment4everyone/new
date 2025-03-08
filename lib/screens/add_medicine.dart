import 'package:flutter/material.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicine> {
  int selectedCompartment = 1;
  int totalCount = 1;
  String frequency = 'Everyday';
  String timesPerDay = 'Three Time';
  int? _selectedIndex; 

  final List<String> options = ["Before Food", "After Food", "Before Sleep"];

  int? selectedCompartmentShape; 

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.indigo
  ];

  int? selectedCompartmentMeds; 

  final List<String> assetImages = [
    'assets/tablet.png',
    'assets/capsule.png',
    'assets/cream.png',
    'assets/syrup.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Medicines')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search Medicine Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.mic,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Compartment'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(10, (index) {
                    return ChoiceChip(
                      label: Text('${index + 1}'),
                      selected: selectedCompartment == index + 1,
                      showCheckmark: false,
                      onSelected: (selected) {
                        setState(() => selectedCompartment = index + 1);
                      },
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Color'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(colors.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedCompartmentShape = index + 1);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 32, 
                        height: 32,
                        decoration: BoxDecoration(
                          color: colors[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedCompartmentShape == index + 1
                                ? Colors.black
                                : Colors.transparent,
                            width: 2, 
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Type'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(assetImages.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedCompartmentMeds = index);
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            width: 60, 
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedCompartmentMeds == index
                                  ? Colors.pinkAccent.withOpacity(
                                      0.3) 
                                  : Colors.transparent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  4.0), 
                              child: Image.asset(
                                assetImages[index],
                                fit: BoxFit
                                    .cover, 
                                height: 50,
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ),
                          Text(
                            [
                              'Tablet',
                              'Capsule',
                              'Cream',
                              'Syrup'
                            ][index], 
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Quantity'),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48, 
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Take 1/2 Pill',
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 48, 
                    width: 48, 
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.blue),
                      onPressed: () => setState(() {
                        totalCount = totalCount > 1 ? totalCount - 1 : 1;
                      }),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () => setState(() => totalCount++),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Total Count'),
              Slider(
                value: totalCount.toDouble(),
                min: 1,
                max: 100,
                onChanged: (value) {
                  setState(() => totalCount = value.toInt());
                },
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('01'), 
                  Text('100'), 
                ],
              ),
              const SizedBox(height: 16),
              const Text('Set Date'),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Today'),
                          Icon(Icons.keyboard_arrow_right, size: 18),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('End Date'),
                          Icon(Icons.keyboard_arrow_right, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Frequency of Days'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), 
                  borderRadius: BorderRadius.circular(8), 
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12), 
                child: DropdownButton<String>(
                  value: frequency,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: ['Everyday', 'Alternate Days', 'Custom']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() => frequency = newValue!);
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text('How many times a Day'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), 
                  borderRadius: BorderRadius.circular(8), 
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12), 
                child: DropdownButton<String>(
                  value: timesPerDay,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: ['One Time', 'Two Time', 'Three Time']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() => timesPerDay = newValue!);
                  },
                ),
              ),
              const SizedBox(height: 16),
              const ListTile(
                leading: Icon(Icons.access_time_outlined),
                title: Text('Dose 1'),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              const Divider(thickness: 1,),
              const ListTile(
                leading: Icon(Icons.access_time_outlined),
                title: Text('Dose 2'),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              const Divider(thickness: 1,),
              const ListTile(
                leading: Icon(Icons.access_time_outlined),
                title: Text('Dose 3'),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              const Divider(thickness: 1,),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(options.length, (index) {
                  return ChoiceChip(
                    label: Text(
                      options[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: _selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    showCheckmark: false,
                    selected: _selectedIndex == index,
                    selectedColor: Colors.blue, 
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), 
                      side: BorderSide(
                        color:
                            _selectedIndex == index ? Colors.blue : Colors.grey,
                      ),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedIndex = selected ? index : null;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
