import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_pics_one_word/providers/audio_player_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AudioPlayerProvider.playLoad();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 180.0,
                maxWidth: 180.0,
              ),
              child: SvgPicture.asset('assets/icons/logo.svg')),
        ),
      ),
    );
  }
}
