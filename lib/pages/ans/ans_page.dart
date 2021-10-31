import 'package:flutter/material.dart';

class AnsPage extends StatelessWidget {
  const AnsPage({Key? key}) : super(key: key);
  static const routeName = '/ans_page';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/images/vote_hand.png',
                height: 80.0,
              ),
              const Text(
                'EXIT POLL',
                style: TextStyle(
                  fontSize: 26.0,
                ),
              ),
              const Text(
                'RESULT',
                style: TextStyle(
                  fontSize: 26.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
