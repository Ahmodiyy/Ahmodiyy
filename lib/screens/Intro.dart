import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

class Intro extends StatelessWidget {
  final BoxConstraints constraints;
  const Intro({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      // mobile
      child: constraints.maxWidth < mobileWidth
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 100,
                  ),
                  child: buildImage(),
                ),
                buildIntro(
                  TextAlign.center,
                  constraints,
                ),
              ],
            )
          // desktop
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: buildImage(),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildIntro(TextAlign.left, constraints),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

Widget buildImage() {
  return Image.asset('images/ahmodiyy.png');
}

Widget buildIntro(TextAlign textAlign, BoxConstraints constraints) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        textAlign: textAlign,
        text: const TextSpan(children: [
          TextSpan(
            text: 'Hi, I\'m Ahmod and I\'m a ',
            style: constantHeaderStyle,
          ),
          TextSpan(text: 'Flutter Developer', style: constantSubHeaderStyle),
        ]),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'I\'m a flutter developer based in Nigeria, I have a strong background in java and I specialize in creating cross platform app using flutter. I am open for new opportunity and interesting project.',
        textAlign: textAlign,
      ),
      constraints.maxWidth < mobileWidth
          ? Row(
              children: [
                Expanded(
                  child: buildButton(
                    actionText: 'Contact me',
                    action: () =>
                        launchUrl(Uri.parse('https://twitter.com/Ahmodiyy')),
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: buildButton(
                    actionText: 'Check my work',
                    action: () =>
                        launchUrl(Uri.parse('https://github.com/Ahmodiyy/')),
                    backgroundColor: Colors.white,
                    textColor: const Color(0xff676768),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Flexible(
                  child: buildButton(
                    actionText: 'Contact me',
                    action: () =>
                        launchUrl(Uri.parse('https://twitter.com/Ahmodiyy')),
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: buildButton(
                    actionText: 'Check my work',
                    action: () =>
                        launchUrl(Uri.parse('https://github.com/Ahmodiyy/')),
                    backgroundColor: Colors.white,
                    textColor: const Color(0xff676768),
                  ),
                ),
              ],
            ),
    ],
  );
}

Widget buildButton(
    {required String actionText,
    required Function action,
    required Color backgroundColor,
    required Color textColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 20,
    ),
    child: ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(10),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(20),
        ),
      ),
      onPressed: () {
        action();
      },
      child: Text(
        actionText,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ),
  );
}
