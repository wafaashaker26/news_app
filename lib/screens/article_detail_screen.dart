import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final String title;
  final String content;
  final String url;

  const ArticleDetailsScreen({
    super.key,
    required this.title,
    required this.content,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff004469),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // لو عايز تعرض النص من API قبل الـ WebView
          if (content.isNotEmpty)
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     content,
            //     style: const TextStyle(fontSize: 16),
            //   ),
            // ),
          Expanded(
            child: WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..loadRequest(Uri.parse(url)),
            ),
          ),
        ],
      ),
    );
  }
}
