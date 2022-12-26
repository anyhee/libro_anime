
import 'package:libroflutter/pagina.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:libroflutter/provider/anime_api.dart';
import 'package:libroflutter/provider/models.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}

class AppState extends StatelessWidget {
//AIzaSyBwC5KliLCm3dZeDLSyP3TTnuQ8K63fFS0  API key
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) {
              return AnimeRecurso();
            }),
      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthEntryPage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final animeRecurso = Provider.of<AnimeRecurso>(context, listen: true);
    final List<Datum> anime = animeRecurso.animelist;
    return Scaffold(
      appBar: AppBar(
        title: Text('ANIME PLUS'),
      ),
      body: Container(
        child: Column(
          children: [
           
            ...anime.map(
              (e) => Container(
                  child: Column(
                children: [
                  Text(e.attributes.slug),
                  Text(e.attributes.posterImage.medium),
                  Image.network(e.attributes.posterImage.medium)
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
