import 'package:flutter/material.dart';
import 'package:four_pics_one_word/providers/game_screen_provider.dart';
import 'package:four_pics_one_word/widgets/image_container_widget.dart';
import 'package:provider/provider.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          for (var i = 0; i <= 1; i++)
            Expanded(
              child: Row(
                children: [
                  for (var j = 0; j <= 1; j++)
                    ImageContainerWidget(
                      i: i <= 0 ? i + j + 1 : i + j + 2,
                      stage:
                          context.watch<GameScreenProvider>().answer!.join(""),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
