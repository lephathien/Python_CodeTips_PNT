import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PhanHoi extends StatelessWidget {
  const PhanHoi({Key? key}) : super(key: key);

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
            'https://docs.google.com/forms/d/e/1FAIpQLSeN0N0NZ7Cy1s9NwAt5Y-I7fAoHeMp5BggsioLyias-pk0rSg/viewform',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    ;
  }
}
