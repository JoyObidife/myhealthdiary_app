
import 'package:flutter/material.dart';

class SelectionGridItem extends StatelessWidget {
  const SelectionGridItem({super.key});

  static final List<GridItem> gridItems = [
    GridItem(
      title: 'Medication',
      icon: Icons.medication_outlined,
      color: Colors.blue,
      value: '2 doses',
    ),
    GridItem(
      title: 'Appointments',
      icon: Icons.event,
      color: Colors.green,
      value: '1 today',
    ),
    GridItem(
      title: 'Symptoms',
      icon: Icons.monitor_heart,
      color: Colors.red,
      value: 'Fatigue',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5
      ),
      itemCount: gridItems.length,
      itemBuilder: (context, index) {
        final item = gridItems[index];

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, color: item.color, size: 30),
              const SizedBox(height: 6),
              Text(
                item.title,
                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              Text(
                item.value,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
class GridItem {
  final String title;
  final IconData icon;
  final  Color color;
  final String value;

  GridItem({
    required this.title,
    required this.icon,
    required this.value, required this.color,
  });
}
