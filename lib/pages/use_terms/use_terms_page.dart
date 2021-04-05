import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UseTermsPage extends StatefulWidget{
  @override
  _UseTermsPageState createState() => _UseTermsPageState();
}

class _UseTermsPageState extends State<UseTermsPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Use Terms"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                'https://www.gstatic.com/android/market_images/web/play_prism_hlock_2x.png'
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nUSE TERMS\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                    ),
                    TextSpan(
                      text: '1. Terms\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)
                    ),
                    TextSpan(
                      text:
                      'When accessing the application ',
                    ),
                    TextSpan(
                      text: 'tpl_form_sample',
                      style: TextStyle(color: Colors.blue),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () async{
                        final url = "https://github.com/espinhara/tpl_form_sample";
                        if(await canLaunch(url)){
                          await launch(
                            url,
                            forceSafariVC:false,
                          );
                        }else{
                          throw 'Could not launch $url';
                        }
                      }
                    ),
                    TextSpan(
                      text:
                      ', you agree to comply with these terms of service, all laws and'+
                      'applicable regulations and agree that you are responsible for compliance with all applicable laws'+
                      'applicable locations. If you do not agree with any of these terms, you are prohibited from using or'+
                      'access this app. The materials on this site are protected by copyright laws'+
                      'and applicable trademarks. \n\n',
                    ),
                    TextSpan(
                      text:
                      'We do not share personally identifiable information publicly or with third parties,'+
                      'except when required by law. \n\n',
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      ) ,
    );
  }
}