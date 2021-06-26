import 'package:flutter_workshop/views/edit_page.dart';
import 'package:flutter_workshop/views/main_page.dart';

class Routes {
  static String editPage() => "/edit";

  static String homePage() => "/";

  static routes() => {
        homePage(): (context) => MainPage(),
        editPage(): (context) => EditPage(),
      };
}
