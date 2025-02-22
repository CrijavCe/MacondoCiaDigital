import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'dart:math';

import 'package:minimal/shared/assets/assets.dart';

class InteractiveCard extends StatefulWidget {
  final String imagePath;
  final String text;

  const InteractiveCard(
      {super.key, required this.imagePath, required this.text});

  @override
  _InteractiveCardState createState() => _InteractiveCardState();
}

class _InteractiveCardState extends State<InteractiveCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: pi).animate(_controller);
  }

  void _toggleCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return GestureDetector(
      onTap: isMobile ? _toggleCard : null,
      child: MouseRegion(
        onEnter: isMobile ? null : (_) => _controller.forward(),
        onExit: isMobile ? null : (_) => _controller.reverse(),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final angle = _animation.value;
            final isBack = angle > pi / 2;
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(angle),
              child: isBack
                  ? Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.rotationY(pi), // Corrige el texto al derecho
                      child: _buildCard(
                          widget.text, Colors.blueGrey, Colors.white),
                    )
                  : _buildCard(null, Colors.grey, Colors.black,
                      imagePath: widget.imagePath),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(String? text, Color bgColor, Color textColor,
      {String? imagePath}) {
    return Container(
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2)),
        ],
      ),
      child: Center(
        child: text != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(text,
                    textAlign: TextAlign.center, style: subtitleTextStyleWhite),
              )
            : Image.asset(imagePath!, fit: BoxFit.cover),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class InteractiveCardWrap extends StatelessWidget {
  const InteractiveCardWrap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 40,
        alignment: WrapAlignment.spaceAround,
        children: [
          InteractiveCard(
            //imagePath: "assets/trust.png",
            imagePath: Res.icons.confianzaIcon,
            text:
                "CONFIANZA\n\nConstruimos relaciones basadas en transparencia, honestidad e integridad",
          ),
          InteractiveCard(
            imagePath: Res.icons.calidadIcon,
            text:
                "CALIDAD\n\nGarantizamos servicios precisos y de alto nivel en cada trámite y curso",
          ),
          InteractiveCard(
            imagePath: Res.icons.servicioIcon,
            text:
                "EXCELENCIA EN SERVICIO\n\nPriorizamos la satisfacción con atención accesible, amigable y eficaz",
          ),
          InteractiveCard(
            imagePath: Res.icons.innovacionIcon,
            text:
                "INNOVACIÓN CONTINUA\n\nMejoramos constantemente con tecnología de vanguardia",
          ),
          InteractiveCard(
            imagePath: Res.icons.compromisoIcon,
            text:
                "COMPROMISO CON EL CAMBIO\n\nTransformamos realidades, un trámite a la vez.",
          ),
        ],
      ),
    );
  }
}
