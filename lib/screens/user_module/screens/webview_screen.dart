import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  String? webViewScreenType;
   WebViewScreen({this.webViewScreenType});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}


class _WebViewScreenState extends State<WebViewScreen> {


  InAppWebViewController? webView;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(widget.webViewScreenType!)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            // debuggingEnabled: true,
              useOnDownloadStart: true),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          webView = controller;
        },
        onDownloadStartRequest: (controller, url) async {
          },
      )
    );
  }
}
