import 'education_or_experience_model.dart';

class EducationOrExperienceData {
  static List<EducationOrExperienceModel> educations = [
    EducationOrExperienceModel(
        title:
            'Professional diploma in Information Technology - Honors - (Software engineering)',
        dateRange: '2019 - 2022',
        location: 'NIIT'),
  ];
  static List<EducationOrExperienceModel> experiences = [
    EducationOrExperienceModel(
        title: 'Flutter Developer', dateRange: '2022', location: 'Teminla.com'),
    EducationOrExperienceModel(
        title: 'Faculty',
        dateRange: '2023 - current',
        location: 'Ogun state, Agbara'),
  ];
}
