import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import 'Intro.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < mobileWidth) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('Ahmodiyy'),
                ),
                endDrawer: Drawer(
                  width: 200,
                  backgroundColor: Colors.black,
                  child: ListView(
                    children: const [
                      Icon(Icons.abc),
                      Icon(Icons.abc),
                    ],
                  ),
                ),
                body: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Intro(
                            constraints: constraints,
                          ),
                        ],
                      ),
                    );
                  },
                )),
          );
        }
        return Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text('Ahmodiyy'),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.abc),
                        ),
                      ],
                    ),
                    Intro(constraints: constraints),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
