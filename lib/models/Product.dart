import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final String id;
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

List<Product> allProducts = [];
List<Product> supplementProductList = [];
List<Product> lifestyleProductList = [];
List<Product> tabletProductList = [];
List<Product> surgeryProductList = [];
List<Product> ayurvedaProductList = [];
List<Product> otherProductList = [];

Product getProductById(String id){
  for(var i=0;i<allProducts.length;i++){
    if(id==allProducts[i].id)
      return allProducts[i];
  }
  return null;
}

void getProductData() {
  FirebaseFirestore.instance
      .collection('products')
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Product product = Product(
                id: doc.id,
                images: [
                  "assets/images/Aarovit_syrup.jpg",
                ],
                colors: [
                  Color(0xFFF6625E),
                  Color(0xFF836DB8),
                  Color(0xFFDECB9C),
                  Colors.white,
                ],
                title: doc['name'],
                price: double.parse(doc['price']),
                description: "Need a description",
                rating: 5.0,
                isFavourite: false,
                isPopular: true,
              );
              allProducts.add(product);
              print("\n");
              print(product.title+"\n");
              if (doc["category"] == "lifestyle") {
                lifestyleProductList.add(product);
              } else if (doc["category"] == "tablet") {
                tabletProductList.add(product);
              } else if (doc["category"] == "supplement") {
                supplementProductList.add(product);
              } else if (doc["category"] == "surgery") {
                surgeryProductList.add(product);
              } else if (doc["category"] == "ayurveda") {
              ayurvedaProductList.add(product);
              }
              else if (doc["category"] == "other") {
                otherProductList.add(product);
              }
            })
          });

}

List<Product> demoProducts = [
  Product(
    id: "1",
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
    description:
        "Aarovit Syrup contains Multiminerals and Multivitamins as active ingredients. Aarovit Syrup is useful for the normal and proper growth of the body. During pregnancy, childhood, and illness body requires more vitamins and minerals than usual. Aarovit fulfills all the requirements of the body for the proper functioning.",
    rating: 4.8,
    isFavourite: false,
    isPopular: true,
  ),
  Product(
    id: "2",
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
    description:
        "Abetcola Tablet is a combination of ingredients that has anti-aging properties. It improves health and growth of hair and nails",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: "3",
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
    description:
        "AMENOL TABLETS   RANGE OF ACTION: Effective in Amenorrhoea. Also useful in Dysmenorrhoea. Helpful in Uterus Chlorosis",
    rating: 4.1,
    isFavourite: false,
    isPopular: true,
  ),
  Product(
    id: "4",
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
    description:
        "Anaboom AD shampoo contains active ingredients zinc pyrithione which is an antifungal. It prevents hair fall and provides extra rich conditioning to hair. ... It helps in reducing flakes, provides relief from itch, and improves hair tangles and more",
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
      id: "5",
      images: [
        "assets/images/horlicks.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Horlicks Junior",
      price: null,
      description:
          "Junior Horlicks is tailor made nutrition for Growth and Development of Toddlers and Pre-Schoolers. Horlicks is a nourishing malt based beverage that helps support your child's growth. Lite Horlicks is a specialised health food drink designed for Active Adults. Bone Nutrition specialist designed for Women"),
  Product(
    id: "6",
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
    description:
        "Cetirizine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and itching. It works by blocking a certain natural substance (histamine) that your body makes during an allergic reaction",
    rating: 4.1,
    isFavourite: false,
    isPopular: true,
  ),
  Product(
    id: "7",
    images: [
      "assets/images/ashwagandha.jfif",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Ashwagandha Powder",
    price: 636.55,
    description:
        "Ashwagandha is a small evergreen shrub. It grows in India, the Middle East, and parts of Africa. The root and berry are used to make medicine. Ashwagandha is commonly used for stress. It is also used as an adaptogen for many other conditions, but there is no good scientific evidence to support these other uses.",
    rating: 4.1,
    isFavourite: true,
    isPopular: false,
  ),
  Product(
    id: "8",
    images: [
      "assets/images/cardocalm.jfif",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "CardoCalm Tablets",
    price: 636.55,
    description:
        "Cardocalm Tablet is an ayurvedic dietary supplement, primarily used to manage vitamin and mineral deficiency in the body caused due to certain illnesses or poor intake of diet. It is formulated using ayurvedic herbs containing essential vitamins and minerals which improves overall health and development",
    rating: 4.1,
    isFavourite: true,
    isPopular: false,
  ),
  Product(
    id: "9",
    images: [
      "assets/images/paracetamol.jfif",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Paracetamol",
    price: 24.55,
    description:
        "This medicine contains paracetamol. It belongs to a group of medicines called analgesics (painkillers) and is used to treat pain (including headache, toothache, back and period pain) and cold or flu symptoms",
    rating: 4.1,
    isFavourite: true,
    isPopular: false,
  ),
];

/*

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
      "assets/images/cipro (1).jpg",
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
      "assets/images/calcium.jpg",
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
      "assets/images/CITICOLINE 250 MG.jpg",
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
  Product(
    id: 5,
    images: [
      "assets/images/PARACETAMOL 250MG SUSP.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "PARACETAMOL 250MG SUSP",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/PANTOPROZOLE -40MG.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "PANTOPROZOLE -40MG",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/TRANEXAMIC ACID 500MG.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "TRANEXAMIC ACID 500MG",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 8,
    images: [
      "assets/images/PAIN RELEIF SPRAY.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "PAIN RELEIF SPRAY",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 9,
    images: [
      "assets/images/TRAMAROL HYDROCHLORIDE INJ.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "TRAMAROL HYDROCHLORIDE INJ",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 10,
    images: [
      "assets/images/VITAMIN - MINERAL - IRON MALT.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "VITAMIN - MINERAL - IRON MALT",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 11,
    images: [
      "assets/images/VITAMIN - MINERAL - IRON MALT.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "PROTINE SUPPLEMENT WITH VIT",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 12,
    images: [
      "assets/images/OFLOXACIN INFUSION.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "OFLOXACIN INFUSION 0.2% W/V",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 13,
    images: [
      "assets/images/ONDASETRON.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ONDASETRON",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 14,
    images: [
      "assets/images/NIMESULIDE 100MG.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "NIMESULIDE 100MG",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 15,
    images: [
      "assets/images/MULTIVITAMINS + FOLIC + MINERALS.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "MULTIVITAMINS + FOLIC + MINERALS",
    price: 108.00,
    description: "null",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),

 */
