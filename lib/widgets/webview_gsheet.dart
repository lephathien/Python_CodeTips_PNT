import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewGsheet extends StatelessWidget {
  const WebViewGsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kết quả tổng hợp'),
      ),
      body: const WebView(
        initialUrl:
            'https://docs.google.com/spreadsheets/d/1Io9rLOuL9PQ2QIKYIS6Xmtu5C4k3HbWdPZl8s7Lh-YE/edit?usp=sharing',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    ;
  }
}
