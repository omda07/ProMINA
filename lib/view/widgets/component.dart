

import 'package:flutter/material.dart';




void navigatorAndRemove(context, String screen) {
  Navigator.pushReplacementNamed(context, screen);
}

void navigator(BuildContext context, String screen) {
 Navigator.pushNamed(context, screen);

}
void navigatorBack(BuildContext context,) {
  Navigator.pop(context);
}

