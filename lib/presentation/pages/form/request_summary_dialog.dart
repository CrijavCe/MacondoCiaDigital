import 'package:flutter/material.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';

class RequestSummaryDialog extends StatelessWidget {
  final String description;
  final String category;
  final String time;
  final String date;
  final String address;
  final String name;
  final String documentType;
  final String document;
  final String email;
  final String phone;
  final VoidCallback onRightPressed;

  const RequestSummaryDialog({
    super.key,
    required this.description,
    required this.category,
    required this.time,
    required this.date,
    required this.address,
    required this.name,
    required this.documentType,
    required this.document,
    required this.email,
    required this.phone,
    required this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      closeIconColor: Colors.black54,
      padding: 20,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text(
            'Tu solicitud ha sido recibida. Nuestro equipo te está asignando un proveedor.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Resumen:',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          _buildDetail('Descripción:', description),
          _buildDetail('Categoria:', category),
          _buildDetail('Hora:', time),
          _buildDetail('Fecha:', date),
          _buildDetail('Ubicación:', address),
          _buildDetail('Nombre:', name),
          _buildDetail('Documento:', document),
          _buildDetail('Email:', email),
          _buildDetail('Teléfono:', phone),
          const SizedBox(height: 20),
          const Text(
            'Te contactaremos pronto con los detalles de tu reserva.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
        ],
      ),
      hasLeftButton: false,
      hasRightButton: true,
      hasRightButtonText: "Aceptar",
      onRightPressed: onRightPressed,
    );
  }

  Widget _buildDetail(String label, String value) {
    return Text(
      '$label $value',
      style: TextStyle(fontSize: 14, color: Colors.black54),
    );
  }
}
