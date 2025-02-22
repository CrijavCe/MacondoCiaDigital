import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TrafficInfoWidgetTypeTwo extends StatelessWidget {
  const TrafficInfoWidgetTypeTwo({super.key, this.usWg = false});

  final bool usWg;
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
                  children: _buildLayoutMobile(size.height * 0.3, context),
                )
              : Row(
                  spacing: 40.0,
                  children: usWg
                      ? _buildLayoutDesktopUS(size.height * 0.65, context)
                      : _buildLayoutDesktop(size.height * 0.65, context),
                ),
        ),
      ),
    );
  }

  List<Widget> _buildLayoutMobile(double height, BuildContext context) {
    return [
      FutureBuilder(
        future:
            //  precacheImage(AssetImage(Res.images.relaxingAbstractBlue), context),
            precacheImage(
                NetworkImage(usWg
                    ? "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2V1cDM2cmF6ZTJneXdtdHBwZmtiYW9kaHA2NWx6NWdlMGdudTc4MiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ITRemFlr5tS39AzQUL/giphy.gif"
                    : "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExeHVpcW5zeXVjdGxicXZpam5wenJqcHNkZDh0MGZ6NTRqZGx3azZkcyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YnexM9LwlwGu4Z1QnS/giphy.gif"),
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
                    // image: AssetImage(Res.images.relaxingAbstractBlue),
                    image: NetworkImage(usWg
                        ? "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2V1cDM2cmF6ZTJneXdtdHBwZmtiYW9kaHA2NWx6NWdlMGdudTc4MiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ITRemFlr5tS39AzQUL/giphy.gif"
                        : "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExeHVpcW5zeXVjdGxicXZpam5wenJqcHNkZDh0MGZ6NTRqZGx3azZkcyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YnexM9LwlwGu4Z1QnS/giphy.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 10,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 40.0, right: 40.0, bottom: 10),
                          child: Text(
                              textAlign: TextAlign.center,
                              // maxLines: 5,
                              usWg
                                  ? 'SOBRE NOSOTROS'
                                  : 'ACCESO RÁPIDO Y EFECTIVO AL DESCUENTO',
                              style: headlineTextStyleWhite),
                        ),
                        //   divider,
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
      Container(
        height: height,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                FadeInRight(
                  duration: Duration(milliseconds: 800),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, bottom: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      usWg
                          ? 'MACONDO SOLUCIONES EFECTIVAS'
                          : 'Descubre cómo nuestros curso pedagógico digital te brinda acceso rápido y efectivo al beneficio para la reducción de tus comparendos de tránsito',
                      style: TextStyles.headlineSecondaryTextStyle(
                          fontSize: 16, isBold: true),
                    ),
                  ),
                ),
                //divider,
                FadeInRight(
                  duration: Duration(milliseconds: 1200),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 40.0, right: 40, top: 10),
                    child: Text(
                      textAlign: TextAlign.justify,
                      usWg
                          ? 'Nuestra historia comenzó en 2012 como un proyecto familiar, guiado por el deseo de conectar personas. En 2023, dimos un giro hacia lo digital para hacer más fáciles y accesibles las gestiones de tránsito. Ayudamos a quienes enfrentan comparendos y a empresas del sector, eliminando trámites engorrosos y ahorrando tiempo. Creemos en la confianza, la innovación y en hacer la vida un poco más sencilla, un trámite a la vez.'
                          : 'Aquí te contamos el proceso para que tengas la certeza de que ocurrirá una vez ingreses tu información para que te contactemos.',
                      style:
                          TextStyles.headlineSecondaryTextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Visibility(
        visible: !usWg,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(bottom: 24),
            child: ReadMoreButton(
              title: "Ver el proceso completo",
              onPressed: () {},
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildLayoutDesktop(double height, BuildContext context) {
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
                  FadeInRight(
                    duration: Duration(milliseconds: 800),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, bottom: 10),
                      child: Text(
                        textAlign: TextAlign.left,
                        // maxLines: 5,
                        'Descubre cómo nuestros curso pedagógico digital te brinda acceso rápido y efectivo al beneficio para la reducción de tus comparendos de tránsito',
                        style:
                            TextStyles.headlineSecondaryTextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  //divider,
                  FadeInRight(
                    duration: Duration(milliseconds: 1200),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40.0, right: 40, top: 10),
                      child: Text(
                        textAlign: TextAlign.left,
                        //  maxLines: 5,
                        'Aquí te contamos el proceso para que tengas la certeza de que ocurrirá una vez ingreses tu información para que te contactemos.',
                        style:
                            TextStyles.headlineSecondaryTextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: ReadMoreButton(
                        title: "Ver el proceso completo",
                        onPressed: () {},
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
        flex: 2,
        child: FutureBuilder(
          future: precacheImage(
              //AssetImage(Res.images.relaxingAbstractYellow), context),
              NetworkImage(
                  "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExeHVpcW5zeXVjdGxicXZpam5wenJqcHNkZDh0MGZ6NTRqZGx3azZkcyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YnexM9LwlwGu4Z1QnS/giphy.gif"),
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
                        //image: AssetImage(Res.images.relaxingAbstractBlue),
                        image: NetworkImage(
                            "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExeHVpcW5zeXVjdGxicXZpam5wenJqcHNkZDh0MGZ6NTRqZGx3azZkcyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YnexM9LwlwGu4Z1QnS/giphy.gif"),
                        fit: BoxFit.fill,
                        opacity: 0.8),
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
                                'ACCESO RÁPIDO Y EFECTIVO AL DESCUENTO',
                                style: headlineTextStyleWhite),
                          ),
                          divider,
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
    ];
  }

  List<Widget> _buildLayoutDesktopUS(double height, BuildContext context) {
    return [
      Expanded(
        flex: 2,
        child: FutureBuilder(
          future: precacheImage(
              //AssetImage(Res.images.relaxingAbstractYellow), context),
              NetworkImage(
                  "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2V1cDM2cmF6ZTJneXdtdHBwZmtiYW9kaHA2NWx6NWdlMGdudTc4MiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ITRemFlr5tS39AzQUL/giphy.gif"),
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
                      //image: AssetImage(Res.images.relaxingAbstractBlue),
                      image: NetworkImage(
                          "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2V1cDM2cmF6ZTJneXdtdHBwZmtiYW9kaHA2NWx6NWdlMGdudTc4MiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ITRemFlr5tS39AzQUL/giphy.gif"),
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
                                'SOBRE NOSOTROS',
                                style: headlineTextStyleWhite),
                          ),
                          divider,
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
                  FadeInRight(
                    duration: Duration(milliseconds: 800),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, bottom: 10),
                      child: Text(
                        textAlign: TextAlign.left,
                        // maxLines: 5,
                        'MACONDO SOLUCIONES EFECTIVAS',
                        style:
                            TextStyles.headlineSecondaryTextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  //divider,
                  FadeInRight(
                    duration: Duration(milliseconds: 1200),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40.0, right: 40, top: 10),
                      child: Text(
                        textAlign: TextAlign.justify,
                        //  maxLines: 5,
                        'Nuestra historia comenzó en 2012 como un proyecto familiar, guiado por el deseo de conectar personas. En 2023, dimos un giro hacia lo digital para hacer más fáciles y accesibles las gestiones de tránsito. Ayudamos a quienes enfrentan comparendos y a empresas del sector, eliminando trámites engorrosos y ahorrando tiempo. Creemos en la confianza, la innovación y en hacer la vida un poco más sencilla, un trámite a la vez.',
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
