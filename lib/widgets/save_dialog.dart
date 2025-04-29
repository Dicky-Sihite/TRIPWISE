import 'package:flutter/material.dart';

void showSaveDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Simpan Berhasil!'),
      content: Text('Hasil sudah disimpan ke aplikasi.'),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        )
      ],
    ),
  );
}
