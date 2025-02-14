import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/presentation/widget/footer_wg.dart';
import 'package:minimal/presentation/widget/stats_wg.dart';
import 'package:minimal/presentation/widget/traffic_info_wg.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:responsive_framework/responsive_framework.dart';

const String listItemTitleText = "A BETTER BLOG FOR WRITING";
const String listItemPreviewText =
    "Sed elementum tempus egestas sed sed risus. Mauris in aliquam sem fringilla ut morbi tincidunt. Placerat vestibulum lectus mauris ultrices eros. Et leo duis ut diam. Auctor neque vitae tempus […]";

class HomePage extends ConsumerWidget {
  static const String name = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: ResponsiveBreakpoints.of(context).isTablet
            ? const EdgeInsets.symmetric(horizontal: 10.0)
            : EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            TrafficInfoWidget(),
            //TrafficInfoWidget2(),
            /*  const ListItem(
              imageUrl: "assets/images/paper_flower_overhead_bw_w1080.jpg",
              title: "A BETTER BLOG FOR WRITING",
              description: "Sed elementum tempus egestas...",
            ),*/
            dividerPadding,
            const ListItem(
              title: "DESTACAMOS POR NUESTROS RESULTADOS",
              viewButton: false,
              leftTitle: false,
            ),
            StatsWidget(),
            dividerPadding,
            const ListItem(
              title: "NUESTROS ALIADOS ESTRATÉGICOS",
              viewButton: false,
              leftTitle: false,
            ),

            CustomCardSwipper(),
            dividerPadding,
            /*  Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: const ListNavigation(),
            ),*/
            dividerPadding,
            const Footer(),
          ],
        ),
      ),
    );
  }
}
