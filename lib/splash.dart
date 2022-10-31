import 'package:flutter/material.dart';
import 'package:test_attendance/Login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/tilak.png", height: 250),
            SizedBox(height: 10),
            Container(
              child: Text(
                'वैष्णव Attendance',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                'Hare Krishna',
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }
}
