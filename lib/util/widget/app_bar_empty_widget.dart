import '../app_export.dart';

class AppBarEmptyWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        toolbarOpacity: 0,
        toolbarHeight: 0,
        bottomOpacity: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light);
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
