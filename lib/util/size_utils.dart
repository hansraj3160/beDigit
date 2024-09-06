
import 'app_export.dart';

// Size size = WidgetsBinding.instance.window.physicalSize /
//     WidgetsBinding.instance.window.devicePixelRatio;



///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(BuildContext context, double px) {
  return px * ((MediaQuery.of(context).size.width) / 375);
}

///This method is used to set text font size according to Viewport width
double getFontSize(BuildContext context, double px) {
  // return px * ((MediaQuery.of(context).size.width) / 450);
  // return px * ((MediaQuery.of(context).textScaleFactor) / 1);
  return px * ((MediaQuery.of(context).size.width) / 375) * (16 / 18);
  // var height = getVerticalSize(context, px);
  // var width = getHorizontalSize(context, px);
  // if (height < width) {
  //   return height.toInt().toDouble();
  // } else {
  //   return width.toInt().toDouble();
  // }
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(BuildContext context, double px) {
  num statusBar = MediaQuery.of(context).viewPadding.top;
  num screenHeight = (MediaQuery.of(context).size.height) - statusBar;
  return px * (screenHeight / 812);
}

double getSize(BuildContext context, double px) {
  var height = getVerticalSize(context, px);
  var width = getHorizontalSize(context, px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

Size size(BuildContext context) {
  return MediaQuery.of(context).size;
}

EdgeInsetsGeometry getPadding(
  BuildContext context, {
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    context,
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsetsGeometry getMargin(
  BuildContext context, {
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    context,
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsetsGeometry getMarginOrPadding(
  BuildContext context, {
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getHorizontalSize(
      context,
      left ?? 0,
    ),
    top: getVerticalSize(
      context,
      top ?? 0,
    ),
    right: getHorizontalSize(
      context,
      right ?? 0,
    ),
    bottom: getVerticalSize(
      context,
      bottom ?? 0,
    ),
  );
}
