import 'package:flutter/material.dart';
import 'package:test_flutter_mobile_project/pages/home_page.dart';
import 'package:test_flutter_mobile_project/pages/onboarding/onboarding.dart';
import 'package:test_flutter_mobile_project/pages/settings.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  List<Widget> page = [HomePage(), Onboarding(), Onboarding(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return Scaffold(
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   onPressed: (index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //
      //     log('currentIndex $currentIndex');
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => CreatePage()));
      //   },
      //   isExtended: true,
      //   backgroundColor: AppColors.gradient2,
      //   child: const Icon(Icons.add),
      // ),
      body: IndexedStack(
        index: currentIndex,
        children: page,
      )
    );
  }
}
