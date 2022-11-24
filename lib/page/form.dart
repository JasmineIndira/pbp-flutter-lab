import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/page/budget.dart';


class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class Budget {
  String judul;
  int nominal;
  String jenis;
  DateTime date;

  Budget(this.judul, this.nominal, this.jenis, this.date);
}

class FormBudget {
  static List<Budget> budgets = [];
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String? _jenisPemasukan;
  DateTime? date;
  List<String> listPemasukan = ["Pemasukan", "Pengeluaran"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      // membuat drawer
      drawer: drawerClass(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // field judul
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Sate Pacil",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                       _judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                // field nominal
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers
                    decoration: InputDecoration(
                      hintText: "Contoh: 18000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _nominal = int.tryParse(value!)!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _nominal = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      } else if (int.tryParse(value) == null) {
                        // tryparse return null jika tidak bisa di parse
                        return 'Nominal harus angka!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050))
                            .then((newDate) {
                          setState(() {
                            date = newDate;
                          });
                        });
                      },
                      child: Text(date == null
                          ? "Pilih tanggal"
                          : "${date!.day}/${date!.month}/${date!.year}"),
                    )),
                DropdownButton(
                  hint: Text("Pilih Jenis"),
                  value: _jenisPemasukan,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: listPemasukan.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _jenisPemasukan = newValue!;
                    });
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // tambahkan data ke list
                        FormBudget.budgets
                            .add(Budget(_judul, _nominal, _jenisPemasukan!, date!));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil disimpan!'),
                          ),
                        );

                        // Mengosongkan form
                        _formKey.currentState!.reset();
                        date = null;
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
