import 'package:ecom/core/models/event_modle.dart';
import 'package:ecom/core/utlis/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItemWidget extends StatelessWidget {
  final EventModel event;

  const EventItemWidget({super.key, required this.event});

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
          Column(
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
                      Text(
                        event.dateTime.day.toString(),
                        style: TextStyle(
                            color: AppColors.primaryLight,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('MMM').format(event.dateTime),
                        style: TextStyle(
                            color: AppColors.primaryLight,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              )
            ],
          ),
          Spacer(),
          Row(children: [
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                event.title,
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: AppColors.whiteColor,
                ))
          ])
        ],
      ),
    );
  }
}
