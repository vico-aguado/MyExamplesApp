import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class OauthPage extends StatefulWidget {
  @override
  _OauthPageState createState() => _OauthPageState();
}

class _OauthPageState extends State<OauthPage> {
  final authorizationEndpoint =
      Uri.parse("https://wakatime.com/oauth/authorize");
  final tokenEndpoint = Uri.parse("https://wakatime.com/oauth/token");

  final identifier = "G5BcUkF5dx5PzrCu1P5UdUel";
  final secret =
      "sec_GJPimW33qFCxqtebbFGyZFieEqj91p1RgRiQqIkb2RG00RPbiBsqKWSPOqF1KymqXKm0sJbmSPiGVPGm";

  final redirectUrl = Uri.parse("https://wakatime.com/oauth/test");

  final credentialsFile = File("credentials.json");

  final MyInAppBrowser inAppBrowser = MyInAppBrowser();
  
  Future<String> redirect(String url) async{
    
    inAppBrowser.open(url:url);    
    
    return await inAppBrowser.completer.future;
  }

  Future<oauth2.Client> getClient() async {
    var exists = await credentialsFile.exists();

    print("existe: $exists");

    if (exists) {
      var credentials =
          oauth2.Credentials.fromJson(await credentialsFile.readAsString());
      return oauth2.Client(credentials, identifier: identifier, secret: secret);
    }

    var grant = new oauth2.AuthorizationCodeGrant(
        identifier, authorizationEndpoint, tokenEndpoint,
        secret: secret, delimiter: ",");


    Uri urlRedirect = grant.getAuthorizationUrl(redirectUrl, scopes: "email,read_logged_time,write_logged_time,read_stats,read_orgs,read_private_leaderboards,write_private_leaderboards".split(","));
    //String scopes = "&scope=email,read_logged_time,write_logged_time,read_stats,read_orgs,read_private_leaderboards,write_private_leaderboards";
    print(urlRedirect.toString());
         
    String result = await redirect(urlRedirect.toString());
    print("result: $result");
    var uri = Uri.parse(result);
    return await grant.handleAuthorizationResponse(uri.queryParameters);
  }

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oauth'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch oauth'),
          onPressed: () {
            getClient()/*.then((client){
                print(client);
                credentialsFile.writeAsString(client.credentials.toJson());
                var read = client.read("https://wakatime.com/api/v1/users/current/projects");
                print(read);
            })*/;
          },
        ),
      ),
    );
  }
}


class MyInAppBrowser extends InAppBrowser {

  var completer = new Completer();
  String url = "";
  
  @override
  void onBrowserCreated() async {
    print("\n\nBrowser Ready!\n\n");
  }
  
  @override
  void onLoadStart(String _url) {
    print("\n\nStarted $_url\n\n");
    url = _url;
  }

  @override
  Future onLoadStop(String _url) async {
    print("\n\nStopped $_url\n\n");

    url = _url;
    /*
    // call a javascript message handler
    await this.webViewController.injectScriptCode("window.flutter_inappbrowser.callHandler('handlerNameTest', 1, 5,'string', {'key': 5}, [4,6,8]);");

    // print body html
    print(await this.webViewController.injectScriptCode("document.body.innerHTML"));

    // console messages
    await this.webViewController.injectScriptCode("console.log({'testObject': 5});"); // the message will be: [object Object]
    await this.webViewController.injectScriptCode("console.log('testObjectStringify', JSON.stringify({'testObject': 5}));"); // the message will be: testObjectStringify {"testObject": 5}
    await this.webViewController.injectScriptCode("console.error('testError', false);"); // the message will be: testError false

    // add jquery library and custom javascript
    await this.webViewController.injectScriptFile("https://code.jquery.com/jquery-3.3.1.min.js");
    this.webViewController.injectScriptCode("""
      \$( "body" ).html( "Next Step..." )
    """);

    // add custom css
    this.webViewController.injectStyleCode("""
    body {
      background-color: #3c3c3c !important;
    }
    """);
    this.webViewController.injectStyleFile("https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css");*/
  }

  @override
  void onLoadError(String _url, int _code, String _message) {
    print("\n\nCan't load $_url.. Error: $_message\n\n");
    url = _url;
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
    completer.complete(url);
  }

  @override
  void shouldOverrideUrlLoading(String _url) {
    print("\n\n override $_url\n\n");
    this.webViewController.loadUrl(_url);
    url = _url;
  }

  @override
  void onLoadResource(WebResourceResponse response, WebResourceRequest request) {
    print("Started at: " + response.startTime.toString() + "ms ---> duration: " + response.duration.toString() + "ms " + response.url);
  }

  @override
  void onConsoleMessage(ConsoleMessage consoleMessage) {
    print("""
    console output:
      sourceURL: ${consoleMessage.sourceURL}
      lineNumber: ${consoleMessage.lineNumber}
      message: ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel}
    """);
  }

}
