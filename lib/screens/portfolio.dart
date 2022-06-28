import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/screens/resume.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  backgroundColor: Colors.white,
                  child: ListView(
                    children: [
                      buildGithubIcon(),
                      buildTwitterIcon(),
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
                          Resume(
                            constraints: constraints,
                            context: context,
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
                child: AdaptiveColumn(
                  children: [
                    AdaptiveContainer(
                      columnSpan: 12,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Ahmodiyy',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          buildGithubIcon(),
                          buildTwitterIcon(),
                        ],
                      ),
                    ),
                    AdaptiveContainer(
                      columnSpan: 12,
                      child: Intro(constraints: constraints),
                    ),
                    AdaptiveContainer(
                      columnSpan: 12,
                      child: Resume(constraints: constraint, context: context),
                    ),
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

Widget buildTwitterIcon() {
  return IconButton(
    onPressed: () => launchUrl(Uri.parse('https://twitter.com/Ahmodiyy')),
    icon: const Icon(FontAwesomeIcons.twitter),
  );
}

Widget buildGithubIcon() {
  return IconButton(
    onPressed: () => launchUrl(Uri.parse('https://github.com/Ahmodiyy/')),
    icon: const Icon(FontAwesomeIcons.github),
  );
}
