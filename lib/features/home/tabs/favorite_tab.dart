import 'package:ecom/core/utlis/app_colors.dart';
import 'package:ecom/core/widget/custom_text_field.dart';
import 'package:ecom/core/widget/event_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding:  EdgeInsets.fromLTRB(16, 80, 16, 0),
        child: Column(
          children: [
            CustomTextField(
              color: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: TextStyle(
                  color: AppColors.primaryLight, fontWeight: FontWeight.bold),
              obscureText: false,
              prefixIcon: Icon(Icons.search),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) {
                  return EventItemWidget();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
