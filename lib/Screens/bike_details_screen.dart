
import 'package:app_locate_bike/Models/bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BikeDetailsScreen extends StatelessWidget {
  const BikeDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('${bike.nome}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
      
          children: [
            Image(
              image: CachedNetworkImageProvider(bike.imageURL),
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
      
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("${bike.nome}", 
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: RichText(textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "${bike.descricao}",
                  style: TextStyle(color: Colors.black87),
                ),),),
            ),
      
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
              ),
              icon: Icon(Icons.shopping_cart), 
              label: Text("Alugar Bike"),
              onPressed: (){}, 
            )
          ],),
      ),
    );
  }
}