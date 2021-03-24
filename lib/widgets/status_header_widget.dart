import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_pics_one_word/providers/game_screen_provider.dart';
import 'package:provider/provider.dart';

class StatusHeaderWidget extends StatelessWidget {
  const StatusHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameScreenProvider = context.watch<GameScreenProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/icons/stages.svg'),
              SizedBox(
                width: 10.0,
              ),
              Text(
                gameScreenProvider.stage.toString(),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.white,
                    ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                gameScreenProvider.coins.toString(),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(
                width: 10.0,
              ),
              SvgPicture.asset('assets/icons/coin.svg'),
            ],
          )
        ],
      ),
    );
  }
}
