import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewUI extends StatelessWidget {
  const WebViewUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Chương trình Python thực thi'),
        backgroundColor: Colors.green,
      ),
      body: const WebView(
        initialUrl:
            'https://www.programiz.com/python-programming/online-compiler/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    ;
  }
}
