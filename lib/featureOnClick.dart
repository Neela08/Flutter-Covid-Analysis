import 'package:url_launcher/url_launcher.dart';

class myFeatures{
  makingPhoneCall() async {
    String url = 'tel:'+'16263'.toString().trim();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
}

  symptomChecker() async {
    String url = 'https://livecoronatest.com/chat.php?city=Unnamed%20Road&lat=23.820264&lng=90.417367&addr_dist=Unknown&addr_div=Unknown';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}