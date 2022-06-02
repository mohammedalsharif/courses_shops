import 'package:flutter/material.dart';
import 'package:untitled/drawer_app.dart';
import 'package:untitled/screens/products_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(

        title: const Text(
          'Products',
        ),
        actions: const [Icon(Icons.add_shopping_cart)],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => allCoursesItem(context),
      ),
    );
  }

  Widget allCoursesItem(context) => InkWell(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
                    height: 80.0,
                    width: 80.0,
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
                      'Blology&The Sientifie Method',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '16 lesons',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.orange),
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
                      builder: (context) => const ProductsDetailsScreen(),
                    ),
                  );
               
        },
      );
}
