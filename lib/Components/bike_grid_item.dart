import 'package:app_locate_bike/Models/bike.dart';
import 'package:app_locate_bike/Providers/cart_item.dart';
import 'package:app_locate_bike/Screens/home_modal_addCart.dart';
import 'package:app_locate_bike/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikeGridItem extends StatelessWidget {
  final Bike bike;
  const BikeGridItem( {Key? key, required this.bike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    return GestureDetector(
      child: GridTile(
          child: Image(image: CachedNetworkImageProvider(bike.imageURL),
          fit: BoxFit.cover,
        ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            //trailing: Text('${bike.nome}'),
            //leading: Text('Aro ${bike.aro}"',
            title: Text(
              '${bike.nome}',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "R\$: ${bike.preco}",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ), 
            trailing: GestureDetector(
              child: Icon(Icons.add_shopping_cart_sharp),
              onTap: (){

                  String resp = cartProvider.CheckListCart(bike, cartProvider.addBike); //!---> aqui foi passado para variavel resp o resutado da função CheckListCart e que também ira executar a verificação se o item está ou não está na lista
                  //print('Quantidade de Bikes no cart: ${cartProvider.total}');

                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("$resp", textAlign: TextAlign.center, //!---> aqui foi passado a variavel resp como parametro da tela de pou-up que vair ser aberto, essa variavel será usada como o titulo.
                        style: TextStyle(),
                      ),
                      content: Icon(Icons.check_rounded, color: Colors.green, size: 100,),
                      actions: <Widget>[

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
              } 
            ),
          ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.BIKE_DETAIL, arguments: bike);
      },
    );
  }
}