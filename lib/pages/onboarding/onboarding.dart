import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Live life'),
                Text('Thoughtfully'),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text('Next'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
