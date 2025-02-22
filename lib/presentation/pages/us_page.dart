import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/presentation/widget/footer_wg.dart';
import 'package:minimal/presentation/widget/interactive_card_wg.dart';
import 'package:minimal/presentation/widget/traffic_info_wg_type_two.dart';
import 'package:responsive_framework/responsive_framework.dart';

const String listItemTitleText = "A BETTER BLOG FOR WRITING";
const String listItemPreviewText =
    "Sed elementum tempus egestas sed sed risus. Mauris in aliquam sem fringilla ut morbi tincidunt. Placerat vestibulum lectus mauris ultrices eros. Et leo duis ut diam. Auctor neque vitae tempus […]";

class UsPage extends ConsumerWidget {
  static const String name = '/us';

  const UsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> sections = [
      dividerPadding,
      TrafficInfoWidgetTypeTwo(
        usWg: true,
      ),
      dividerPadding,
      const ListItem(
        title: "NUESTROS VALORES",
        viewButton: false,
        leftTitle: false,
      ),
      InteractiveCardWrap(),
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
