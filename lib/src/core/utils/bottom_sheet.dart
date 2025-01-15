import 'package:app_share_file/generated/locale_keys.g.dart';
import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:app_share_file/src/core/constant/theme/dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showLanguageBottomSheet(BuildContext context, Function(Locale locale) onPressed) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    context: context,
    builder: (builder) {
      return SizedBox(
        height: 230,
        child: Padding(
          padding: const EdgeInsets.all(spacing_15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.translate_select_language.tr(),
                style: TextStyle(
                  fontSize: fontSizeTitle,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grabageColor
                ),
              ),
              const SizedBox(height: spacing_15),
              ListTile(
                onTap: () {
                  context.setLocale(Locale('lo'));
                  Navigator.pop(context);
                },
                title: Text(
                  "🇱🇦 ${LocaleKeys.translate_la.tr()}",
                  style: const TextStyle(fontSize: fontSizeBody),
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  context.setLocale(Locale('en'));
                  Navigator.pop(context);
                },
                title: Text(
                  "🇺🇸 ${LocaleKeys.translate_en.tr()}",
                  style: const TextStyle(fontSize: fontSizeBody),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
