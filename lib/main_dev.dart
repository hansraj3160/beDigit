
import 'package:nexime/config/flavor_config.dart';
import 'package:nexime/util/app_export.dart';

import 'my_app.dart'; // Import the main app entry

void main() {
  const String flavor = 'dev';
  FlavorConfig.initialize(flavor);
  runApp(const MyApp());
}
