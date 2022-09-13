import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:videodownloader/Widgets/downloaditem.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  bool isdownload = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 238, 238),
      appBar: AppBar(
          actions: [
            Center(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/play.gif',
                    scale: 5,
                  ),
                  Text(
                    'AD',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: (() {}),
            ),
          ],
          title: Text(
            'Downloads',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light,
          )),
      body: isdownload
          ? Downloaditem()
          : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/empty.png'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('No Downloads')
                  ]),
            ),
    );
  }
}
