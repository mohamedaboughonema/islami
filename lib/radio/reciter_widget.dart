import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/provider/radio_manager_provider.dart';
import 'package:islami_app/radio/reciter_response.dart';
import 'package:provider/provider.dart';

class ReciterWidget extends StatefulWidget {
  final String title;
  final Reciters model;
  const ReciterWidget({super.key, required this.title, required this.model});

  @override
  State<ReciterWidget> createState() => _ReciterWidgetState();
}

class _ReciterWidgetState extends State<ReciterWidget> {
  bool isMuted = false;
  String? reciterUrl;

  @override
  void initState() {
    getReciterUrl();
    super.initState();
  }

  void getReciterUrl() {
    reciterUrl = "${widget.model.moshaf![0].server}002.mp3";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioManagerProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: provider.currentPlayingUrl == reciterUrl
                      ? AssetImage('assets/images/soundWave.png')
                      : AssetImage('assets/images/mosque_radio.png'),
                  alignment: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(20),
              color: AppColor.gold),
          child: Column(
            children: [
              Center(
                child: Text(widget.title,
                    style: TextStyle(
                        color: AppColor.darkBrown,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        provider.toggleFavourite(reciterUrl!);
                      },
                      icon: Icon(
                        provider.favouriteUrls.contains(reciterUrl)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColor.darkBrown,
                        size: 40,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () async {
                        provider.play(reciterUrl!);
                      },
                      icon: Icon(
                        provider.currentPlayingUrl == reciterUrl &&
                                provider.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: AppColor.darkBrown,
                        size: 50,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () async {
                        if (provider.currentPlayingUrl == reciterUrl) {
                          await provider.stop();
                        }
                      },
                      icon: Icon(
                        Icons.stop,
                        color: AppColor.darkBrown,
                        size: 50,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () async {
                        isMuted = !isMuted;
                        if (provider.currentPlayingUrl == reciterUrl) {
                          await provider.setVolume(isMuted ? 0 : 1);
                          print(
                              'Volume: ${isMuted}, ${provider.currentvolume}');
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        isMuted ? Icons.volume_off : Icons.volume_up,
                        color: AppColor.darkBrown,
                        size: 40,
                      )),
                  Spacer(),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
