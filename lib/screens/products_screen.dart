import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/drawer_app.dart';
import 'package:untitled/screens/products_details_screen.dart';

import '../main.dart';
import '../model/Products.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: Text(
          'Products',
          style: blackTextStyle,
        ),
        actions: const [Icon(Icons.add_shopping_cart)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: readProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
            if (snapshot.hasData) {
              List<Products>? products = snapshot.data;
              return ListView.builder(
                itemCount: products!.length,
                itemBuilder: (context, index) =>
                    allProductsItem(context, index, products),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: colorPrimary,
              ));
            }
          },
        ),
      ),
    );
  }

  Widget allProductsItem(context, int index, List<Products> products) =>
      InkWell(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    products[index].imageURL!,
                    loadingBuilder: (context, child, loadingProgress) {
                      if(loadingProgress!=null){
                        return CircularProgressIndicator(color: colorPrimary,);
                      }else{
                        return child;
                      }
                    },
                    height: 100,
                    width:100,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index].name!,
                      style: blackTextStyle,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      products[index].price!,
                      style: textStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsDetailsScreen(
                products: products[index],
              ),
            ),
          );
        },
      );

  Stream<List<Products>> readProducts() => FirebaseFirestore.instance
      .collection("products")
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Products.fromJson(e.data())).toList());
}
