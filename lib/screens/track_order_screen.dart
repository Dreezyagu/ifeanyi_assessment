import 'package:eden_assessment/providers/track_order_provider.dart';
import 'package:eden_assessment/utils/components/colors.dart';
import 'package:eden_assessment/utils/components/extensions.dart';
import 'package:eden_assessment/utils/widgets/track_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TrackOrderScreen extends ConsumerStatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  ConsumerState<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends ConsumerState<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Track Order",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final data = ref.watch(trackOrderProvider);

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width(.06), vertical: context.width(.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('EEE, dd MMM yyyy').format(DateTime.now()),
                style: TextStyle(
                    fontSize: context.width(.035), color: AppColors.grey600),
              ),
              SizedBox(height: context.width(.01)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order ID: 90881",
                    style: TextStyle(
                        fontSize: context.width(.035),
                        color: AppColors.grey600),
                  ),
                  Text(
                    "Amt: \$15",
                    style: TextStyle(fontSize: context.width(.035)),
                  ),
                ],
              ),
              SizedBox(height: context.width(.08)),
              Text(
                "ETA: 30 mins",
                style: TextStyle(
                    fontSize: context.width(.04), fontWeight: FontWeight.w600),
              ),
              SizedBox(height: context.width(.08)),
              Column(
                children: [
                  TrackItems(
                    title: "Order Placed",
                    subtitle: "Waiting for the vendor to confirm",
                    isDone: data > 0,
                  ),
                  SizedBox(height: context.width(.06)),
                  TrackItems(
                    title: "Order Accepted",
                    subtitle: "Vendor is preparing order",
                    isDone: data > 1,
                  ),
                  SizedBox(height: context.width(.06)),
                  TrackItems(
                    title: "Order pickup in progress",
                    subtitle: "Waiting for the rider to arrive",
                    isDone: data > 2,
                  ),
                  SizedBox(height: context.width(.06)),
                  TrackItems(
                    title: "Order on the way",
                    subtitle: "The rider is on the way",
                    isDone: data > 3,
                  ),
                  SizedBox(height: context.width(.06)),
                  TrackItems(
                    title: "Order arrived",
                    subtitle: "Don't keep the rider waiting",
                    isDone: data > 4,
                  ),
                  SizedBox(height: context.width(.06)),
                  TrackItems(
                    title: "Order delivered",
                    subtitle: "Enjoy!",
                    isDone: data > 5,
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
