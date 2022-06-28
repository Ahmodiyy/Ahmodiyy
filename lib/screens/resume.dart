import 'package:flutter/material.dart';
import 'package:portfolio/models/education_or_experience_data.dart';
import 'package:portfolio/models/education_or_experience_model.dart';

import '../constant.dart';

class Resume extends StatelessWidget {
  final BoxConstraints constraints;
  final BuildContext context;
  const Resume({super.key, required this.constraints, required this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      // mobile
      child: constraints.maxWidth < mobileWidth
          ? buildResumeAndAddImageOrNot(context)
          : buildResumeAndAddImageOrNot(context),
    );
  }
}

Widget buildResumeAndAddImageOrNot(BuildContext context) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return constraints.maxWidth < laptopWidth
          ? buildResume()
          : Stack(
              children: [
                buildResume(),
                Positioned(
                  top: 270,
                  right: 200,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/ahmodiyy.png'),
                      ),
                    ),
                  ),
                ),
              ],
            );
    },
  );
}

Widget buildResume() {
  return Column(
    children: [
      const Text(
        'Resume',
        style: constantHeaderStyle,
      ),
      sizedBoxHeightTwenty,
      const Text(
        'I started my journey at NIIT. I developed my skill on database, mobile, desktop, web and other software development lifecycle processes during these period.',
        textAlign: TextAlign.center,
      ),
      sizedBoxHeightTwenty,
      const Text(
        'Education',
        style: constantSubHeaderStyle,
      ),
      sizedBoxHeightTwenty,
      ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => buildEducationOrExperience(
              EducationOrExperienceData.educations[index]),
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: EducationOrExperienceData.educations.length),
      sizedBoxHeightTwenty,
      const Text(
        'Work Experience',
        style: constantSubHeaderStyle,
      ),
      sizedBoxHeightTwenty,
      ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => buildEducationOrExperience(
              EducationOrExperienceData.experiences[index]),
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: EducationOrExperienceData.experiences.length),
    ],
  );
}

Widget buildEducationOrExperience(EducationOrExperienceModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: Column(
          children: [
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(data.location,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 2,
            ),
            Text(
              data.dateRange,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ],
  );
}
