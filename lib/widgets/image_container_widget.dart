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
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 150.0, minWidth: 150.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0, // soften the shadow
                spreadRadius: 4.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  10.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            color: Theme.of(context).primaryColor,
          ),
          child: GestureDetector(
            onTap: () {
              showGeneralDialog(
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionBuilder: (context, a1, a2, widget) {
                    return Transform.scale(
                      scale: a1.value,
                      child: Opacity(
                        opacity: a1.value,
                        child: AlertDialog(
                          contentPadding: EdgeInsets.all(10.0),
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          content: Container(
                            constraints: BoxConstraints(
                                maxHeight: 300.0, maxWidth: 300.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/${stage.toLowerCase()}_$i.jpg'),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 200),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {
                    return Container();
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage('assets/images/${stage.toLowerCase()}_$i.jpg'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
