import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class Network{
  String url;
  Network(this.url);
  Future getData() async {
    try{
      Response _response = await get(Uri.parse(url));
      if(_response.statusCode == 200 ){
        return json.decode(_response.body);
      }
    }
    catch(e) {
      throw Exception("error");
    }
  }

}


launchUrl(String url,BuildContext context) async {
  try{
    await launch(url, enableJavaScript: true,enableDomStorage: true);

  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Could not launch url"),backgroundColor: Colors.red,));
  }
}

