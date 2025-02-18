import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/presentation/widget/footer_wg.dart';
import 'package:minimal/presentation/widget/stats_wg.dart';
import 'package:minimal/presentation/widget/traffic_info_wg_type_one.dart';
import 'package:minimal/presentation/widget/traffic_info_wg_type_two.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends ConsumerWidget {
  static const String name = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> sections = [
      FadeInUp(
        from: 50,
        child: const ListItem(
          title:
              "Curso Pedagógico 100% DIGITAL para pago con descuento de Infracciones de Tránsito. Haz el curso pedagógico y accede al descuento en tu comparendo desde la comodidad de tu computador.",
          textAlign: TextAlign.left,
          viewButton: true,
          titleButton: "  ¡Lo quiero ya!  ",
          //leftTitle: true,
        ),
      ),
      dividerPadding,
      FadeInUp(
        from: 50,
        child: const ListItem(
          title:
              "Confirmamos el comparendo > Te matriculamos en el curso >\nLo realizas según tu conveniencia y listo.\nPagas tu comparendo con 50% de descuento si madrugaste\no 25% si te cogió la tarde.",
          viewButton: true,
          textAlign: TextAlign.center,
          leftTitle: false,
        ),
      ),
      dividerPadding,
      TrafficInfoWidget(),
      dividerPadding,
      const ListItem(
        title: "DESTACAMOS POR NUESTROS RESULTADOS",
        viewButton: false,
        leftTitle: false,
      ),
      StatsWidget(),
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
