import 'dart:io';

import 'package:flutter/material.dart';

import 'package:band_name/models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 3),
    Band(id: '2', name: 'SOAD', votes: 1),
    Band(id: '3', name: 'Maron V', votes: 3),
    Band(id: '6', name: 'Linking Park', votes: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Band APP',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBad,
        child: Icon(Icons.add),
        elevation: 1,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: ( direction ){
        // TODO: llamar el borrado en el server
        print('id: ${band.id}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete band', style: TextStyle(color: Colors.white),),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            band.name.substring(0, 2),
          ),
          backgroundColor: Colors.blue[300],
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}'),
        onTap: () => print(band.id),
      ),
    );
  }

  addNewBad() {
    final textEditingController = new TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Band name:'),
            content: TextField(
              controller: textEditingController,
            ),
            actions: [
              MaterialButton(
                onPressed: () => addBandToList(textEditingController.text),
                child: Text('Add'),
                textColor: Colors.blue,
              )
            ],
          );
        },
      );
    }
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
