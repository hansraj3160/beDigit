import 'package:nexime/model/booking_model.dart';
import 'package:nexime/util/app_export.dart';
import 'package:nexime/util/app_style.dart';

// ignore: must_be_immutable
class BookingCard extends StatelessWidget {
  Booking bookingData;
  bool isBooking;
   BookingCard({super.key,required this.bookingData, required this.isBooking});

  @override
  Widget build(BuildContext context) {
    return Container(
                        
                     
                           padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(11)),
                              color: ColorConstant.bgColor
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              Image.asset(
                          bookingData.imgPath,
                          scale: 1.8,
                        ),
                        SizedBox(width: getHorizontalSize(context, 8),),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(
                            bookingData.title,
                            style: AppStyle.txtInterMedium(context)
                                .copyWith(fontSize: 14,
                                    color: ColorConstant.black2C,
                                  ),
                          ),  Text(
                              bookingData.specialist,
                            style: AppStyle.txtInterRegular(context)
                                .copyWith(
                                    color: ColorConstant.grayA3,
                                  ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                                           bookingData.date,
                                                            style: AppStyle.txtInterRegular(context)
                                  .copyWith(fontSize: 6,
                                      color: ColorConstant.grayAD,
                                    ),
                                                          ),SizedBox(width: 20,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 2),
                              decoration:   BoxDecoration(
                              color:isBooking? bookingData.bookedColor:bookingData.completedColor,
                              
                              borderRadius: const BorderRadius.all(Radius.circular(50))),
                              child:  Text(
                            isBooking?bookingData.booked:bookingData.completed,
                              style: AppStyle.txtInterMedium(context)
                                  .copyWith(
                                    fontSize: 8,
                                      color: ColorConstant.bgColor,
                                    ),
                            ),
                              )
                            ],),
                          )
                          ],
                        )
                            ],),
                           
                        
                          );
  }
}