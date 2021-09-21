import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);
    // print(brews!.docs);
    // for (var doc in brews!.docs) {
    //   print(doc.data());
    // }
    int len;
    if (brews != null) {
      len = brews.length;
      brews.forEach((brew) {
        print(brew.name);
        print(brew.sugar);
        print(brew.strength);
      });
    } else {
      len = 0;
    }
    // return Container();

    return ListView.builder(
        itemCount: len,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.5,
            shadowColor: Colors.black,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.brown[brews![index].strength],
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     image: NetworkImage(movieList[index].images[0]),
                      //     fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                  child: null,
                ),
              ),
              title: Text(brews![index].name),
              // title: Text(brews.docs[index]['strength'].toString()),
              subtitle: Text("Takes ${brews![index].sugar} sugar"),
              // trailing: const Text("..."),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => MovieListViewDetails(
                //               movieName: movieList.elementAt(index).title,
                //               movie: movieList[index],
                //             )));
              },
              // onTap: () =>
              //     debugPrint("The movie name is ${movies.elementAt(index)}"),
            ),
          );
        });
  }
}
