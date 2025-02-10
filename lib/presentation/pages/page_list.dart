import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/presentation/providers/app_theme_provider.dart';
import 'package:minimal/presentation/widget/footer_wg.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:minimal/utils/max_width_extension.dart';
import 'package:responsive_framework/responsive_framework.dart';

const String listItemTitleText = "A BETTER BLOG FOR WRITING";
const String listItemPreviewText =
    "Sed elementum tempus egestas sed sed risus. Mauris in aliquam sem fringilla ut morbi tincidunt. Placerat vestibulum lectus mauris ultrices eros. Et leo duis ut diam. Auctor neque vitae tempus […]";

class ListPage extends ConsumerWidget {
  static const String name = '/home';

  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    //final isDarkMode = ref.watch(appThemeProvider).isDarkMode;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      floatingActionButton: CustomFloatingActionButton(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.transparent,
            toolbarHeight: size.height * 0.30,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Container(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco
                  borderRadius: BorderRadius.circular(15), // Bordes redondeados
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: const MinimalMenuBar(),
              ),
            ),
          ),
          SliverList.list(
            children: [
              //  Container(child: const MinimalMenuBar()),
              const ListItem(
                  imageUrl: "assets/images/paper_flower_overhead_bw_w1080.jpg",
                  title: listItemTitleText,
                  description: listItemPreviewText),
              divider,
              const ListItem(
                title: "NUESTROS ALIADOS ESTRATÉGICOS",
                viewButton: false,
                leftTitle: false,
              ),
              CustomCardSwipper(),
              divider,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: const ListNavigation(),
              ),
            ].toMaxWidth(context),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: MaxWidthBox(
                maxWidth: 1200,
                backgroundColor: Colors.white,
                child: Container()),
          ),
          ...[
            divider,
            //const Footer(),
            const Footer2(),
          ].toMaxWidthSliver(context),
        ],
      ),
    );
  }
}
