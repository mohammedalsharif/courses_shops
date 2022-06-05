import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {
  int value=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Cart', style: blackTextStyle,),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 10,
            start: 15,
            end: 15,
          ),
          child: Container(
            child: value == 0 ?listWidgets(context) : emptyWidgets(context)  ,
          ),
        ),
      ),
    );
  }

  Column listWidgets(context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [ Card(
      elevation: 5,
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
                      'The Earth Coffee Mug',
                      style: blackTextStyle,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '18 KWD',
                      style: textStyle,
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
                      height: 10.0,
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
                            Icons.remove,
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
          Text(
            'Sub Total:',
            style: blackTextStyle.copyWith(color: Colors.grey),
          ),
          const Spacer(),
          Text(
            '100 KWD',
            style: blackTextStyle.copyWith(fontSize: 20),
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(
            'Tax(15%):',
            style: blackTextStyle.copyWith(color: Colors.grey),
          ),
          const Spacer(),
          Text(
            '15 KWD',
            style: blackTextStyle.copyWith(fontSize: 20),
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: [
          Text(
            'Total:',
            style: blackTextStyle,
          ),
          const Spacer(),
          Text(
            '115 KWD',
            style: blackTextStyle.copyWith(fontSize: 25),
          )
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
      const SizedBox(
        height: 30,
      ),
      SizedBox(
        width: double.infinity,
        height: 60.0,
        child: MaterialButton(
          color: colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
           setState(() {
             value=1;
           });
          },
          child: Text(
            'checkout'.toUpperCase(),
            style: blackTextStyle.copyWith(fontSize: 18),
          ),
        ),
      ),],
  );

  Column emptyWidgets(context) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Image.asset(
      "assets/empty-cart.png"
    ,
      height: 220,
    ),
      const SizedBox(
        height: 40.0,
      ),
      Text(
        'Whoops!',
        style: blackTextStyle.copyWith(color: Colors.black,fontSize: 40),
      ),
      const SizedBox(
        height: 20.0,
      ),
     SizedBox(
       width: 250,
       child:  Text(

         'Your cart is empty now.check our products aand buy it',
         textAlign: TextAlign.center,
         style: blackTextStyle.copyWith(fontSize: 16,color: Colors.grey

         ),
       ),
     ),
      const SizedBox(
        height: 20.0,
      ),
      SizedBox(
        height: 60,
        width: 250,
        child: MaterialButton(
          color: colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            setState(() {
              value=0;
            });
          },
          child: Text(
            'go to products'.toUpperCase(),
            style: blackTextStyle.copyWith(fontSize: 16),
          ),
        ),
      ),],
  );
}

