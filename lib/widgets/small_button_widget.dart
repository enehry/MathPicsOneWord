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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.5),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(10.0),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(40.0, 45.0),
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
