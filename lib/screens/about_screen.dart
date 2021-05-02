import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  final version;
  final buildNumber;

  AboutScreen({required this.buildNumber, required this.version}) {
    assert(buildNumber != null);
    assert(version != null);
  }

  @override
  Widget build(BuildContext context) {
    void _launchURL(String url) async => await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white70,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
              ),
              Hero(
                tag: 'logo',
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'About',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Math Pics One Word',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'v$version($buildNumber)',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400.0,
                  ),
                  child: new Stack(
                    children: <Widget>[
                      Card(
                        elevation: 20.0,
                        color: Theme.of(context).accentColor,
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60.0,
                              ),
                              Text(
                                'Develop and Designed by',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'Nehry Dedoro',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SignInButton(
                                    Buttons.Facebook,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    mini: true,
                                    elevation: 4.0,
                                    onPressed: () {
                                      _launchURL(
                                          'https://www.facebook.com/nehry.08/');
                                    },
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  SignInButton(
                                    Buttons.GitHub,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    mini: true,
                                    elevation: 4.0,
                                    onPressed: () {
                                      _launchURL('https://github.com/enehry');
                                    },
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  SignInButton(
                                    Buttons.Email,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    mini: true,
                                    elevation: 4.0,
                                    onPressed: () {
                                      _launchURL(
                                          'mailto:enehry@gmail.com?subject=&body=');
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      FractionalTranslation(
                        translation: Offset(0.0, -0.4),
                        child: Align(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.black54,
                                    spreadRadius: 2),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 42.0,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                foregroundImage:
                                    AssetImage('assets/icons/nehry.png'),
                                radius: 40.0,
                              ),
                            ),
                          ),
                          alignment: FractionalOffset(0.5, 0.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
