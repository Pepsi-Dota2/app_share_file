import 'package:app_share_file/generated/locale_keys.g.dart';
import 'package:app_share_file/src/core/widgets/custom_button_submit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ErrorDialog {
  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: message.contains(LocaleKeys.error_user_not_found.tr()) ? LocaleKeys.error_user_not_found.tr(): LocaleKeys.error_error.tr(),
        desc: message,
        btnCancel: CustomButtonSubmit(
          label: "ok",
          onPressed: () {
            context.router.maybePop();
          },
        )).show();
  }

  static void hideErrorDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
