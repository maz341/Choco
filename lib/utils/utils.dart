import 'package:url_launcher/url_launcher.dart';

class Utility {
  Future<void> launchUrlMethod(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
