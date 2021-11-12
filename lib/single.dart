import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'components/menu_item.dart';
import 'constants.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({Key? key}) : super(key: key);

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  late YoutubePlayerController _controller;

  final bool _isPlayerReady = false;

  final List<String> _ids = [
    'X4BnhhRsx3c',
    '5hIWeR8UTyw',
    'L4T3hYnh53g',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? itemIndex = ModalRoute.of(context)!.settings.arguments as int;

    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          onReady: () {},
          onEnded: (data) {
            _controller
                .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          },
        ),
        builder: (context, player) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Hero(
                              tag: itemIndex,
                              child: Material(
                                color: Colors.transparent,
                                child: menuItem(context, () {
                                  Navigator.pop(context);
                                },
                                    Constants.konular[itemIndex],
                                    'assets/svgs/icons/' +
                                        Constants.menuIcons[itemIndex],
                                    itemIndex % 2 == 0
                                        ? Alignment.centerLeft
                                        : Alignment.centerRight),
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 7,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              player,
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                    text: "Bu Bölüm Ne Anlatıyor\n",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text:
                                              "Hayatımız boyunca inandığımız yaratıcıya hiç kainattan deliller aradık mı?\nVeya bilgilerimizi yeterli mi buluyoruz?\n\nMalesef hız ve haz çağında bu konular gündemimize pek gelmiyor.\n\nBence çok geç olmadan bir yerden başlamalıyız.\n\nBu videomuzda Risale-i Nur’daki 23. Lema’dan alıntılarla beraber tefekkür alemine dalacağız.\n\nAllah bilir belki de bu senin için yeni bir başlangıç olur. :)\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15)),
                                    ]),
                              ),
                              ElevatedButton.icon(
                                  onPressed: _showDialog,
                                  icon: Icon(Icons.star),
                                  label: Text("1. Söz Okumaya Başla"))
                            ],
                          ),
                        ),
                      )
                    ],
                  )));
        });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Şimdilik buraya kadar"),
          content: Text(""),
          actions: [
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
