import 'package:eden_assessment/utils/components/extensions.dart';
import 'package:flutter/material.dart';

class OrderDetailsRow extends StatelessWidget {
  const OrderDetailsRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width(.04), vertical: context.width(.025)),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: context.width(.038)),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: context.width(.035)),
          ),
        ],
      ),
    );
  }
}
