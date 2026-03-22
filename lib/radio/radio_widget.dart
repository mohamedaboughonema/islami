import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/provider/radio_manager_provider.dart';
import 'package:islami_app/radio/radio_response.dart';
import 'package:provider/provider.dart';

class RadioWidget extends StatefulWidget {
  final String title;
  final Radios model;
  const RadioWidget({super.key, required this.title, required this.model});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isMuted = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<RadioManagerProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: provider.currentPlayingUrl == widget.model.url
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
                        provider.toggleFavourite(widget.model.url!);
                      },
                      icon: Icon(
                        provider.favouriteUrls.contains(widget.model.url)
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
                        provider.play(widget.model.url!);
                      },
                      icon: Icon(
                        provider.currentPlayingUrl == widget.model.url &&
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
                        if (provider.currentPlayingUrl == widget.model.url) {
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
                        if (provider.currentPlayingUrl == widget.model.url) {
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
