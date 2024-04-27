import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neversitup_test/app/view/home/widgets/image_network.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String desc;
  final String price;

  const ProductCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.desc,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: 'Product Description',
          middleText: desc,
          textCancel: 'Close',
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 15,
              color: Color.fromRGBO(0, 0, 0, 0.05),
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ImageNet(
                height: 90,
                width: double.infinity,
                src: imageUrl,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: double.infinity),
                    const SizedBox(height: 12),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(38, 38, 38, 1),
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(38, 38, 38, 1),
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color.fromRGBO(255, 25, 67, 1),
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
