import 'package:app_locate_bike/Models/bike.dart';
import 'package:app_locate_bike/Providers/cart_item.dart';
import 'package:app_locate_bike/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BikeDetailsScreen extends StatelessWidget {
  const BikeDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
    var cartProvider = Provider.of<CartItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${bike.nome}'),
        //centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: Icon(Icons.pedal_bike),
            onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
            },  
          ),

          Consumer<CartItem>(builder: (context, cartItem, _) => Text(cartItem.total.toString()),),

          SizedBox(
            width: 22,
          )
        ],
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
              onPressed: (){
                String resp = cartProvider.CheckListCart(bike, cartProvider.addBike); //!---> aqui foi passado para variavel resp o resutado da função CheckListCart e que também ira executar a verificação se o item está ou não está na lista
                  print('Quantidade de Bikes no cart: ${cartProvider.total}');
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("$resp", textAlign: TextAlign.center,              //!---> aqui foi passado a variavel resp como parametro da tela de pou-up que vair ser aberto, essa variavel será usada como o titulo.
                        style: TextStyle(),
                      ),
                      content: Icon(Icons.check_rounded, color: Colors.green, size: 100,),
                      actions: <Widget>[
                      
                        ElevatedButton.icon(
                          style:  ElevatedButton.styleFrom(
                            minimumSize: Size(170,40),
                            primary: Colors.black87,
                          ),
                          label: Text("Ver mais Bikes"),
                          icon: Icon(Icons.pedal_bike_rounded), 
                          onPressed: (){
                            Navigator.of(context).pushNamed(AppRoutes.HOME);
                          }, 
                        ),

                        ElevatedButton.icon(
                          style:  ElevatedButton.styleFrom(
                            minimumSize: Size(170,40),
                            primary: Colors.black87,
                          ),
                           
                          label: Text("Pagamento"),
                          icon: Icon(Icons.monetization_on_outlined),

                          onPressed: (){
                            Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
                          },
                        ),

                        ElevatedButton.icon(
                          style:  ElevatedButton.styleFrom(
                            minimumSize: Size(170,40),
                            primary: Colors.black87,
                          ),
                          label: Padding(
                            padding: const EdgeInsets.fromLTRB(40,0,0,0,),
                            child: Text("Fechar"),
                          ),
                          icon: Icon(Icons.close), 
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                        ),

                      ],
                    );
                  });
                  //showBottomSheet(context: context, builder: (context) => HomeModalAddCart(resp: resp,));
                  //
              }, 
            ),
          ],),
      ),
    );
  }
}