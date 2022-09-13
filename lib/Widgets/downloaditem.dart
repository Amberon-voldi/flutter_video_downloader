import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Downloaditem extends StatefulWidget {
  const Downloaditem({Key? key}) : super(key: key);

  @override
  State<Downloaditem> createState() => _DownloaditemState();
}

class _DownloaditemState extends State<Downloaditem> {
  int progress = 0;

  ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort!.send([id, status, progress]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");

    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      print(progress);
    });

    FlutterDownloader.registerCallback(downloadingCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$progress",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 60,
          ),
          FlatButton(
            child: Text("Start Downloading"),
            color: Colors.redAccent,
            textColor: Colors.white,
            onPressed: () async {
              final status = await Permission.storage.request();

              if (status.isGranted) {
                final externalDir = await getExternalStorageDirectory();

                final id = await FlutterDownloader.enqueue(
                  url:
                      "https://d2hfaq2qmdyyju.cloudfront.net/bhasad_trailer.mp4",
                  savedDir: externalDir!.path,
                  fileName: "download",
                  showNotification: true,
                  openFileFromNotification: true,
                );
              } else {
                print("Permission deined");
              }
            },
          )
        ],
      ),
    );
  }
}
