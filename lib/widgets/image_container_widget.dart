import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    required this.stage,
    required this.i,
    Key? key,
  }) : super(key: key);

  final int i;
  final String stage;

  @override
  Widget build(BuildContext context) {
    print(i);
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 150.0, minWidth: 150.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Theme.of(context).primaryColor,
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image:
                    AssetImage('assets/images/${stage.toLowerCase()}_$i.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
