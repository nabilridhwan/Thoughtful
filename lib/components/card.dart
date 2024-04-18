import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../bloc/Item.dart';
import '../bloc/ItemCubit.dart';

class ItemCard extends StatelessWidget {
  Item item;

  ItemCard({
    super.key,
    required this.item,
  });

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context, 'Cancel');
      },
    );
    Widget continueButton = TextButton(
      child: Text("Delete"),
      onPressed: () {
        // DatabaseService.deleteItem(item.id);

        context.read<ItemCubit>().deleteItem(item.id);
        Navigator.pop(context, 'Delete');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure you want to delete this Thought?"),
      content: Text(
          "Thoughts deleted cannot be recovered. This action cannot be undone."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // _showDeleteConfirmationDialog(context);
              context.read<ItemCubit>().deleteItem(item.id);
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
          // SlidableAction(
          //   onPressed: (context) {
          //     log('hello');
          //   },
          //   icon: Icons.edit,
          //   backgroundColor: Colors.grey,
          // ),
        ],
      ),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
            color: Color(0xff212121),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  item?.title ?? '',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item?.content ?? ''),
              ),
            ],
          )),
    );
  }
}

class CardButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CardButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        elevation: 5,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        shadows: <Shadow>[
          Shadow(color: Colors.black.withAlpha(100), blurRadius: 15.0)
        ],
        size: 20,
      ),
    );
  }
}
