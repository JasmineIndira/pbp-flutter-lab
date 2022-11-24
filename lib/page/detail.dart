import 'package:counter_7/model/myWatchListModel.dart';
import 'package:counter_7/page/budget.dart';
import 'package:flutter/material.dart';

class WatchListDetail extends StatelessWidget {
  final MyWatchListModel watchlists;
  WatchListDetail({super.key, required this.watchlists});
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      drawer: drawerClass(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          Center(
              child: Text(
                watchlists.fields.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
          const SizedBox(height: 15), // add space
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Release Date: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "${months[watchlists.fields.releaseDate.month - 1]} ${watchlists.fields.releaseDate.day}, ${watchlists.fields.releaseDate.year}",
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              const SizedBox(height: 10), // add space
              Row(
                children: [
                  const Text(
                    "Rating: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "${watchlists.fields.rating}/5",
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              const SizedBox(height: 10), // add space
              Row(
                children: [
                  const Text(
                    "Status: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  if (watchlists.fields.watched == "no")
                    const Text(
                      "not watched",
                      style: TextStyle(fontSize: 18),
                    )
                  else
                    const Text(
                      "watched",
                      style: TextStyle(fontSize: 18),
                    )
                ],
              ),
              SizedBox(height: 10), // add space
              Row(
                children: const [
                  Text(
                    "Review: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        watchlists.fields.review,
                        style: const TextStyle(fontSize: 18),
                      ))
                ],
              ),
            ],
          )
        ]),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}