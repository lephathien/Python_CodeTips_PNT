import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Test15 extends StatelessWidget {
  const Test15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trắc nghiệm online'),
      ),
      body: const WebView(
        initialUrl:
            'https://docs.google.com/forms/d/e/1FAIpQLSfHvjmaYji_fu1byqH_eUjvc0jYYWHgPAfr-PwncS1QcXJORQ/viewform',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    ;
  }
}
