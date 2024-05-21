import 'package:flutter/material.dart';
import 'package:homework/model/metal_model.dart';

/*
  معاذ سليمان محسن
*/
class MetalHelper extends StatelessWidget {
  final List<Metal> theseMetals;
  final String price;
  const MetalHelper({
    super.key,
    required this.theseMetals,
    required this.price,
  });
  double getPrice(Metal thisMetal, String price) {
    switch (price) {
      case 'Price gram (10k)':
        return thisMetal.price_gram_10k;
      case 'Price gram (14k)':
        return thisMetal.price_gram_14k;
      case 'Price gram (16k)':
        return thisMetal.price_gram_16k;

      case 'Price gram (18k)':
        return thisMetal.price_gram_18k;
      case 'Price gram (20k)':
        return thisMetal.price_gram_20k;
      case 'Price gram (21k)':
        return thisMetal.price_gram_21k;
      case 'Price gram (22k)':
        return thisMetal.price_gram_22k;
      case 'Price gram (24k)':
        return thisMetal.price_gram_24k;
    }
    return thisMetal.price_gram_24k;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final thisMetal = theseMetals[index];
        final thisPrice = getPrice(thisMetal, price);
        return listTileBuilder(
            thisMetal, thisPrice, images[index], names[index]);
      },
      itemCount: theseMetals.length,
    );
  }
}

Widget listTileBuilder(Metal metal, double price, String image, String name) {
  return ListTile(
    contentPadding: const EdgeInsets.all(5),
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        image,
        width: 100,
        fit: BoxFit.cover,
      ),
    ),
    title: Text(
      name,
      style: const TextStyle(fontSize: 20),
    ),
    subtitle: Text(
      '\$${price.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 18),
    ),
  );
}

final List<String> images = [
  'assets/images/gold.jpeg',
  'assets/images/silver.jpeg',
  'assets/images/platinum.jpeg',
  'assets/images/palladium.jpeg',
];
final List<String> names = [
  'Gold',
  'Silver',
  'Platinum',
  'Palladium',
];
