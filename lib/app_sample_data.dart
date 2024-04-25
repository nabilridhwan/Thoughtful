import 'package:uuid/uuid.dart';

import 'repository/Item.dart';

List<Item?> items = [
  null,
  Item(
      id: Uuid().v4(),
      title: 'What are three things that I am grateful for?',
      content: '1. My Friends\n2. My Family\n3. My Health',
      onPressed: () {},
      createdAt: DateTime.now()),
  Item(
    id: Uuid().v4(),
    title: 'Look at this cute dog!',
    content: 'This is a cute dog',
    onPressed: () {},
    createdAt: DateTime.now(),
  ),
  Item(
    id: Uuid().v4(),
    title: 'Look at this cute bird!',
    content: 'This is a cute bird',
    onPressed: () {},
    createdAt: DateTime.now(),
  ),
  Item(
    id: Uuid().v4(),
    title: 'Look at this cute fish!',
    content: 'This is a cute fish',
    onPressed: () {},
    createdAt: DateTime.now(),
  ),
  Item(
    id: Uuid().v4(),
    title: 'Look at this cute rabbit!',
    content: 'This is a cute rabbit',
    onPressed: () {},
    createdAt: DateTime.now(),
  ),
  Item(
    id: Uuid().v4(),
    title: 'Look at this cute hamster!',
    content: 'This is a cute hamster',
    onPressed: () {},
    createdAt: DateTime.now(),
  ),
  Item(
    id: Uuid().v4(),
    title: 'Look at this cute snake!',
    content: 'This is a cute snake',
    onPressed: () {},
    createdAt: DateTime.now(),
  ),
  Item(
    id: Uuid().v4(),
    title: 'Look at this cute turtle!',
    content: 'This is a cute turtle',
    onPressed: () {},
    createdAt: DateTime.now(),
  ),
];
