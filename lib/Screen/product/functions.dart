import 'package:at_project/data/product_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Item>> getProducts() async {
  try {
    final productsSnapshot =
        await FirebaseFirestore.instance.collection('products').get();
    List<Item> productsList = [];

    for (var product in productsSnapshot.docs) {
      var data = product.data();
      var imgUrlList =
          (data['imgUrl'] as List).map((url) => url.toString()).toList();
      var itemObject = Item(
        sellerName: data['sellerName'],
        sellerId: data['sellerId'],
        title: data['title'],
        imgUrl: imgUrlList,
        price: data['price'],
        description: data['description'],
        category: data['category'],
      );
      productsList.add(itemObject);
    }

    return productsList;
  } catch (error) {
    print('Error fetching products: $error');
    return [];
  }
}
