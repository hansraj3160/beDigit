import 'package:nexime/util/widget/booking_card.dart';

import '../../util/app_export.dart';

class HomeScreen extends GetView<DashboardController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.homeBg,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
                
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                        AssetsConstant.icLocatioPin,
                        scale: 2,
                      ), const SizedBox(width: 15,),  Text(
                          "1 Brunel Wy., Slough SL1 1FQ",
                          style: AppStyle.txtInterRegular(context)
                              .copyWith(
                                  color: ColorConstant.black,
                                  fontSize: 14),
                        ),
                      const Spacer(),
                       Image.asset(
                        AssetsConstant.icNotiy,
                        scale: 2,
                      ),
                      const SizedBox(width: 30,),
                       Image.asset(
                        AssetsConstant.icMenu,
                        scale: 2,
                      ),
                  ],
                )
                ,
                TextFormFieldWidget(
                    radius: 23,
                      padding: 0,
                      hintColor: ColorConstant.hintColor.withOpacity(0.4),
                      label: "",
                      hint: TextValue.hintSearch,
                            
                      // enabled: false,
                      prefixIcon: Image.asset(
                        AssetsConstant.icSearch,
                        scale: 2,
                      ),
                      controller: controller.searchController,
                     
                      focusNode: controller.focusNodes[0],
                      validator: (value) {
                        
                          return null;
                      }
                    ),
                
                    SizedBox(height: getVerticalSize(context, 13),),
                    Container(
                      height: 170, width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0,color: ColorConstant.homeBg),
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        image: DecorationImage(alignment: Alignment.centerRight,fit: BoxFit.cover, image: AssetImage( AssetsConstant.icCard,)),
                        gradient: const LinearGradient(
                        begin: Alignment.topCenter,end: Alignment.bottomCenter,
                        colors: [ColorConstant.blueLight2,ColorConstant.blueLight4,  ])),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           Text(
                                "Looking for",
                                style: AppStyle.txtInterMedium(context)
                                    .copyWith(
                                        color: ColorConstant.bgColor,fontSize: 20, 
                                      ),
                              ),
                               Text(
                                "Specialist Health\ncare",
                                style: AppStyle.txtInterMedium(context)
                                    .copyWith(
                                        color: ColorConstant.bgColor,
                                      ),
                              ),
                              SizedBox(height: getVerticalSize(context, 10),),
                               Text(
                                "Schedule an appointment\nwith our care taker",
                                style: AppStyle.txtInterRegular(context)
                                    .copyWith(
                                        color: ColorConstant.bgColor,fontSize: 13
                                      ),
                              ),
                          ],),
                        ),
                        
                    ),
                    
                    SizedBox(height: getVerticalSize(context, 13),),
                    Row(
                      
                      children: [
                        Text(
                              "Recent Bookings",
                              style: AppStyle.txtInterMedium(context)
                                  .copyWith(
                                      color: ColorConstant.black,
                                    ),
                            ),
                      ],
                    ),
                    SizedBox(height: getVerticalSize(context, 13),),
                    SizedBox(
                        height: 85,
                      child: ListView.separated(
                        shrinkWrap: true,
                      scrollDirection: Axis.horizontal,                    itemBuilder: (context,index){
                        return   BookingCard(bookingData: controller.recentBooking[index],isBooking: true);
                      }, separatorBuilder: (cont, i){
                        return const SizedBox(width: 10,);
                      }, itemCount:controller.recentBooking.length ),
                    ),
                    SizedBox(height: getVerticalSize(context, 18),),
                     Row(
                      
                      children: [
                        Text(
                              "Past Bookings",
                              style: AppStyle.txtInterMedium(context)
                                  .copyWith(
                                      color: ColorConstant.black,
                                    ),
                            ),
                      ],
                    ),
                     SizedBox(height: getVerticalSize(context, 13),),
                    SizedBox(
                        height: 82,
                      child: ListView.separated(
                        shrinkWrap: true,
                      
                      scrollDirection: Axis.horizontal,                    itemBuilder: (context,index){
                        return BookingCard(bookingData: controller.recentBooking[index],isBooking: false,);
                      }, separatorBuilder: (cont, i){
                        return const SizedBox(width: 10,);
                      }, itemCount:controller.recentBooking.length ),
                    ),
                     SizedBox(height: getVerticalSize(context, 18),),
                     Row(
                      
                      children: [
                        Text(
                              "Services",
                              style: AppStyle.txtInterMedium(context)
                                  .copyWith(
                                      color: ColorConstant.black,
                                    ),
                            ),
                      ],
                    ),
           SizedBox(height: getVerticalSize(context, 13),),
                    Row(
                      children:[ 
                        Expanded(
                          child: GridView.builder(
                          shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // 3 items in each row
                                crossAxisSpacing: 10, // Space between items horizontally
                                mainAxisSpacing: 10, // Space between items vertically
                                childAspectRatio: 108 / 91, // Aspect ratio for width / height
                              ),
                              itemCount:controller.servicesData.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final service = controller.servicesData[index];
                                return Container(
                                  height: 91,
                                  width: 108,
                                  decoration: BoxDecoration(
                                    color: service.color,
                                    borderRadius: BorderRadius.circular(8), // Optional rounded corners
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        service.imgPath,
                                        height: 40, // Adjust image height
                                        width: 40, // Adjust image width
                                      ),
                                      const SizedBox(height: 8), // Space between image and text
                                      Text(
                                        service.title,textAlign: TextAlign.center,
                                         style: AppStyle.txtInterMedium(context)
                                .copyWith(
                                  fontSize: 14,
                                    color: ColorConstant.black2C,
                                  ),
                                        ),
                                      
                                    ],
                                  ),
                                );
                              },
                            ),
                        ),]
                    ),
                     SizedBox(height: getVerticalSize(context, 18),),
                     Row(
                      
                      children: [
                        Text(
                              "Featured Candidates",
                              style: AppStyle.txtInterMedium(context)
                                  .copyWith(
                                      color: ColorConstant.black,
                                    ),
                            ),
                      ],
                    ),
            SizedBox(height: getVerticalSize(context, 13),),
                    SizedBox(
                        height: 115,
                      child: ListView.separated(
                        shrinkWrap: true,
                      
                      scrollDirection: Axis.horizontal,                    itemBuilder: (context,index){
                        return Container(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(
      
      height: 58,
      child: Image.asset(controller.featuredCandidates[index].imgPath,scale: 2.3,fit: BoxFit.fill,)),  const SizedBox(height: 3,),Text(
                            controller.featuredCandidates[index].title  ,
                              style: AppStyle.txtInterMedium(context)
                                  .copyWith( fontSize: 12,
                                      color: ColorConstant.black2C,
                                    ),
                            ), 
                            const SizedBox(height: 2,),
                            Text(
                              textAlign: TextAlign.center,
                             controller.featuredCandidates[index].specialist,maxLines: 2,
                              style: AppStyle.txtInterRegular(context)
                                  .copyWith(fontSize: 11,
                                      color: ColorConstant.grayA3,
                                    ),
                            ),
                            Row(
                              children:
                              
                     List.generate(  controller.featuredCandidates[index].rating, (index) {
             
              return Image.asset(AssetsConstant.ratingStar,scale:2);
                     }))
  ],
),
                        );
                      }, separatorBuilder: (cont, i){
                        return const SizedBox(width: 10,);
                      }, itemCount:controller.featuredCandidates.length ),
                    ),
                    
              ],
            ),
          ),
        )),
    );
  }
}
