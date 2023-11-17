import 'package:eden_assessment/utils/components/colors.dart';
import 'package:eden_assessment/utils/components/extensions.dart';
import 'package:flutter/material.dart';

class TrackItems extends StatelessWidget {
  const TrackItems({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isDone,
  });

  final String title, subtitle;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: isDone ? AppColors.primary500 : AppColors.grey600,
        ),
        SizedBox(width: context.width(.04)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: context.width(.04),
                    fontWeight: isDone ? FontWeight.w500 : FontWeight.w400),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: context.width(.033),
                    color: AppColors.grey700,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        SizedBox(width: context.width(.04)),
      ],
    );
  }
}
