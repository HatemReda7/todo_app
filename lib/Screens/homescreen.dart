import 'package:flutter/material.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:islami_app/tabs/settings/Settings_Tab.dart';
import 'package:islami_app/tabs/tasks/Add_Task_BottomSheet.dart';
import 'package:islami_app/tabs/tasks/To_Do_List_Tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [ToDOListTab(), SettingsTab()];

  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        centerTitle: false,
        title: Text("To Do"),
      ),
      body: tabs[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
        showSheet();
      },
        shape: CircleBorder(
          side: BorderSide(color: Colors.white,width: 3)
        ),
      child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        height: 80,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
            onTap: (value) {
              index=value;
              setState(() {

              });
            },
            currentIndex: index,
            items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
        ]),
      ),
    );
  }
  
  void showSheet(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context) {
      return Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: AddTaskBottomSheet(),
      );
    },);
  }
}
