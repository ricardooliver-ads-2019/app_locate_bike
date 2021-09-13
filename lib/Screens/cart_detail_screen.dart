import 'package:app_locate_bike/Models/bike.dart';
import 'package:app_locate_bike/Providers/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartDetailScreen extends StatelessWidget {
  const CartDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    final List<Bike> bikes = Provider.of<CartItem>(context).bike; //!
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Aluguel"),
        backgroundColor: Colors.black87,
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
                      child: Icon(Icons.remove_shopping_cart_rounded),
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
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
              ),
              icon: Icon(Icons.shopping_cart), 
              label: Text("Ir para pagamento"),
              onPressed: (){}, 
            )
          ],
        ),
      ),
    );
  }
}