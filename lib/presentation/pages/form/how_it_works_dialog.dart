import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HowItWorksDialog extends StatefulWidget {
  const HowItWorksDialog({super.key});

  @override
  State<HowItWorksDialog> createState() => _HowItWorksDialogState();
}

class _HowItWorksDialogState extends State<HowItWorksDialog> {
  bool _isLoading = true;
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error loading page: $error');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://api.hulpsystem.com/info-page/2'));
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      closeIconColor: AppColors.darkGray,
      padding: 20,
      content: SizedBox(
        height: 400,
        child: Stack(
          children: [
            WebViewWidget(controller: _webViewController),
            if (_isLoading)
              Container(
                color: AppColors.dialogBackgroung,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
      hasLeftButton: false,
      hasRightButton: false,
    );
  }
}
