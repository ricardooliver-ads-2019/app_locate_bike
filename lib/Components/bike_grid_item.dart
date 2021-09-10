import 'package:app_locate_bike/Models/bike.dart';
import 'package:app_locate_bike/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BikeGridItem extends StatelessWidget {
  final Bike bike;
  const BikeGridItem( {Key? key, required this.bike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              textAlign: TextAlign.center,
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
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ), 
          ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.BIKE_DETAIL, arguments: bike);
      },
    );
  }
}