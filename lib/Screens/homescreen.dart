import 'package:flutter/material.dart';
import 'package:islami_app/tabs/Settings_Tab.dart';
import 'package:islami_app/tabs/To_Do_List_Tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [ToDOListTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("To Do List"),
        backgroundColor: Color(0xff5D9CEC),
      ),
      body: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.timestamp(),
        onDateChanged: (value) {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        backgroundColor: Color(0xff5D9CEC),
          child: Icon(
        Icons.add,
        color: Colors.white,
      )),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        surfaceTintColor: Colors.transparent,
        notchMargin: 20,
        height: 80,
        shadowColor: Colors.transparent,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
            onTap: (value) {
              Navigator.pushNamed(context, SettingsTab.routeName);
            }, items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
        ]),
      ),
    );
  }
}
