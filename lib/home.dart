import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:tel_input/tel_input.dart';

import 'package:flutter_country_picker/flutter_country_picker.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Country _selected;
  static TextEditingController numberController = TextEditingController();
  static TextEditingController messageController = TextEditingController();
  void sendMessage() async {
    String url =
        "https://wa.me/${_selected.dialingCode}${numberController.text}?text=${messageController.text}";
    setState(() async {
      return await launch(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Direct WhatsApp Chat"),
        centerTitle: true,
        titleSpacing: 1.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CountryPicker(
              showDialingCode: true,
              onChanged: (Country country) {
                setState(() {
                  _selected = country;
                });
              },
              selectedCountry: _selected,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextField(
                  controller: numberController,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      labelText: "Phone number",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  cursorColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: messageController,
                decoration: new InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: '',
                    helperText: 'Keep it short!!',
                    labelText: 'Message',
                    prefixIcon: const Icon(
                      Icons.message,
                      color: Colors.green,
                    ),
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),
            ),
            RaisedButton(
              onPressed: sendMessage,
              child: Text("Send Message!!"),
              splashColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
