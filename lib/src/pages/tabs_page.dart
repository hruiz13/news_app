import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
   
  const TabsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _Pages(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Para ti',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Encabezados',
          ),
        ],
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        )
      ],
    );
  }
}