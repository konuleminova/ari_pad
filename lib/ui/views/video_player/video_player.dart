import 'package:ari_pad/ui/common_widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoPlayerView> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    VideoPlayerController.network('https://bees.az/videoinstructions/video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play().then((value) {
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: _controller.value.initialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(child: Loading(),),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
