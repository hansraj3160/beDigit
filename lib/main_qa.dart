import 'package:nexime/config/flavor_config.dart';
import 'package:nexime/util/app_export.dart';

import 'my_app.dart';

void main() {
  const String flavor = 'qa';
  FlavorConfig.initialize(flavor);
  runApp(const MyApp());
}