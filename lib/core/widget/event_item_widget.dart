import 'package:ecom/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: EdgeInsets.only(bottom: 20),
      height: 260,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/birthday.png'),
              fit: BoxFit.fill),
          border: Border.all(color: AppColors.primaryLight, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('22',style: TextStyle(color: AppColors.primaryLight,fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('Feb.',style: TextStyle(color: AppColors.primaryLight,fontSize: 20,fontWeight: FontWeight.bold),)
                  
                ]),
          )
        ],
      ),
    );
  }
}
