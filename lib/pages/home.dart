import 'package:auto_size_text/auto_size_text.dart';
import 'package:facebook_video_download/data/facebookData.dart';
import 'package:facebook_video_download/data/facebookPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geth();
  }

  geth() async {
    FacebookPost data = await FacebookData.postFromUrl(
        "https://www.facebook.com/watch/?v=135439238028475");
    print(data.postUrl);
    print(data.videoHdUrl);
    print(data.videoMp3Url);
    print(data.videoSdUrl);
    print(data.commentsCount);
    print(data.sharesCount);
  }

  List socialsicons = [
    'assets/instagram_logo.png',
    'assets/facebook_logo.png',
    'assets/twitter_logo.png',
  ];
  List names = [
    'Instagram',
    'Facebook',
    'Twitter',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 238, 238),
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    color: Colors.red,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(80)),
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 200,
              ),
              AutoSizeText(
                'Ultimate Downloader',
                maxLines: 1,
                maxFontSize: 20,
                minFontSize: 14,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(
                    child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Supported Sources',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Image.asset(
                            socialsicons[0],
                            scale: 2,
                          ),
                          Text(names[0])
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Image.asset(
                            socialsicons[1],
                            scale: 2,
                          ),
                          Text(names[1])
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Image.asset(
                            socialsicons[2],
                            scale: 2,
                          ),
                          Text(names[2])
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
