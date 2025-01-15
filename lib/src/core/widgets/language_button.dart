import 'package:app_share_file/src/core/constant/theme/dimens.dart';
import 'package:flutter/material.dart';

class LanguageButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final Locale locale;

  const LanguageButtonWidget({
    Key? key,
    required this.onPressed,
    required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          child: Row(
            children: [
              Text(
                locale.languageCode == 'en'
                    ? '🇺🇸'
                    : locale.languageCode == 'lo'
                        ? '🇱🇦'
                        : '🌍',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 8),
              Text(
                locale.languageCode.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
