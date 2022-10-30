import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lu_cse_community/Models/person_model.dart';

class PersonModel {
  String pic;
  String name;
  String designation;
  String profileLink ;
  String mobile;
  String mail;
  String tagline;
  String speech;

  PersonModel({
    required this.pic,
    required this.name,
    required this.designation,
    required this.profileLink,
    required this.mobile,
    required this.mail,
    required this.tagline,
    required this.speech,
  });
  
}

class AllPerson{

  List<PersonModel> allPerson = [
  PersonModel(pic: "assets/about_images/t1.png", name: "Rumel M. S. Rahman Pir", designation: "Associate Professor & Head\nComputer Science & Engineering", profileLink: "www.profileLink.com", mobile: "01538412303", mail: "www.profileLink.com", tagline: "\“They are awesome & dedicated team\”", speech: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since They are awesome & dedicated team. It has survived not only five centuries."),
  PersonModel(pic: "assets/about_images/t2.png", name: "Prithwiraj Bhattacharjee", designation: "Lecturer\nComputer Science & Engineering", profileLink: "www.profileLink.com", mobile: "01538412303", mail: "www.profileLink.com", tagline: "\“They are awesome & dedicated team\”", speech: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since They are awesome & dedicated team. It has survived not only five centuries."),
  PersonModel(pic: "assets/about_images/s1.png", name: "Dipon Sutradhar", designation: "ID : 1912020093\nComputer Science & Engineering", profileLink: "www.profileLink.com", mobile: "01538412303", mail: "www.profileLink.com", tagline: "\“They are awesome & dedicated team\”", speech: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since They are awesome & dedicated team. It has survived not only five centuries."),
  PersonModel(pic: "assets/about_images/s2.png", name: "Turja Sen Das Partho", designation: "ID : 1912020131\nComputer Science & Engineering", profileLink: "www.profileLink.com", mobile: "01538412303", mail: "www.profileLink.com", tagline: "\“They are awesome & dedicated team\”", speech: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since They are awesome & dedicated team. It has survived not only five centuries."),
  PersonModel(pic: "assets/about_images/s3.png", name: "Sajid Mohammed Ikram", designation: "ID : 1912020102\nComputer Science & Engineering", profileLink: "www.profileLink.com", mobile: "01538412303", mail: "www.profileLink.com", tagline: "\“They are awesome & dedicated team\”", speech: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since They are awesome & dedicated team. It has survived not only five centuries."),

  ];


  List<PersonModel> getPersons () => allPerson;

}
