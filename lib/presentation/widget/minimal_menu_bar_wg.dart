import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minimal/config/styles/text_styles.dart';
import 'package:minimal/presentation/pages/more_page.dart';
import 'package:minimal/presentation/pages/us_page.dart';
import 'package:minimal/presentation/pages/z_pages.dart';
import 'package:minimal/presentation/providers/app_theme_provider.dart';
import 'package:minimal/presentation/widget/custom_hamburger_menu_wg.dart';
import 'package:minimal/shared/assets/assets.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MinimalMenuBar extends ConsumerWidget {
  const MinimalMenuBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final isDarkMode = ref.watch(appThemeProvider).isDarkMode;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Row(
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Navigator.defaultRouteName,
                    ModalRoute.withName(Navigator.defaultRouteName)),
                child: SizedBox(
                  child: Center(
                    child: Image.asset(
                      Res.images.macondoLogoMenu,
                      height: ResponsiveBreakpoints.of(context).isTablet
                          ? size.height * 0.13
                          : size.height * 0.15,
                      width: size.width * 0.4,
                    ),
                  ),
                ),
              ),
              if (ResponsiveBreakpoints.of(context).isTablet ||
                  ResponsiveBreakpoints.of(context).isMobile) ...[
                const Spacer(),
                CustomHamburgerMenu(),
                const Spacer(),
              ] else
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    child: Wrap(
                      children: [
                        const WhatsAppSupportButton(),
                        const InstagramSupportButton(),
                        const FacebookSupportButton(),
                        TextButton(
                          onPressed: () => context.go(HomePage.name),
                          style: isDarkMode
                              ? menuButtonStyle
                              : menuButtonStyleDarkMode,
                          child: const Text(
                            "INICIO",
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.go(UsPage.name),
                          // onPressed: () =>
                          //    Navigator.pushNamed(context, TypographyPage.name),
                          style: isDarkMode
                              ? menuButtonStyle
                              : menuButtonStyleDarkMode,
                          child: const Text(
                            "NOSOTROS",
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.go(MorePage.name),
                          style: isDarkMode
                              ? menuButtonStyle
                              : menuButtonStyleDarkMode,
                          child: const Text(
                            "MÁS",
                          ),
                        ),
                        Visibility(
                          visible: false,
                          child: TextButton(
                            onPressed: () => context.go(PageRegister.name),
                            style: isDarkMode
                                ? menuButtonStyle
                                : menuButtonStyleDarkMode,
                            child: const Text(
                              "CONTACT",
                            ),
                          ),
                        ),
                        Visibility(
                          visible: false,
                          child: IconButton(
                            icon: Icon(isDarkMode
                                ? Icons.dark_mode
                                : Icons.light_mode),
                            onPressed: () {
                              ref
                                  .read(appThemeProvider.notifier)
                                  .toggleTheme(); // Cambia el tema
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
