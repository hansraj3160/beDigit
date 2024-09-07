import 'package:nexime/config/flavor_config.dart';
import 'package:nexime/my_app.dart';
import 'package:nexime/util/app_export.dart';

void main() {
  const String flavor = 'uat';
  FlavorConfig.initialize(flavor);
  runApp(const MyApp());
}