import 'package:ecom/core/providers/app_language_provider.dart';
import 'package:ecom/core/providers/app_theme_provider.dart';
import 'package:ecom/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var languageprovider = Provider.of<AppLanguageProvider>(context);
    var themeprovider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.lg),
            DropdownButton(
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
            Text(AppLocalizations.of(context)!.theme),
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
