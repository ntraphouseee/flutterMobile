import 'package:flutter/material.dart';
import 'package:project_pertama_flutter/login.dart';
import 'package:project_pertama_flutter/math.dart';
// import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void math() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Math()),
    );
  }

  void _goBackToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25),
            const Text(
              "Selamat datang di Home Page",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: math,
                      child: Image.asset("asset/math.png"),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.blueAccent[400],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: _goBackToLogin,
                      child: Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                        size: 70,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.blueAccent[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
