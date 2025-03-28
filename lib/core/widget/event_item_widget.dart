import 'package:ecom/core/models/event_modle.dart';
import 'package:ecom/core/providers/get_events_provider.dart';
import 'package:ecom/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItemWidget extends StatefulWidget {
  final EventModel event;

  const EventItemWidget({
    super.key,
    required this.event,
  });

  @override
  State<EventItemWidget> createState() => _EventItemWidgetState();
}

class _EventItemWidgetState extends State<EventItemWidget> {
  @override
  Widget build(BuildContext context) {
    final eventprovider = Provider.of<GetEventsProvider>(context);

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
              Row(
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
                            widget.event.dateTime.day.toString(),
                            style: TextStyle(
                                color: AppColors.primaryLight,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('MMM').format(widget.event.dateTime),
                            style: TextStyle(
                                color: AppColors.primaryLight,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () async {
                        await eventprovider.deleteEvent(widget.event);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.whiteColor,
                      ))
                ],
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
              child: Center(
                child: Text(
                  widget.event.title,
                ),
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () async {
                  try {
                    eventprovider.favEvent(widget.event);
                  } catch (e) {
                    print(e);
                  }
                },
                icon: Icon(
                  widget.event.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: AppColors.whiteColor,
                ))
          ])
        ],
      ),
    );
  }
}
