import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_mobile_project/bloc/ProfileCubit.dart';

import '../app_styles.dart';
import '../bloc/ItemCubit.dart';
import '../components/card.dart';
import '../components/empty_card.dart';
import '../components/horizontal_calendar.dart';
import '../repository/Item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var _items = getItemsByDate(DateTime.now());
  var _filteredDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Read name from Profile Cubit
    final nameToShow = context.read<ProfileCubit>().state ?? '';

    return BlocBuilder<ItemCubit, List<Item>>(
      builder: (context, itemList) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Text('Hello, $nameToShow', style: AppStyles.titleStyle),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/settings');
                            },
                            icon: Icon(Icons.settings))
                      ],
                    )),
                // const QuoteCard(
                //   quote:
                //       '"The only way to do great work is to love what you do."',
                //   author: 'Steve Jobs',
                // ),
                const SizedBox(height: 20),
                HorizontalCalendar(
                  key: UniqueKey(),
                  onSelectDate: (date) {
                    setState(() {
                      _filteredDate = date;

                      BlocProvider.of<ItemCubit>(context)
                          .setFilteredDate(_filteredDate);

                      BlocProvider.of<ItemCubit>(context).loadItemsByDate();
                      // _items = DatabaseService.getItemsByDate(date);
                    });
                  },
                  selectedDate: _filteredDate,
                ),
                const SizedBox(height: 20),

                itemList.isEmpty
                    ? (Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const EmptyCard()
                        ],
                      ))
                    : (Expanded(
                        // Adjust this value according to your needs
                        child: RefreshIndicator(
                          onRefresh: () async {
                            context
                                .read<ItemCubit>()
                                .setFilteredDate(_filteredDate);
                            context.read<ItemCubit>().loadItemsByDate();
                            // setState(() {
                            //   _items = getItemsByDate(_filteredDate);
                            // });
                          },
                          child: Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: itemList.length,
                              itemBuilder: (context, index) {
                                return ItemCard(
                                  item: itemList.elementAt(index),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                            ),
                          ),
                        ),
                      ))
              ],
            ),
          ),
        );
      },
    );
  }
}
