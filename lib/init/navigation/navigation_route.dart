import 'package:artcitecture_test/ui/login/view/login_view.dart';
import 'package:artcitecture_test/ui/new_password/view/new_password_view.dart';
import 'package:artcitecture_test/ui/reset_password/view/reset_password_view.dart';
import 'package:artcitecture_test/ui/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../../constants/navigation_constant.dart';
import '../../ui/addbill/view/add_bill_view.dart';
import '../../ui/home/view/home_view.dart';
import '../../ui/profile/view/profile_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(HomeView(), NavigationConstants.HOME);
      case NavigationConstants.HOME:
        return normalNavigate(HomeView(), NavigationConstants.HOME);
      case NavigationConstants.ADD_BILL:
        return normalNavigate(AddBillView(), NavigationConstants.ADD_BILL);
      case NavigationConstants.PROFILE:
        return normalNavigate(ProfileView(), NavigationConstants.PROFILE);
      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView(), NavigationConstants.LOGIN);
      case NavigationConstants.RESETPASSWORD:
        return normalNavigate(
            ResetPasswordView(), NavigationConstants.RESETPASSWORD);
      default:
        return MaterialPageRoute(
          builder: (context) => Text("Böyle Bir Sayfa Yok"),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }

  PageRouteBuilder animetedNavigate(Widget widget, String pageName) {
    return PageRouteBuilder(
      settings: RouteSettings(name: pageName),
      transitionDuration: Duration(milliseconds: 1000),
      pageBuilder: (context, animation1, animation2) => widget,
      transitionsBuilder: (context, animation1, animation2, child) {
        return FadeTransition(opacity: animation1, child: child);
      },
    );
  }
}
