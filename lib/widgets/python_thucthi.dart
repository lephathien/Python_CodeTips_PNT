import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Python_ThucThi extends StatefulWidget {
  final String urlTruyen;
  final String Title;
  const Python_ThucThi(this.urlTruyen, this.Title);
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}

class ListViewHome extends State<Python_ThucThi> {
  InAppWebViewController? webView;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            widget.Title.toString(),
            style: TextStyle(fontFamily: "DancingScript", fontSize: 18),
          )),
      body: Container(
          child: Column(children: <Widget>[
        Container(
            child: progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            child: InAppWebView(
              initialUrlRequest:
                  URLRequest(url: Uri.parse(widget.urlTruyen.toString())),
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(),
                  ios: IOSInAppWebViewOptions(),
                  android:
                      AndroidInAppWebViewOptions(useHybridComposition: true)),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  this.url = url?.toString() ?? '';
                });
              },
              onLoadStop: (controller, url) async {
                setState(() {
                  this.url = url?.toString() ?? '';
                });
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ),
        ),
      ])),
    );
  }
}
