import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      child: const KalkulatorApp(),
    ),
  );
}

class KalkulatorApp extends StatelessWidget {
  const KalkulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: KalkulatorPage(),
    );
  }
}

class KalkulatorPage extends StatelessWidget {
  final TextEditingController angka1 = TextEditingController();
  final TextEditingController angka2 = TextEditingController();

  KalkulatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: angka1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Angka 1",
                        prefixIcon: Icon(Icons.calculate),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: angka2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Angka 2",
                        prefixIcon: Icon(Icons.calculate_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildButton("+", provider),
                _buildButton("-", provider),
                _buildButton("×", provider),
                _buildButton("÷", provider),
              ],
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 5,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Hasil: ${provider.hasil}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String op, CalculatorProvider provider) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {
        provider.hitung(
          double.tryParse(angka1.text) ?? 0,
          double.tryParse(angka2.text) ?? 0,
          op,
        );
      },
      child: Text(op, style: const TextStyle(fontSize: 22)),
    );
  }
}
