import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DetailsPage.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: 350,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Image.asset('asset/images/flutter-logo.png'),
              // child: CachedNetworkImage(
              //   progressIndicatorBuilder: (context, url, progress) => Center(
              //     child: CircularProgressIndicator(
              //       value: progress.progress,
              //     ),
              //   ),
              //   imageUrl: 'asset/images/flutter-logo.png',
              // ),
            ),
            Container(
              height: 250,
              width: 350,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl:
                    'https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg',
              ),
            ),
            Container(
              height: 50,
              color: Colors.blue,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextButton(
                child: Text(
                  'Details',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailsPage()));
                },
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
