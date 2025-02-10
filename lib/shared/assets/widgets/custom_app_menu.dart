import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/presentation/pages/pages.dart';
import 'package:minimal/shared/assets/widgets/custom_menu_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/shared/assets/widgets/custom_menu_item.dart';

class CustomAppMenu extends ConsumerStatefulWidget {
  const CustomAppMenu({super.key});

  @override
  ConsumerState<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends ConsumerState<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() => isOpen = !isOpen);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(
                  delay: 1,
                  text: 'Hogar',
                  onPressed: () => context.go('/typography'),
                ),
                CustomMenuItem(
                    delay: 20,
                    text: 'About',
                    onPressed: () {
                      context.go('/register');
                    }),
                CustomMenuItem(delay: 40, text: 'Pricing', onPressed: () {}),
                CustomMenuItem(delay: 60, text: 'Contact', onPressed: () {}),
                CustomMenuItem(delay: 80, text: 'Location', onPressed: () {}),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text('Menú',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
