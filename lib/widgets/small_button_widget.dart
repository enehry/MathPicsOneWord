import 'package:flutter/material.dart';

class SmallButtonWidget extends StatelessWidget {
  const SmallButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
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
          minimumSize: MaterialStateProperty.all<Size>(
            Size(40.0, 50.0),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return color.withOpacity(0.5);
              return color; // Use the component's default.
            },
          ),
        ),
        onPressed: onPressed as void Function()?,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
