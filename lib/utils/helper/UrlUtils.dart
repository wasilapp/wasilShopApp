
import 'package:url_launcher/url_launcher.dart';

class UrlUtils {
  /* Dummy URLs
  String url = "http://flutter.dev";
  String mailUrl = "mailto:mail@example.org?subject=Email Test&body=From,\nFlutKit";
  String callUrl = "tel:+1 555 010 999";
  String smsUrl = "sms:5550101234";
  String youtubeUrl = "https://www.youtube.com";

  * */

  static openDocsDownloadPage(){
    openUrl("https://coderthemes.com/emall/downloads.html");
  }


  static openUrl(String url) async {
    if (await canLaunch(url) != null) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static callFromNumber(String number) {
    openUrl("tel:$number");
  }

  static openMap(double latitude,double longitude){
    openUrl("http://maps.google.com/maps?q=$latitude+$longitude");
  }

  //Go to order receipt

}
