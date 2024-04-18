import 'package:flutter/material.dart';

import '../app_colors.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteCard({Key? key, required this.quote, required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.gradient1, AppColors.gradient2],
            transform: GradientRotation(-1),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              strokeAlign: BorderSide.strokeAlignInside,
              width: 4,
              color: Colors.black.withOpacity(0.2),
              style: BorderStyle.solid),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(quote,
                  style: TextStyle(
                      letterSpacing: -1,
                      height: 0.8,
                      fontSize: 40,
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w900)),
              const SizedBox(
                height: 30,
              ),
              Text(author,
                  style: TextStyle(
                      letterSpacing: -1,
                      height: 0.8,
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w900))
            ]));
  }
}