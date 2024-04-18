import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/create');
      },
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 5,
                color: Colors.grey.shade900,
                style: BorderStyle.solid),
          ),
          child: Text('Add some thoughts!',
              style: TextStyle(color: Colors.white.withOpacity(0.5)))),
    );
  }
}
