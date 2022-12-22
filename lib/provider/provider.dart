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
         
              
        ],
      ),
    );
  }
}