
import 'package:nexime/util/app_export.dart';
import 'package:nexime/util/app_style.dart';

class InvoiceView extends GetView<DashboardController> {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child:  Text(
                                "Invoice",
                                style: AppStyle.txtInterMedium(context)
                                    .copyWith(
                                        color: ColorConstant.black,
                                      ),
                              ),),);
  }
}