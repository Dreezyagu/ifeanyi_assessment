import 'package:eden_assessment/utils/components/colors.dart';
import 'package:eden_assessment/utils/components/extensions.dart';
import 'package:eden_assessment/utils/widgets/asset_icon.dart';
import 'package:flutter/material.dart';

class CustomSignInButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title, iconType;
  const CustomSignInButton({
    super.key,
    required this.onTap,
    required this.title,
    this.iconType = "svg",
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(context.width(.04)),
          decoration: BoxDecoration(
              color: AppColors.grey50, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              AssetIcon(
                icon: title.toLowerCase(),
                type: iconType,
              ),
              SizedBox(width: context.width(.03)),
              Text(
                title,
                style: TextStyle(
                    color: AppColors.grey700,
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.04)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
