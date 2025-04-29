import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';

class ResultScreen extends StatelessWidget {
  final int days;
  final double hotel;
  final double food;
  final double transport;
  final double tour;
  final double others;

  const ResultScreen({
    Key? key,
    required this.days,
    required this.hotel,
    required this.food,
    required this.transport,
    required this.tour,
    required this.others,
  }) : super(key: key);

  // Fungsi untuk format angka ke format Rupiah
  String formatRupiah(double number) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0,
    );
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    double total = (hotel + food) * days + transport + tour + others;
    double dailyExpense = total / days;

    Map<String, double> dataMap = {
      "Akomodasi": hotel * days,
      "Makan": food * days,
      "Transportasi": transport,
      "Wisata": tour,
      "Lain-lain": others,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Siapin Segini Bray',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Total', style: TextStyle(fontSize: 16)),
                    Text(formatRupiah(total), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    const Text('Pengeluaran Harian', style: TextStyle(fontSize: 16)),
                    Text(formatRupiah(dailyExpense), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text('Charts', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  PieChart(
                    dataMap: dataMap,
                    chartRadius: MediaQuery.of(context).size.width / 2.2,
                    chartType: ChartType.disc,
                    legendOptions: const LegendOptions(
                      showLegends: true,
                      legendPosition: LegendPosition.right,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...dataMap.entries.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.key, style: const TextStyle(fontSize: 14)),
                        Text(formatRupiah(e.value), style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue.shade100,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Hitung Ulang'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _showSaveDialog(context);
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Simpan Berhasil!'),
        content: const Text('Hasil sudah disimpan ke aplikasi.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
