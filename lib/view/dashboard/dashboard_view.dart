
import 'package:nexime/util/app_export.dart';


class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
         floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
         backgroundColor: ColorConstant.blueLight3,
        onPressed: (){
            //code to execute on button press
        },
        child: const Icon(Icons.add), //icon inside button
        ),
      
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
         bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
      color:ColorConstant.colorSecon,
      
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 5, //notche margin between floating button and bottom appbar
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(controller.bottomNavItems.length, (index) {
              var item = controller.bottomNavItems[index];
              return InkWell(
                onTap: () {
                  controller.pageController.jumpToPage(item['pageIndex']); // Navigate to the corresponding page
                },
                child: Container( 
                  
                  margin: EdgeInsets.only(left: index==2?15:0, right: index==1?15:0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        
                        height: 45,width: 45,decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(100),
                          color: controller.selectedIndex.value==index?ColorConstant.bgColor: ColorConstant.colorPrimary,
                        ),
                        child: Image.asset(item['icon'], scale: 2,color:controller.selectedIndex.value==index?ColorConstant.colorPrimary: ColorConstant.bgColor,)),
                      const SizedBox(height: 3),
                      Text(
                        item['title'],
                  
                        style: AppStyle.txtInterRegular(context).copyWith(
                          fontSize: 10,
                          color: ColorConstant.bgColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
      ),
        ),
      body: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
          
              controller.selectedIndex.value = index;
           
          },
          physics: const NeverScrollableScrollPhysics(),
          children: controller.screens(), // Disable swipe navigation if needed
        ),
      
        ),
    );
  }
}