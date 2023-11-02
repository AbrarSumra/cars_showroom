import 'package:flutter/material.dart';

class CstmIcon extends StatelessWidget {
  CstmIcon({
    super.key,
    required this.iconData,
    required this.name,
    this.onTap,
  });

  String name;
  IconData iconData;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black54,
            size: 25,
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
