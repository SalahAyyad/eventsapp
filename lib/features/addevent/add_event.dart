import 'dart:developer';

import 'package:ecom/core/utlis/app_colors.dart';
import 'package:ecom/core/widget/custom_text_field.dart';
import 'package:ecom/core/widget/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selecteddIndex = 0;
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  var eventNameController = TextEditingController();
   var eventdescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.birthdays,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.trolling,
      AppLocalizations.of(context)!.watchparty,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryLight,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Create Event',
          style: TextStyle(
              color: AppColors.primaryLight,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/birthday.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DefaultTabController(
            length: eventNameList.length,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  selecteddIndex = index;
                });
              },
              padding: EdgeInsets.all(10),
              indicatorColor: AppColors.transparentColor,
              dividerColor: AppColors.transparentColor,
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              tabAlignment: TabAlignment.start,
              tabs: eventNameList.map((eventname) {
                return Tabeeventwidget(
                  eventname: eventname,
                  isSelected:
                      selecteddIndex == eventNameList.indexOf(eventname),
                  isInCreate: true,
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              AppLocalizations.of(context)!.eventname,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: eventNameController,
            color: AppColors.greyColor,
            prefixIcon: Icon(
              Icons.edit_note,
            ),
            hintText: "Event Title",
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: eventdescriptionController,
            maxLines: 5,
            color: AppColors.greyColor,
            hintText: "Event Description",
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Icon(
              Icons.calendar_month,
              color: AppColors.blackColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              AppLocalizations.of(context)!.eventdate,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            TextButton(
                onPressed: ()async {
                 
                 selectedDate = await showDatePicker(context: context, firstDate: DateTime.now(),
                   lastDate: DateTime(2030) );
                   log(selectedDate.toString());




                },
                child: Text(
                  AppLocalizations.of(context)!.choosedate,
                  style: TextStyle(fontSize: 18),
                ))
          ]),
          Row(children: [
            Icon(
              Icons.watch_later_outlined,
              color: AppColors.blackColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              AppLocalizations.of(context)!.eventtime,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            TextButton(
                onPressed: () async {

                 selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                   log(selectedTime.toString());
                   log("hhhhhhhhhhhhhhhhhhhh");
                   
                },

                
                child: Text(
                  AppLocalizations.of(context)!.choosetime,
                  style: TextStyle(fontSize: 18),
                ))
          ]),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryLight, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryLight,
                      ),
                      child: Icon(
                        Icons.gps_fixed,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      AppLocalizations.of(context)!.chooselocation,
                      style: TextStyle(
                          color: AppColors.primaryLight,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(onPressed:(){},
                      icon : Icon(
                        Icons.arrow_forward_ios,
                      ),
                      color: AppColors.primaryLight, 
                    )
                  ],
                ),
              ),
            ),
          ),SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
            
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
            
                ),
                child: Text(
                  AppLocalizations.of(context)!.createevent,
                  style: TextStyle(color: AppColors.whiteColor),
                )),
          )
        ]),
      ),
    );
  }
}
