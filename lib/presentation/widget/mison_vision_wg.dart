import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MisionVisionWG extends StatelessWidget {
  const MisionVisionWG({super.key, this.isMission = true});

  final bool isMission;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.only(top: 16.0),
      child: ResponsiveBreakpoints.of(context).isTablet ||
              ResponsiveBreakpoints.of(context).isMobile
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Column(
                spacing: 10,
                children: _buildLayoutMobileMision(size.height * 0.4, context),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // spacing: 2.0,
                    children:
                        _buildLayoutDesktopMision(size.height * 0.4, context),
                  ),
                  dividerPadding,
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                    // spacing: 2.0,
                    children:
                        _buildLayoutDesktopVision(size.height * 0.4, context),
                  ),
                ],
              ),
            ),
    );
  }

  List<Widget> _buildLayoutMobileMision(double height, BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: FutureBuilder(
          future: precacheImage(
              // AssetImage(Res.images.relaxingAbstractYellow), context),
              NetworkImage(
                  'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa21udmRpamgyamR4enIxdWFma3F0bjh2cXZuOHFmdTFiNXNoeXFhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PjJ1cLHqLEveXysGDB/giphy.gif'),
              context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FadeIn(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    height: height,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        //  image: AssetImage(Res.images.relaxingAbstractYellow),
                        image: NetworkImage(
                            'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa21udmRpamgyamR4enIxdWFma3F0bjh2cXZuOHFmdTFiNXNoeXFhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PjJ1cLHqLEveXysGDB/giphy.gif'),
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
                              'NUESTRA MISION',
                              style: headlineSecondaryTextStyleWhite,
                              textAlign: TextAlign.center,
                            ),
                            /* divider,
                            Text(
                              'En Macondo Soluciones Efectivas, nuestra misión es conectar personas e instituciones a través de servicios digitales que simplifican sus interacciones. Creemos que cada trámite realizado de manera digital no solo ahorra tiempo y costos, sino que también transforma la forma en que las personas se relacionan con las instituciones que manejan el tránsito en Colombia.',
                              style: headlineSecondaryTextStyleWhite,
                              textAlign: TextAlign.center,
                            ),*/
                          ],
                        ),
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
      ),
      //  divider,
      SizedBox(
        height: height,
        child: Center(
          child: SingleChildScrollView(
            child: FadeInRight(
              duration: Duration(milliseconds: 1200),
              child: Text(
                textAlign: TextAlign.justify,
                //  maxLines: 5,
                'En Macondo Soluciones Efectivas, nuestra misión es conectar personas e instituciones a través de servicios digitales que simplifican sus interacciones. Creemos que cada trámite realizado de manera digital no solo ahorra tiempo y costos, sino que también transforma la forma en que las personas se relacionan con las instituciones que manejan el tránsito en Colombia.',
                style: TextStyles.headlineSecondaryTextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: FutureBuilder(
          future: precacheImage(
              // AssetImage(Res.images.relaxingAbstractYellow), context),
              NetworkImage(
                  'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa21udmRpamgyamR4enIxdWFma3F0bjh2cXZuOHFmdTFiNXNoeXFhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PjJ1cLHqLEveXysGDB/giphy.gif'),
              context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FadeIn(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    height: height,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        //  image: AssetImage(Res.images.relaxingAbstractYellow),
                        image: NetworkImage(
                            'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa21udmRpamgyamR4enIxdWFma3F0bjh2cXZuOHFmdTFiNXNoeXFhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PjJ1cLHqLEveXysGDB/giphy.gif'),
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
                              'NUESTRA VISION',
                              style: headlineSecondaryTextStyleWhite,
                              textAlign: TextAlign.center,
                            ),
                            /* divider,
                            Text(
                              'En Macondo Soluciones Efectivas, nuestra misión es conectar personas e instituciones a través de servicios digitales que simplifican sus interacciones. Creemos que cada trámite realizado de manera digital no solo ahorra tiempo y costos, sino que también transforma la forma en que las personas se relacionan con las instituciones que manejan el tránsito en Colombia.',
                              style: headlineSecondaryTextStyleWhite,
                              textAlign: TextAlign.center,
                            ),*/
                          ],
                        ),
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
      ),
      SizedBox(
        height: height,
        child: Center(
          child: SingleChildScrollView(
            child: FadeInRight(
              duration: Duration(milliseconds: 1200),
              child: Text(
                textAlign: TextAlign.justify,
                //  maxLines: 5,
                'Ser la empresa líder en servicios digitales para trámites de tránsito y cursos pedagógicos, garantizando la confianza y la calidad en cada interacción. Nos proponemos innovar continuamente para cambiar el mundo, un trámite o un curso a la vez.',
                style: TextStyles.headlineSecondaryTextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildLayoutDesktopVision(double height, BuildContext context) {
    return [
      Expanded(
        flex: 2,
        child: Container(
          height: height,
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  //divider,
                  FadeInRight(
                    duration: Duration(milliseconds: 1200),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40.0, right: 40, top: 10),
                      child: Text(
                        textAlign: TextAlign.justify,
                        //  maxLines: 5,
                        'Ser la empresa líder en servicios digitales para trámites de tránsito y cursos pedagógicos, garantizando la confianza y la calidad en cada interacción. Nos proponemos innovar continuamente para cambiar el mundo, un trámite o un curso a la vez.',
                        style:
                            TextStyles.headlineSecondaryTextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: FutureBuilder(
          future: precacheImage(
              //AssetImage(Res.images.relaxingAbstractYellow), context),
              NetworkImage(
                  'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa21udmRpamgyamR4enIxdWFma3F0bjh2cXZuOHFmdTFiNXNoeXFhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PjJ1cLHqLEveXysGDB/giphy.gif'),
              context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FadeInLeft(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    height: height,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        //image: AssetImage(Res.images.relaxingAbstractBlue),
                        image: NetworkImage(
                            "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa21udmRpamgyamR4enIxdWFma3F0bjh2cXZuOHFmdTFiNXNoeXFhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PjJ1cLHqLEveXysGDB/giphy.gif"),
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
                              padding: EdgeInsets.only(
                                  left: 40.0, right: 40.0, bottom: 10),
                              child: Text(
                                  textAlign: TextAlign.center,
                                  // maxLines: 5,
                                  'NUESTRA VISION',
                                  style: headlineTextStyleWhite),
                            ),
                            divider,
                          ],
                        ),
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
    ];
  }

  List<Widget> _buildLayoutDesktopMision(double height, BuildContext context) {
    return [
      Expanded(
        flex: 1,
        child: FutureBuilder(
          future: precacheImage(
              //AssetImage(Res.images.relaxingAbstractYellow), context),
              NetworkImage(
                  'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa21udmRpamgyamR4enIxdWFma3F0bjh2cXZuOHFmdTFiNXNoeXFhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PjJ1cLHqLEveXysGDB/giphy.gif'),
              context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FadeInLeft(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    height: height,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        //image: AssetImage(Res.images.relaxingAbstractBlue),
                        image: NetworkImage(
                            "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa21udmRpamgyamR4enIxdWFma3F0bjh2cXZuOHFmdTFiNXNoeXFhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PjJ1cLHqLEveXysGDB/giphy.gif"),
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
                              padding: EdgeInsets.only(
                                  left: 40.0, right: 40.0, bottom: 10),
                              child: Text(
                                  textAlign: TextAlign.center,
                                  // maxLines: 5,
                                  'NUESTRA MISIÓN',
                                  style: headlineTextStyleWhite),
                            ),
                            divider,
                          ],
                        ),
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
        child: Container(
          height: height,
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  //divider,
                  FadeInRight(
                    duration: Duration(milliseconds: 1200),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40.0, right: 40, top: 10),
                      child: Text(
                        textAlign: TextAlign.justify,
                        //  maxLines: 5,
                        'En Macondo Soluciones Efectivas, nuestra misión es conectar personas e instituciones a través de servicios digitales que simplifican sus interacciones. Creemos que cada trámite realizado de manera digital no solo ahorra tiempo y costos, sino que también transforma la forma en que las personas se relacionan con las instituciones que manejan el tránsito en Colombia.',
                        style:
                            TextStyles.headlineSecondaryTextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
