import 'package:flutter/material.dart';
import 'result_screen.dart';

class CalculateScreen extends StatefulWidget {
  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  final _daysController = TextEditingController();
  final _hotelController = TextEditingController();
  final _foodController = TextEditingController();
  final _transportController = TextEditingController();
  final _tourController = TextEditingController();
  final _othersController = TextEditingController();

  void _calculate() {
    int days = int.tryParse(_daysController.text) ?? 0;
    double hotel = double.tryParse(_hotelController.text) ?? 0;
    double food = double.tryParse(_foodController.text) ?? 0;
    double transport = double.tryParse(_transportController.text) ?? 0;
    double tour = double.tryParse(_tourController.text) ?? 0;
    double others = double.tryParse(_othersController.text) ?? 0;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(
              days: days,
              hotel: hotel,
              food: food,
              transport: transport,
              tour: tour,
              others: others,
            )));
  }

  void _clear() {
    _daysController.clear();
    _hotelController.clear();
    _foodController.clear();
    _transportController.clear();
    _tourController.clear();
    _othersController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hitung Brayy')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField('Jumlah Hari ?', _daysController),
            _buildTextField('Biaya Akomodasi per Malam', _hotelController),
            _buildTextField('Biaya Makan per Hari', _foodController),
            _buildTextField('Biaya Transportasi', _transportController),
            _buildTextField('Biaya Tempat Wisata', _tourController),
            _buildTextField('Biaya Lain-lain', _othersController),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _clear,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Hapus'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _calculate,
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Hitung Biaya'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
