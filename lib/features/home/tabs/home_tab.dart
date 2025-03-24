import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/core/models/event_modle.dart';
import 'package:ecom/core/utlis/app_colors.dart';
import 'package:ecom/core/utlis/firebase_ults.dart';
import 'package:ecom/core/widget/event_item_widget.dart';
import 'package:ecom/core/widget/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selecteddIndex = 0;
  List eventsList = [];

  void getAllEvents() async {
    QuerySnapshot<EventModel> query =
        await FirebaseUlts.getEventCollection().get();
    eventsList = query.docs.map((doc) {
      return doc.data();
    }).toList();

    setState(() {});
  }

  @override
  void initState() {
    getAllEvents();
    super.initState();
  }

  void getFliterEvents(String fliterEvent) async {
    Query<EventModel> query = FirebaseUlts.getEventCollection();
    if (fliterEvent != "All") {
      query = query.where('category', isEqualTo: fliterEvent);
    }
    var events = await query.get();
    eventsList = events.docs.map((doc) {
      return doc.data();
    }).toList();
    setState(() {});
  }

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
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'salah ayyad',
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Spacer(),
            Row(children: [
              Icon(
                Icons.sunny,
                color: AppColors.whiteColor,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.whiteColor),
                child: Text(
                  'EN',
                  style: TextStyle(
                    color: AppColors.primaryLight,
                    fontSize: 15,
                  ),
                ),
              )
            ])
          ],
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          height: 140,
          decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.whiteColor,
                ),
                Text(
                  'Nablus , Palestine',
                  style: TextStyle(color: AppColors.whiteColor),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              DefaultTabController(
                length: eventNameList.length,
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selecteddIndex = index;
                      getFliterEvents(eventNameList[index]);
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
                      isInCreate: false,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: eventsList.length,
                itemBuilder: (_, index) {
                  return EventItemWidget(
                    event: eventsList[index],
                  );
                }))
      ]),
    );
  }
}
