import 'package:flutter/cupertino.dart';

class Recently extends StatelessWidget {
  const Recently({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  final ImageProvider image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(
            image: image,
            width: 130,
            height: 130,
          ),
          SizedBox(
            height: 10,
          ),
          Text(label),
        ],
      ),
    );
  }
}
