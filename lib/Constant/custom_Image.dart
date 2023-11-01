import 'package:flutter/material.dart';

class CstmImage extends StatelessWidget {
  const CstmImage({
    super.key,
    required this.assetsPath,
    required this.onTap,
    required this.name,
  });

  final String assetsPath;
  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 100,
              width: 180,
              child: Image.asset(
                assetsPath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
