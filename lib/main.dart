import 'package:flutter/material.dart';
import 'ALBUMS.dart' as ALBUMS;
import 'SONGS.dart' as SONGS;
import 'ARTISTS.dart' as ARTISTS;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(color: Colors.grey,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(child: Text('Shuffle All')),
              PopupMenuItem(child: Text('View As'),),
              PopupMenuItem(child: Text('Short By')),
              PopupMenuItem(child: Text('Equalizer')),
              PopupMenuItem(child: Text('Settings'))
            ],
          ),
        ],
        backgroundColor: Colors.deepPurple,
        title: Text('Music Player'),
        bottom: TabBar(
          indicatorColor: Colors.yellow,
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'SONGS'),
            Tab(text: 'ALBUMS'),
            Tab(text: 'ARTISTS'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Anurag Singh'),
              accountEmail: Text('imanurag51@gmail.com'),
            ),
            ListTile(
              title: Text('Library'),
              leading: Icon(Icons.library_music),
            ),
            ListTile(
              title: Text('Playlists'),
              leading: Icon(Icons.playlist_play),
            ),
            ListTile(
              title: Text('Folders'),
              leading: Icon(Icons.folder_open),
            ),
            ListTile(
              title: Text('Now Playing'),
              leading: Icon(Icons.music_note),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.filter_tilt_shift),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[SONGS.SONGS(), ALBUMS.ALBUMS(), ARTISTS.ARTISTS()],
      ),
    );
  }
}
