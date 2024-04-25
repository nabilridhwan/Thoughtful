// Custom bottom navigation bar
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../pages/create_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  Function(int) onPressed;

  CustomBottomNavigationBar({Key? key, required this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: 100,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                height: 60, // Adjust this according to your needs
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade900),
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10), bottom: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        onPressed(0);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        onPressed(1);
                      },
                    ),
                    const SizedBox(width: 80),
                    IconButton(
                      icon: Icon(Icons.bar_chart),
                      onPressed: ()  {
                        onPressed(2);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        onPressed(3);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30, // Adjust this according to your needs
              left: MediaQuery.of(context).size.width / 2 -
                  35, // Center button horizontally
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gradient2.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  color: AppColors.gradient2,
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, size: 30),
                  onPressed: () {
                    // Add your action here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePage(),
                            fullscreenDialog: true));
                  },
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ));
  }
}
