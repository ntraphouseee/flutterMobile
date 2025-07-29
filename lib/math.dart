import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Math extends StatefulWidget {
  const Math({super.key});

  @override
  State<Math> createState() => _MathState();
}

class _MathState extends State<Math> {
  final _angka1 = TextEditingController();
  final _angka2 = TextEditingController();
  String hasil = '';

  int? getangka1() => int.tryParse(_angka1.text);
  int? getangka2() => int.tryParse(_angka2.text);

  void plus() {
    int? number1 = getangka1();
    int? number2 = getangka2();
    setState(() {
      if (number1 != null && number2 != null) {
        hasil = 'hasil = ${number1 + number2}';
      } else {
        hasil = 'Input salah';
      }
    });
  }

  void kurang() {
    int? number1 = getangka1();
    int? number2 = getangka2();
    setState(() {
      if (number1 != null && number2 != null) {
        hasil = 'hasil = ${number1 - number2}';
      } else {
        hasil = 'Input salah';
      }
    });
  }

  void kali() {
    int? number1 = getangka1();
    int? number2 = getangka2();
    setState(() {
      if (number1 != null && number2 != null) {
        hasil = 'hasil = ${number1 * number2}';
      } else {
        hasil = 'Input salah';
      }
    });
  }

  void bagi() {
    int? number1 = getangka1();
    int? number2 = getangka2();
    setState(() {
      if (number1 != null && number2 != null) {
        if (number2 != 0) {
          hasil = 'hasil = ${number1 / number2}';
        } else {
          hasil = 'Tidak dapat dibagi dengan nol';
        }
      } else {
        hasil = 'Input salah';
      }
    });
  }

  void reset() {
    setState(() {
      _angka1.text = '';
      _angka2.text = '';
      hasil = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _angka1,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      hintText: "Angka pertama",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _angka2,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      hintText: "Angka kedua",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: plus,
                  child: Text("+", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: kurang,
                  child: Text("-", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: kali,
                  child: Text("x", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: bagi,
                  child: Text("÷", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Text(
              hasil,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: reset,
              child: Text("reset", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(100, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
