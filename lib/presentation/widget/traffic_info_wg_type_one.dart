import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TrafficInfoWidget extends StatelessWidget {
  const TrafficInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.only(top: 16.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: ResponsiveBreakpoints.of(context).isTablet ||
                  ResponsiveBreakpoints.of(context).isMobile
              ? Column(
                  spacing: 20,
                  children: _buildLayoutMobile(size.height * 0.45, context),
                )
              : Row(
                  spacing: 40.0,
                  children: _buildLayoutDesktop(size.height * 0.65, context),
                ),
        ),
      ),
    );
  }

  List<Widget> _buildLayoutMobile(double height, BuildContext context) {
    return [
      FutureBuilder(
        future: precacheImage(
            // AssetImage(Res.images.relaxingAbstractYellow), context),
            NetworkImage("https://i.giphy.com/rgzOwma0qMbM3x7Fqi.webp"),
            context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FadeIn(
              child: Container(
                height: height,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    //  image: AssetImage(Res.images.relaxingAbstractYellow),
                    image: NetworkImage(
                        "https://i.giphy.com/rgzOwma0qMbM3x7Fqi.webp"),
                    // Imagen de fondo
                    fit: BoxFit.cover,
                    opacity: 1.0,
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 10,
                      children: [
                        Text(
                          'Obtén una visión clara de tus infracciones de tránsito y cómo resolverlas de manera efectiva.',
                          style: headlineSecondaryTextStyleWhite,
                          textAlign: TextAlign.center,
                        ),
                        divider,
                        Text(
                          'Nunca fue tan sencillo: Sin horarios rígidos, sin filas, sin el estrés de tener que ir al Organismo de Tránsito.',
                          style: headlineSecondaryTextStyleWhite,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      divider,
      GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.2, // Reduce el tamaño de los cards
        children: List.generate(4, (index) => _buildInfoCard(index, context)),
      ),
    ];
  }

  List<Widget> _buildLayoutDesktop(double height, BuildContext context) {
    return [
      Expanded(
        flex: 2,
        child: FutureBuilder(
          future: precacheImage(
              //  AssetImage(Res.images.relaxingAbstractYellow), context),
              NetworkImage("https://i.giphy.com/rgzOwma0qMbM3x7Fqi.webp"),
              context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FadeInLeft(
                child: Container(
                  height: height,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      // image: AssetImage(Res.images.relaxingAbstractYellow),
                      image: NetworkImage(
                          "https://i.giphy.com/rgzOwma0qMbM3x7Fqi.webp"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40.0, bottom: 10),
                            child: Text(
                              textAlign: TextAlign.center,
                              // maxLines: 5,
                              'Obtén una visión clara de tus infracciones de tránsito y cómo resolverlas de manera efectiva.',
                              style: headlineTextStyleWhite,
                            ),
                          ),
                          divider,
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40, top: 10),
                            child: Text(
                              textAlign: TextAlign.center,
                              //  maxLines: 5,
                              'Nunca fue tan sencillo: Sin horarios rígidos, sin filas, sin el estrés de tener que ir al Organismo de Tránsito.',
                              style: headlineTextStyleWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      Expanded(
        flex: 2,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.2, // Reduce el tamaño de los cards
          children: List.generate(
              4, (index) => FadeInRight(child: _buildInfoCard(index, context))),
        ),
      ),
    ];
  }

  Widget _buildInfoCard(int index, BuildContext context) {
    List<String> titles = [
      'Curso Pedagógico 100% Digital para infractores de tránsito',
      'Conocimiento y beneficios',
      'Reducción de costo en comparendos de tránsito',
      'Soporte integral'
    ];
    List<IconData> icons = [
      Icons.desktop_windows,
      Icons.info,
      Icons.savings,
      Icons.support
    ];
    List<Color> colors = [
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.orangeAccent,
      Colors.orangeAccent
    ];

    return Card(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(
            15.0), // Reduce padding para hacer el card más pequeño
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Icon(
                  icons[index],
                  color: colors[index],
                  size: 50,
                ),
                ResponsiveBreakpoints.of(context).isTablet ||
                        ResponsiveBreakpoints.of(context).isMobile
                    ? FadeIn(
                        duration: Duration(milliseconds: 1200),
                        child: Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: subtitleTextStyle,
                        ),
                      )
                    : Text(
                        titles[index],
                        textAlign: TextAlign.center,
                        style: subtitleTextStyle,
                        // Reduce tamaño de texto
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
