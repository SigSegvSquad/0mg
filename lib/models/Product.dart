import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/Aarovit_syrup.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Aarovit syrup",
    price: 108.00,
    description: "Aarovit Syrup contains Multiminerals and Multivitamins as active ingredients. Aarovit Syrup is useful for the normal and proper growth of the body. During pregnancy, childhood, and illness body requires more vitamins and minerals than usual. Aarovit fulfills all the requirements of the body for the proper functioning.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Abetcola_Tablet.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Abetcola Tablet",
    price: 309.00,
    description: "Abetcola Tablet is a combination of ingredients that has anti-aging properties. It improves health and growth of hair and nails",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/Amenol.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Amenol Tablet",
    price: 36.55,
    description: "AMENOL TABLETS   RANGE OF ACTION: Effective in Amenorrhoea. Also useful in Dysmenorrhoea. Helpful in Uterus Chlorosis",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/Anaboom.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Anaboom Shampoo",
    price: 20.20,
    description: "Anaboom AD shampoo contains active ingredients zinc pyrithione which is an antifungal. It prevents hair fall and provides extra rich conditioning to hair. ... It helps in reducing flakes, provides relief from itch, and improves hair tangles and more",
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
      id: 5,
      images: [
        "assets/images/horlicks.jpg",
      ],
      colors:  [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Horlicks Junior",
      price: null,
      description: "Junior Horlicks is tailor made nutrition for Growth and Development of Toddlers and Pre-Schoolers. Horlicks is a nourishing malt based beverage that helps support your child's growth. Lite Horlicks is a specialised health food drink designed for Active Adults. Bone Nutrition specialist designed for Women"
  ),
  Product(
    id: 6,
    images: [
      "assets/images/Cetirizine.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Cetirizine Tablet",
    price: 36.55,
    description: "Cetirizine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and itching. It works by blocking a certain natural substance (histamine) that your body makes during an allergic reaction",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/Cetirizine.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Cetirizine Tablet",
    price: 36.55,
    description: "Cetirizine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and itching. It works by blocking a certain natural substance (histamine) that your body makes during an allergic reaction",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
];

List<Product> suplimentPro = [
Product(
id: 1,
images: [
"assets/images/Aarovit_syrup.jpg",
],
colors: [
Color(0xFFF6625E),
Color(0xFF836DB8),
Color(0xFFDECB9C),
Colors.white,
],
title: "CHOCOLATE / VANILA / KESAR BADAM",
price: 108.00,
description: "null",
rating: 4.8,
isFavourite: true,
isPopular: true,
),
Product(
id: 2,
images: [
"assets/images/Aarovit_syrup.jpg",
],
colors: [
Color(0xFFF6625E),
Color(0xFF836DB8),
Color(0xFFDECB9C),
Colors.white,
],
title: "CIPROFLOXACIN 500MG",
price: 108.00,
description: "null",
rating: 4.8,
isFavourite: true,
isPopular: true,
),
Product(
id: 3,
images: [
"assets/images/Aarovit_syrup.jpg",
],
colors: [
Color(0xFFF6625E),
Color(0xFF836DB8),
Color(0xFFDECB9C),
Colors.white,
],
title: "CALCIUM 500 MG + VIT D3",
price: 108.00,
description: "null",
rating: 4.8,
isFavourite: true,
isPopular: true,
),
Product(
id: 4,
images: [
"assets/images/Aarovit_syrup.jpg",
],
colors: [
Color(0xFFF6625E),
Color(0xFF836DB8),
Color(0xFFDECB9C),
Colors.white,
],
title: "CITICOLINE 250 MG",
price: 108.00,
description: "null",
rating: 4.8,
isFavourite: true,
isPopular: true,
),
];