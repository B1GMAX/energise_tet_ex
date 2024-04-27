import 'package:flutter/cupertino.dart';

class GeolocationInfoWidget extends StatelessWidget {
  final String label;
  final String? value;

  const GeolocationInfoWidget({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$label- ${value ?? ''}',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
