import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:test_flutter_mobile_project/bloc/ProfileCubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String nameToShow = (context.read<ProfileCubit>().state) ?? '';
    this.myController.text = (nameToShow);

    showModalForName(BuildContext builderContext) {
      return showDialog(
          context: builderContext,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<ProfileCubit>(),
              child: AlertDialog(
                title: const Text('Change Name'),
                content: TextFormField(
                  controller: myController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        context.read<ProfileCubit>().setName(myController.text);
                        Navigator.pop(context);
                      },
                      child: Text('Save'))
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings')
      ),
      body: BlocBuilder<ProfileCubit, String?>(builder: (context, state) {
        return SafeArea(
            child: SettingsList(sections: [
              SettingsSection(
                title: Text('Profile'),
                tiles: [
                  SettingsTile.navigation(
                    title: Text('Name'),
                    value: Text((state) ?? 'No name set'),
                    onPressed: (BuildContext context) {
                      showModalForName(context);
                    },
                  ),
                ],
              ),
              // SettingsSection(
              //   title: Text('Reminders'),
              //   tiles: [
              //     SettingsTile.switchTile(
              //         initialValue: false,
              //         onToggle: (value) {},
              //         title: Text('Enable Reminders')),
              //     SettingsTile.navigation(
              //       title: Text('Reminders'),
              //       value: Text('Every Day at 2pm'),
              //     ),
              //   ],
              // ),
            ]));
      }),
    );
  }
}
