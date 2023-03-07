import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SettingsWidget(
                ontap: () {}, icon: Icons.person, title: 'My Profile'),
            SettingsWidget(
              ontap: () {},
              icon: Icons.message,
              title: 'Messages',
              counter: 1,
            ),
            SettingsWidget(
              ontap: () {},
              icon: Icons.notifications,
              title: 'Notifications',
              counter: 3,
            ),
            SettingsWidget(
                ontap: () {}, icon: Icons.badge, title: 'Manage Projects'),
          ],
        ),
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget(
      {super.key,
      required this.ontap,
      required this.icon,
      required this.title,
      this.counter});

  final Function ontap;
  final IconData icon;
  final String title;
  final int? counter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Card(
        child: Material(
          shadowColor: Color.fromARGB(255, 236, 232, 232),
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: ListTile(
            onTap: () {
              ontap();
            },
            trailing: Stack(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Colors.blue,
                ),
                Positioned(
                    right: 0,
                    bottom: 20,
                    child: counter == null
                        ? Container()
                        : Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Text(
                              '$counter',
                              style: TextStyle(color: Colors.red, fontSize: 9),
                            ),
                          ))
              ],
            ),
            leading: Text(
              title,
              style: TextStyle(
                  fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
