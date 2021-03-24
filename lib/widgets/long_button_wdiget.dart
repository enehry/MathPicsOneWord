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
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(240.0, 70.0)),
        elevation: MaterialStateProperty.all<double>(10.0),
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
    );
  }
}
