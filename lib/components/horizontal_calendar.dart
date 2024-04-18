import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../app_colors.dart';

class HorizontalCalendar extends StatefulWidget {
  final Function(DateTime date) onSelectDate;
  final DateTime selectedDate;

  HorizontalCalendar(
      {super.key, required this.onSelectDate, required this.selectedDate});

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState(
      onSelectDate: onSelectDate, selectedDate: selectedDate);
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  DateTime selectedDate;
  Function(DateTime date) onSelectDate;

  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  _HorizontalCalendarState(
      {required this.onSelectDate, required this.selectedDate});

  // This function generates a list where the first element is the first date of the week and last element is the last date of the week and then the other items are the days of the week
  List<DateTime> getWeekDays(DateTime date) {
    final firstDateOfTheWeek = findFirstDateOfTheWeek(date);
    final lastDateOfTheWeek = findLastDateOfTheWeek(date);

    List<DateTime> dates = List.filled(7, DateTime.now());

    dates[0] = firstDateOfTheWeek;
    dates[6] = lastDateOfTheWeek;

    for (int i = 1; i < 6; i++) {
      dates[i] = firstDateOfTheWeek.add(Duration(days: i));
    }

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    log('selectedDate: $selectedDate');

    final DateTime weekBefore =
        DateTime.now().subtract(const Duration(days: 7));

    final PageController _pageController = PageController(
        initialPage:
            selectedDate.day <= findLastDateOfTheWeek(weekBefore).day ? 0 : 1);

    return SizedBox(
      height: 100,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: [
          HorizontalCalendarRow(
              startDate: findFirstDateOfTheWeek(weekBefore),
              endDate: findLastDateOfTheWeek(weekBefore),
              onSelectDate: onSelectDate,
              selectedDate: selectedDate),
          HorizontalCalendarRow(
              startDate: findFirstDateOfTheWeek(DateTime.now()),
              endDate: findLastDateOfTheWeek(DateTime.now()),
              onSelectDate: onSelectDate,
              selectedDate: selectedDate),
        ],
      ),
    );
  }
}

class HorizontalCalendarRow extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDate;
  final Function(DateTime date) onSelectDate;

  const HorizontalCalendarRow(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.onSelectDate,
      required this.selectedDate});

  List<DateTime> _generateListOfDates(DateTime startDate, DateTime endDate) {
    final numberOfDays = endDate.difference(startDate).inDays;
    List<DateTime> dates = List.filled(numberOfDays + 1, DateTime.now());

    for (int i = 0; i <= numberOfDays; i++) {
      dates[i] = startDate.add(Duration(days: i));
    }

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ..._generateListOfDates(startDate, endDate).map((date) {
            final isActive = date.day == selectedDate.day;
            final isAfter = date.isAfter(DateTime.now());
            // log('${date.day.toString()} ${selectedDate.day.toString()}');
            // log(isActive.toString());

            if (isAfter) {
              return Container(
                width: 55,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.gradient2 : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('${DateFormat.E().format(date)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: isActive
                              ? Colors.black
                              : isAfter
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
                        )),
                    Text(
                      '${date.day}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isActive
                            ? Colors.black
                            : isAfter
                                ? Colors.white.withOpacity(0.5)
                                : Colors.white,
                      ),
                    ),
                    Text('${DateFormat.MMM().format(date)}',
                        style: TextStyle(
                          fontSize: 13,
                          color: isActive
                              ? Colors.black
                              : isAfter
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
                        )),
                  ],
                ),
              );
            }

            return InkWell(
              onTap: () {
                if (isAfter) return;
                onSelectDate(date);
              },
              child: Container(
                width: 55,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.gradient2 : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('${DateFormat.E().format(date)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: isActive
                              ? Colors.black
                              : isAfter
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
                        )),
                    Text(
                      '${date.day}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isActive
                            ? Colors.black
                            : isAfter
                                ? Colors.white.withOpacity(0.5)
                                : Colors.white,
                      ),
                    ),
                    Text('${DateFormat.MMM().format(date)}',
                        style: TextStyle(
                          fontSize: 13,
                          color: isActive
                              ? Colors.black
                              : isAfter
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
                        )),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
