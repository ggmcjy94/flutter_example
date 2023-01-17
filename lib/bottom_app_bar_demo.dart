import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_first/take_picture_screen.dart';
import 'package:page_transition/page_transition.dart';

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({Key? key}) : super(key: key);

  @override
  State<BottomAppBarDemo> createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;
  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bottom App Bar Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 88),
        children: [
          SwitchListTile(
              title: const Text('Floating Action Button'),
              value: _showFab,
              onChanged: _onShowFabChanged),
          SwitchListTile(
              title: const Text('Notch'),
              value: _showNotch,
              onChanged: _onShowNotchChanged),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Floating action button position'),
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Docked - End'),
            value: FloatingActionButtonLocation.endDocked,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Docked - Center'),
            value: FloatingActionButtonLocation.centerDocked,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Floating - End'),
            value: FloatingActionButtonLocation.endFloat,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Floating - Center'),
            value: FloatingActionButtonLocation.centerFloat,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
        ],
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const TakePictureScreen(),
                          type: PageTransitionType.rightToLeft));
                });
              },
              tooltip: 'Camera',
              child: const Icon(Icons.navigate_next),
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _DemoBottomAppBar(
        fabLocation: _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle() : null,
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({Key? key, required this.fabLocation, this.shape})
      : super(key: key);

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocation = [
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: Row(
        children: [
          IconButton(
            tooltip: 'Open navigation menu',
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          if (centerLocation.contains(fabLocation)) const Spacer(),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
