import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fifth_exam/state_manegers/cubit/connectivity/connectivity_cubit.dart';
import 'package:fifth_exam/ui/no_internet/no_internet_screen.dart';
import 'package:fifth_exam/ui/tab_box/first_task/first_task_screen.dart';
import 'package:fifth_exam/ui/tab_box/fourth_task/fourth_task_screen.dart';
import 'package:fifth_exam/ui/tab_box/second_task/second_task_screen.dart';
import 'package:fifth_exam/ui/tab_box/third_task/third_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List screens = [
      FirstTaskScreen(),
      SecondTaskScreen(),
      ThirdTaskScreen(),
      FourthTaskScreen(),
    ];
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoInternetScreen(voidCallback: _init),
            ),
          );
        }
      },
      child: Scaffold(
        body: screens[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            currentPage = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "A",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "B",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: "C",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp),
              label: "D",
            )
          ],
        ),
      ),
    );
  }
}
