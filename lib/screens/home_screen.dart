import 'package:eden_assessment/providers/track_order_provider.dart';
import 'package:eden_assessment/screens/track_order_screen.dart';
import 'package:eden_assessment/utils/components/colors.dart';
import 'package:eden_assessment/utils/components/extensions.dart';
import 'package:eden_assessment/utils/widgets/asset_icon.dart';
import 'package:eden_assessment/utils/widgets/order_details_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen(this.user, {super.key});

  final User user;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(trackOrderProvider.notifier).setUpAbly();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
      appBar: AppBar(
        backgroundColor: AppColors.primary500,
        title: const Text(
          "Order Details",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final data = ref.watch(trackOrderProvider);

        return Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: context.height(.7),
                padding: EdgeInsets.only(top: context.height(.15)) +
                    EdgeInsets.symmetric(horizontal: context.width(.06)),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quinoa Salad x2",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: context.width(.055)),
                      ),
                      SizedBox(height: context.width(.015)),
                      Text(
                        "\$15.00",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary500,
                            fontSize: context.width(.055)),
                      ),
                      SizedBox(height: context.width(.05)),
                      Row(
                        children: List.generate(
                          6,
                          (index) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                height: context.width(.007),
                                child: LinearProgressIndicator(
                                  color: data > index
                                      ? AppColors.primary500
                                      : Colors.grey[300],
                                  value: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.width(.03)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TrackOrderScreen(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Track your Order",
                                  style: TextStyle(
                                      color: AppColors.accent,
                                      fontSize: context.width(.04)),
                                ),
                                const Icon(Icons.arrow_downward)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.width(.06)),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const OrderDetailsRow(
                                title: "Order ID",
                                value: "90881",
                              ),
                              OrderDetailsRow(
                                title: "Order Date",
                                value: DateFormat('EEE, dd MMMM yyyy')
                                    .format(DateTime.now()),
                              ),
                              const OrderDetailsRow(
                                title: "Order Type",
                                value: "Instant",
                              ),
                              OrderDetailsRow(
                                title: "Email",
                                value: widget.user.email ?? "",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: AssetIcon(
                icon: "salad",
                type: "png",
                size: context.width(.7),
              ),
            )
          ],
        );
      }),
    );
  }
}
