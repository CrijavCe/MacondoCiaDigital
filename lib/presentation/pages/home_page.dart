import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/presentation/widget/footer_wg.dart';
import 'package:minimal/presentation/widget/stats_wg.dart';
import 'package:minimal/presentation/widget/traffic_info_wg_type_one.dart';
import 'package:minimal/presentation/widget/traffic_info_wg_type_two.dart';
import 'package:minimal/shared/assets/widgets/custom_text_swipper.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends ConsumerWidget {
  static const String name = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> sections = [
      CustomTextSwipper(),
      TrafficInfoWidget(),
      dividerPadding,
      const ListItem(
        title: "DESTACAMOS POR NUESTROS RESULTADOS",
        viewButton: false,
        leftTitle: false,
      ),
      Center(child: StatsWidget()),
      dividerPadding,
      TrafficInfoWidgetTypeTwo(),
      dividerPadding,
      const ListItem(
        title: "NUESTROS ALIADOS ESTRATÉGICOS",
        viewButton: false,
        leftTitle: false,
      ),
      CustomCardSwipper(),
      dividerPadding,
      const Footer(),
    ];
    return Padding(
      padding: ResponsiveBreakpoints.of(context).isTablet
          ? const EdgeInsets.symmetric(horizontal: 10.0)
          : EdgeInsets.zero,
      child: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return sections[index];
        },
      ),
    );
  }
}
