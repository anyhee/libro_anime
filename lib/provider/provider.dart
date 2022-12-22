import 'package:flutter/material.dart';
class RegistrationContent extends StatelessWidget {
  Datum data;

  RegistrationContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 490,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(//754ee82274374e60949a7225d6d34136
                    'Title:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                 
                ],
              )),
               Text(' ${data.attributes.canonicalTitle}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'genero:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.ageRatingGuide}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'points:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.averageRating}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'coverImageTop:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.coverImageTopOffset}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Fecha Creacion:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.createdAt}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Top:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.episodeCount}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Ediciones:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.episodeLength}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'favoritesCount:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.favoritesCount}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'popularity Rank:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.popularityRank}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Ranking 2022:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.ratingRank}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Numero Interacciones del mes:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.totalLength}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Horario de Emisison:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.updatedAt}'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nro Usuarios:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Text(' ${data.attributes.userCount}'),
                ],
              )),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.circle),
                      Text('anime Kitsu IO visitanos')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {/*TODO: perform login operation*/},
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.brown, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.bubble_chart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}