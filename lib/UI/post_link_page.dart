import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PostLinkPage extends StatefulWidget {

  final String postLink;
  PostLinkPage(this.postLink);

  @override
  _PostLinkPageState createState() => _PostLinkPageState();
}

class _PostLinkPageState extends State<PostLinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.postLink,
        ),
      ),
    );
  }
}
