import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/drawer_app.dart';

import '../main.dart';
import '../model/Products.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final Products products;
  const ProductsDetailsScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: colorText,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplay',
    );
    TextStyle blackTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplay',
    );
    return Scaffold(
         drawer: const DrawerApp(),
      appBar: AppBar(

        title: Text(
          'Products Detail',
          style: blackTextStyle,
        ),
        actions: const [Icon(Icons.add_shopping_cart)],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => listItem(products.imageURL!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.name!,
                    style: blackTextStyle.copyWith( fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                   Text(
                     products.price!,
                    style: textStyle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                 Card(
                   elevation: 5,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(50)
                   ),
                   child:  Container(
                     width: 80,
                   
                     child: Row(
                       children:  [
                         Icon(
                           Icons.remove,
                           color: Colors.grey,
                         ),
                         SizedBox(
                           width: 10.0,
                         ),
                         Text('3'
                         ,style: blackTextStyle,
                         ),
                         SizedBox(
                           width: 10.0,
                         ),
                         Icon(
                           Icons.add,
                           color: Colors.grey,
                         ),
                       ],
                     ),
                   ),
                 ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'About product',
                    style: blackTextStyle.copyWith( fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here content here\', making it look like readable English',
                    style: blackTextStyle.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height:50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: MaterialButton(

                      color: colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {},
                      child: Text(
                        'add to cart'.toUpperCase(),
                        style: blackTextStyle.copyWith( fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(String imageURL) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network( imageURL,
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress!=null){
                return CircularProgressIndicator(color: colorPrimary,);
              }else{
                return child;
              }
            },
            height: 220,
            width: 300,
            fit: BoxFit.fill,
          ),
        ),
      );

}
