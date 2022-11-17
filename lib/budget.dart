import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';

Drawer drawerClass(BuildContext context) {
  return Drawer(
    child: Column(children: [
      // Menambahkan clickable menu
      ListTile(
        title: const Text('counter_7'),
        onTap: () {
          // Route menu ke halaman utama
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        },
      ),
      ListTile(
        title: const Text('Tambah Budget'),
        onTap: () {
          // Route menu ke halaman form
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyFormPage()),
          );
        },
      ),
      ListTile(
        title: const Text('Data Budget'),
        onTap: () {
          // Route menu ke halaman form
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyBudgetPage()),
          );
        },
      ),
    ]),
  );
}

class MyBudgetPage extends StatefulWidget {
  const MyBudgetPage({super.key});

  @override
  State<MyBudgetPage> createState() => _MyBudgetPageState();
}

class _MyBudgetPageState extends State<MyBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: drawerClass(context),
        body: FormBudget.budgets.isEmpty
        // jika belum ada data
            ? const Center(
          child: Text('Belum ada data yang tersimpan.'),
        )
        // jika sudah ada data
            : Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: FormBudget.budgets.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: ListTile(
                      title: Text(FormBudget.budgets[index].judul),
                      subtitle:
                      Text(FormBudget.budgets[index].nominal.toString()),
                      trailing:
                      Padding(padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text(FormBudget.budgets[index].jenis.toString()),
                            Text("${FormBudget.budgets[index].date.day}/${FormBudget.budgets[index].date.month}/${FormBudget.budgets[index].date.year}")
                          ],)
                      )

                  ),
                ),
              );
            },
          ),
        ));
  }
}