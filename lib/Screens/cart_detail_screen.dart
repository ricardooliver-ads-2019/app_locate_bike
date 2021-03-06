import 'package:app_locate_bike/Models/bike.dart';
import 'package:app_locate_bike/Providers/cart_item.dart';
import 'package:app_locate_bike/services/get_preferenceid.dart';
import 'package:flutter/material.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:provider/provider.dart';
import '../app_routes.dart';

const publicKey = "TEST-c205470b-d722-4fea-933c-6cac06e82070";
var preferenceId = "";

class CartDetailScreen extends StatelessWidget {
  const CartDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    final List<Bike> bikes = Provider.of<CartItem>(context).bike;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Alugel'),
        //centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: Icon(Icons.pedal_bike),
            onPressed: (){},  
          ),

          Consumer<CartItem>(builder: (context, cartItem, _) => Text(cartItem.total.toString()),),

          SizedBox(
            width: 22,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    trailing: GestureDetector(
                      child: Icon(Icons.delete_forever, color: Colors.red,),
                      onTap: (){
                        cartProvider.removeBike(bikes[index]);
                      },
                    ),
                    title: Text('${bikes[index].nome}'),
                  ),
                );
              }, 
              separatorBuilder: (context, int index) => const Divider(), 
              itemCount: bikes.length,
            ),

            ElevatedButton.icon(
              //style: ButtonStyle(
              //  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
              //),
              style:  ElevatedButton.styleFrom(
                minimumSize: Size(180,40),
                primary: Colors.black87,
              ),
              icon: Icon(Icons.shopping_cart), 
              label: Text("Alugar ${cartProvider.total} Bikes por R\$ ${cartProvider.somaTotal.toStringAsFixed(2)}"),
              onPressed: () async{
                  preferenceId = await getPreferenceId(
                    title: "Aluguel de Bike",
                    description: "varias Bikes",
                    quantity: 1,
                    currency_id: "BRL",
                    unit_price: cartProvider.somaTotal,
                    email: "teste.teste@gmail.com"
                  );
                  PaymentResult result =
                      await MercadoPagoMobileCheckout.startCheckout(
                    publicKey,
                    preferenceId,
                  );
                  print("#################");
                  print(result.toString());
                  print("#################");
                },
            ),

            ElevatedButton.icon(
              //style: ButtonStyle(
              //  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
              //),
              style:  ElevatedButton.styleFrom(
                minimumSize: Size(180,40),
                primary: Colors.black87,
              ),
              icon: Icon(Icons.pedal_bike_rounded), 
              label: Text("Ver mais bikes"),
              onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.HOME);
              }, 
            )
          ],
        ),
      ),
    );
  }
}