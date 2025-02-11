import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minimal/config/config.dart';

class CustomHamburgerMenu extends StatelessWidget {
  const CustomHamburgerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Menú', style: headlineTextStyle),
          PopupMenuButton<int>(
            elevation: 4.0,
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 50,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Bordes más curveados
            ),
            offset: const Offset(0, 55),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: SizedBox(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Inicio",
                        style: headlineSecondaryTextStyle,
                      ),
                      divider,
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                  value: 2,
                  child: SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nosotros", style: headlineSecondaryTextStyle),
                        divider,
                      ],
                    ),
                  )),
              PopupMenuItem(
                  value: 3,
                  child: SizedBox(
                    width: 120,
                    child: Text(
                      "Más",
                      style: headlineSecondaryTextStyle,
                    ),
                  )),
            ],
            onSelected: (value) {
              switch (value) {
                case 1:
                  context.go('/home');
                  break;
                case 2:
                  context.go('/us');
                  break;
                case 3:
                  context.go('/more');
                  break;
                default:
                  context.go('/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
