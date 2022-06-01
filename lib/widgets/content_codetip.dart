import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContenCodeTip extends StatefulWidget {
  final String Title;
  const ContenCodeTip(this.Title);

  @override
  State<ContenCodeTip> createState() => _ContenCodeTipState();
}

class _ContenCodeTipState extends State<ContenCodeTip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Title.toString()),
      ),
      body: const WebView(
        initialUrl:
            'https://www.w3schools.com/python/trypython.asp?filename=demo_default',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
