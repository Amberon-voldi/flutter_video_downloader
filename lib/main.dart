import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:facebook_video_download/facebook_video_download.dart';
import 'package:videodownloader/Models/youtubedowloader.dart';
import 'package:videodownloader/pages/Downloads.dart';
import 'package:videodownloader/pages/home.dart';
import 'package:youtube_downloader/youtube_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> pages = <Widget>[const Home(), const Downloads()];

  void changeindex(int index) {
    if (i == 0) {
      setState(() {
        i = 1;
      });
    } else if (i == 1) {
      setState(() {
        i = 0;
      });
    }
    print('index changed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages.elementAt(i)),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          currentIndex: i,
          selectedItemColor: Colors.red,
          onTap: changeindex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: 'Downloads'),
          ]),
    );
  }
}

//Download reel video on button clickl
  // void download() async {

  //   await FlutterDownloader.enqueue(
  //     url: '$myvideourl',
  //     savedDir: '/sdcard/Download',
  //     showNotification: true,
  //     // show download progress in status bar (for Android)
  //     openFileFromNotification:
  //         true, // click on notification to open downloaded file (for Android)
  //   ).whenComplete(() {
  //     setState(() {
  //       downloading = false; // set to false to stop Progress indicator
  //     });
  //   });
  // }

