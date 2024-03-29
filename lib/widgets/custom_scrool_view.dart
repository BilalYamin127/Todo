import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomScroolView extends StatefulWidget {
  const CustomScroolView({super.key});

  @override
  State<CustomScroolView> createState() => _CustomScroolViewState();
}

class _CustomScroolViewState extends State<CustomScroolView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: true,
            pinned: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Sliver App Bar',
                style: TextStyle(color: Colors.black),
              ),
              background: Image.asset('assets/images/home_profile.png'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
                crossAxisSpacing: 1.1,
                mainAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.brown,
                    child: Center(child: Text('container of child $index')),
                  );
                },
                childCount: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
