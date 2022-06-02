import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 10,
            start: 10,
            end: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: listWidgets(context),
          ),
        ),
      ),
    );
  }

  List<Widget> listWidgets(context) => [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Earth Coffe Mug',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          '18 KWD',
                          style: TextStyle(color: Colors.orange),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.purple[100],
                            )),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('3'),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Text('Sub Total:'),
            const Spacer(),
            Text(
              '100 KWD',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('Tax'),
            const Spacer(),
            Text(
              '15 KWD',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[200],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Text('Total'),
            const Spacer(),
            Text(
              '115 KWD',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: MaterialButton(
            color: Colors.red[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
            child: Text(
              'checkout'.toUpperCase(),
            ),
          ),
        ),
      ];

  List<Widget> emptyWidgets(context) => [
        Image.network(
          'https://cdn-icons-png.flaticon.com/512/1255/1255284.png?w=740',
          height: 200,
        ),
        Text(
          'Whoops!',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Your cart is empty now.check our products aand buy it',
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: 200,
          child: MaterialButton(
            color: Colors.red[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
            child: Text(
              'go to products'.toUpperCase(),
            ),
          ),
        ),
      ];
}
