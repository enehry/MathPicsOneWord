import 'package:flutter/material.dart';

class LongButtonWidget extends StatelessWidget {
  const LongButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  final Function onPressed;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
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
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size(240.0, 70.0)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Theme.of(context).buttonColor.withOpacity(0.5);
              return Theme.of(context)
                  .buttonColor; // Use the component's default.
            },
          ),
        ),
        onPressed: onPressed as void Function()?,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 260.0,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline1,
                ),
                subtitle == null
                    ? Container()
                    : Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
