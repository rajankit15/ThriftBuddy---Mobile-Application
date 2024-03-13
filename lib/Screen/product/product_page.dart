import 'package:at_project/data/product_class.dart';
import 'package:at_project/reusable_widgets/button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                  ),
                  items: List.generate(
                    item.imgUrl.length,
                    (index) => Builder(builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(item.imgUrl[index]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text('Category : ${item.category}',
                      style: const TextStyle(fontSize: 13)),
                  const Spacer(),
                  Text('${item.imgUrl.length} Images'),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 5),
              Text(item.title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              // const SizedBox(height: 5),
              Text('₹ ${item.price}', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 5),
                      Text(item.description,
                          style: const TextStyle(fontSize: 16))
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Seller Details',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Name: ${item.sellerName}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(child: reuseButton(onTap: () {}, text: 'Enquire Now')),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
