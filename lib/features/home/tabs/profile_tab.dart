import 'package:ecom/core/providers/app_language_provider.dart';
import 'package:ecom/core/providers/app_theme_provider.dart';
import 'package:ecom/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var languageprovider = Provider.of<AppLanguageProvider>(context);
    var themeprovider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        )),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                backgroundColor: AppColors.greenColor,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Salah Ayyad',
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'salah.ayyad@gmail.com',
                style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
              ),
            ])
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              AppLocalizations.of(context)!.lg,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Stack(
              children:[ DropdownButton(
                value: languageprovider.appLanguage,
                isExpanded: true,
                items: [
                  DropdownMenuItem(value: 'en', child: Text('English')),
                  DropdownMenuItem(value: 'ar', child: Text('العربية'))
                ],
                onChanged: (value) {
                  languageprovider.changeLanguage(value.toString());
                },
              ),
              Positioned(top :-20,child: Container())
            ]),
            SizedBox(height: 40),
            Text(
              AppLocalizations.of(context)!.theme,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            DropdownButton(
              icon: Icon(
                themeprovider.AppTheme == ThemeMode.light
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: themeprovider.AppTheme == ThemeMode.light
                    ? AppColors.primaryLight
                    : AppColors.primaryDark,
              ),
              value: themeprovider.AppTheme,
              isExpanded: true,
              items: [
                DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(AppLocalizations.of(context)!.light)),
                DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text(AppLocalizations.of(context)!.dark))
              ],
              onChanged: (value) {
                if (value != null) {
                  themeprovider.changeTheme(value);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
