import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neversitup_test/app/controller/home_controller.dart';
import 'package:neversitup_test/app/data/model/department.dart';
import 'package:neversitup_test/app/data/model/products.dart';
import 'package:neversitup_test/app/view/home/widgets/carousel_card.dart';
import 'package:neversitup_test/app/view/home/widgets/product_card.dart';
import 'package:neversitup_test/app/view/home/widgets/title.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Neversitup Test",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromRGBO(120, 127, 246, 1),
                Color.fromRGBO(28, 167, 236, 1),
              ],
            ),
          ),
        ),
      ),
      body: GetX<HomeController>(
        builder: (controller) {
          if (controller.department.isEmpty) return const Center(child: CircularProgressIndicator());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TitleName(title: "Department carousel"),
              SizedBox(
                height: 91,
                width: double.infinity,
                child: ListView.separated(
                  itemCount: controller.department.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    Department department = controller.department[index];
                    return GestureDetector(
                      onTap: () {
                        controller.index = index;
                        controller.getProducts(id: department.id);
                      },
                      child: CarouselCard(
                        name: department.name,
                        imageUrl: department.imageUrl,
                        select: index == controller.index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                ),
              ),
              const SizedBox(height: 20),
              TitleName(title: "Product listing: ${controller.department[controller.index].name}"),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: List.generate(
                    controller.products.length,
                    (index) {
                      Product product = controller.products[index];
                      return ProductCard(
                        imageUrl: product.imageUrl,
                        name: product.name,
                        desc: product.desc,
                        price: product.price,
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
