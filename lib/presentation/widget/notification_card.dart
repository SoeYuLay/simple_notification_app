import 'package:flutter/material.dart';
import 'package:simple_notification_app/data/model/notification_model.dart';
import 'package:simple_notification_app/core/theme/theme_getter.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notiData, this.onTap, required this.formattedDate});

  final NotificationModel notiData;
  final VoidCallback? onTap;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final customText = context.notiText;
    

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: notiData.isRead ? colorScheme.secondary : colorScheme.primary,
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notiData.notiTitle,
                style: customText.subTitle.copyWith(
                  color: customColors.textPrimary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                notiData.notiContent.replaceAll('\n', ' '),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: customText.bodyRegular.copyWith(
                  color: customColors.textPrimary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                formattedDate,
                style: customText.bodySmall.copyWith(
                  color: customColors.datePrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
