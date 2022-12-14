import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const String page1 = "Order";
const String page2 = "Bill";
const String page3 = "Profile";
const String title = "Food Menu";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _page1 = Page1(changePage: _changeTab);
    _page2 = const Page2();
    _page3 = Page3(changePage: _changeTab);
    _pages = [_page1, _page2, _page3];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _changeTab(index);
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: page1,
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: page2,
              icon: Icon(Icons.assignment),
            ),
            BottomNavigationBarItem(
              label: page3,
              icon: Icon(Icons.person),
            ),
          ]),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              _navigationItemListTitle(page1, 0),
              _navigationItemListTitle(page2, 1),
              _navigationItemListTitle(page3, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key, required this.changePage}) : super(key: key);
  final void Function(int) changePage;
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Category',
                  maxLines: 20,
                  style: TextStyle(fontSize: 25.0),
                )
              ]
            ),
          ),
          Container(
            child: Row(
              children: [
                Image.asset('img/food.jpg'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Expanded(
            child: Text(
              'Lorem ipsum dolor sit amet consectetur, adipisicing elit.\n Tenetur odio quasi alias necessitatibus soluta, repudiandae quaerat eius recusandae at, quo, \n perspiciatis maiores suscipit omnis! Officia pariatur voluptatibus eaque impedit labore?',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ElevatedButton(
            onPressed: () => changePage(0), 
            child:  const Text('Add'))
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page2 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key, required this.changePage}) : super(key: key);
  final void Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$page3 Page', style: Theme.of(context).textTheme.headline6),
          ElevatedButton(
            onPressed: () => changePage(0),
            child: const Text('Switch to Home Page'),
          )
        ],
      ),
    );
  }
}