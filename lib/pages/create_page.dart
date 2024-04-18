import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:test_flutter_mobile_project/app_styles.dart';
import 'package:uuid/uuid.dart';

import '../bloc/Item.dart';
import '../bloc/ItemCubit.dart';
import '../components/prompt_card.dart';

class CreatePage extends StatefulWidget {
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  DateTime date = DateTime.now();
  TextEditingController myController = TextEditingController();
  String _prompt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add a Thought', style: AppStyles.titleStyle),
          actions: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                log(myController.text);

                Item item = Item(
                    id: Uuid().v4(),
                    title: _prompt,
                    content: myController.text,
                    onPressed: () {},
                    createdAt: DateTime.now());

                // ref
                //     .read(itemListProvider(DateTime.now()).notifier)
                //     .insertItem(item);

                context.read<ItemCubit>().insertItem(item);
                // BlocProvider.of<ItemCubit>(context).insertItem(item);

                // Close the current page
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: FooterLayout(
          footer: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [],
            ),
          ),
          child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('1. Pick a Prompt'),
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      PromptCard(
                          prompt: 'What are you grateful for?',
                          onPromptSelected: (p) {
                            setState(() {
                              _prompt = p;
                            });
                          }),
                      PromptCard(
                          prompt:
                              'What is one thing about yourself that no one can take away?',
                          onPromptSelected: (p) {
                            setState(() {
                              _prompt = p;
                            });
                          }),
                      PromptCard(
                          prompt:
                              'What is one thing about yourself that no one can take away?',
                          onPromptSelected: (p) {
                            setState(() {
                              _prompt = p;
                            });
                          }),
                      PromptCard(
                          prompt:
                              'What is one thing about yourself that no one can take away?',
                          onPromptSelected: (p) {
                            setState(() {
                              _prompt = p;
                            });
                          }),
                      PromptCard(
                          prompt:
                              'What is one thing about yourself that no one can take away?',
                          onPromptSelected: (p) {
                            setState(() {
                              _prompt = p;
                            });
                          }),
                      PromptCard(
                          prompt:
                              'What is one thing about yourself that no one can take away?',
                          onPromptSelected: (p) {
                            setState(() {
                              _prompt = p;
                            });
                          }),
                      PromptCard(
                          prompt:
                              'What is one thing about yourself that no one can take away?',
                          onPromptSelected: (p) {
                            setState(() {
                              _prompt = p;
                            });
                          }),
                    ],
                  ),
                ),

                _prompt.isNotEmpty
                    ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text('2. Write down what\'s on your mind'),
                          ),
                          TextField(
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(_prompt),
                              hintText: 'What\'s on your mind?',
                            ),
                            controller: myController,
                          ),
                        ],
                      )
                    : Container(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         fixedSize: const Size(200, 200),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //       ),
                //       onPressed: () {},
                //       child: const Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(Icons.camera_alt_outlined),
                //           Text('Camera', textAlign: TextAlign.center)
                //         ],
                //       ),
                //     ),
                //     ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         fixedSize: const Size(200, 200),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //       ),
                //       onPressed: () {},
                //       child: const Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(Icons.photo_size_select_actual_outlined),
                //           Text('Gallery', textAlign: TextAlign.center)
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ])),
        ));
  }
}
