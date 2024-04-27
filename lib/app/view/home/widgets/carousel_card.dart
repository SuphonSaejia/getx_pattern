import 'package:flutter/material.dart';
import 'package:neversitup_test/app/view/home/widgets/image_network.dart';

class CarouselCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  final bool select;

  const CarouselCard({super.key, required this.imageUrl, required this.name, required this.select});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: select
                ? Border.all(
                    width: 1,
                    color: const Color.fromRGBO(255, 25, 67, 1),
                  )
                : null,
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(10),
            child: ImageNet(
              height: 91,
              width: 91,
              src: imageUrl,
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
