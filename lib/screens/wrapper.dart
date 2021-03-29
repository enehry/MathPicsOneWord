import 'package:flutter/material.dart';
import 'package:four_pics_one_word/screens/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final value = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  content: Text('Are you sure you want to exit?',
                      style: Theme.of(context).textTheme.bodyText1),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'No',
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Yes',
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              });

          return value == true;
        },
        child: HomeScreen());
  }
}
