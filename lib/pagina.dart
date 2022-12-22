import 'package:flutter/material.dart';
import 'package:libroflutter/provider/anime_api.dart';
import 'package:libroflutter/provider/models.dart';
import 'package:provider/provider.dart';

class AuthEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final animeRecurso = Provider.of<AnimeRecurso>(context, listen: true);
    final List<Datum> anime = animeRecurso.animelist;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.2,
              child: PageView(
                children: anime.map((e) {
                  return PageViewItem(
                    title: e.attributes.slug,
                    name: e.id,
                    imageUrl: e.attributes.posterImage.large,
                    data: e,
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "kitsu io api".toUpperCase(),
                style: const TextStyle(fontSize: 25),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child:
                    const Text('Revisa informacion sobre lo ultimo en anime'),
              )
            ]),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class PageViewItem extends StatelessWidget {
  final String imageUrl;
  String title;
  String name;
  Datum data;

  PageViewItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.name,
      required this.data});

  @override
  Widget build(BuildContext context) {
    final animeRecurso = Provider.of<AnimeRecurso>(context, listen: true);
    final List<Datum> anime = animeRecurso.animelist;
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(97, 233, 30, 98),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text(
              "$title".toUpperCase(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 251, 250, 251), fontSize: 32),
            ),
          ),
          
          CircleAvatar(
            radius: 42,
            backgroundColor: Color.fromARGB(141, 233, 30, 98),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '$name'.toUpperCase(),
                style:  TextStyle(color: Colors.pink.shade700, fontSize: 18),
              ),
            ),
          ),
          const Spacer(),
          MaterialButton(
              child: Container(
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Text(
                      'Revisar',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AuthPage(data: data)));
              })
        ],
      ),
    );
  }
}

//login email
class AuthPage extends StatefulWidget {
  Datum data;

  AuthPage({super.key, required this.data});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2.1,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${widget.data.attributes.posterImage.original}'))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    width: 240,
                    height: 40,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.pinkAccent,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: <Widget>[
                        Text('Anime'.toUpperCase()),
                        Text('detalles'.toUpperCase())
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                      child: LoginContent(
                    data: widget.data,
                  )),
                  RegistrationContent(
                    data: widget.data,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//ANIME LOGIN

class LoginContent extends StatelessWidget {
  Datum data;

  LoginContent({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 32, right: 15, left: 15),
            child: Center(
              child: Text(
                data.attributes.slug,
                style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(255, 244, 54, 133),
                          offset: Offset(0, 3))
                    ]),
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ver mas:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.pink),
                ),
                Text(' ${data.links.self}'),
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Youtube:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.pink),
                ),
                Text(' ${data.attributes.youtubeVideoId}'),
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(top: 32, left: 30, right: 30),
            child: Text(
              data.attributes.description,
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

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
