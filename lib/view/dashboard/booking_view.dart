
import 'package:nexime/util/app_export.dart';

class BookingView extends GetView<DashboardController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child:  Text(
                                "Booking",
                                style: AppStyle.txtInterMedium(context)
                                    .copyWith(
                                        color: ColorConstant.black,
                                      ),
                              ),),);
  }
}