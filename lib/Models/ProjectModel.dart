import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/Constants.dart';

class ProjectModel extends GetxController {
  RxBool showDetails = false.obs;
  Image image;
  RxString link = ''.obs,
      ios_link = ''.obs,
      site = ''.obs,
      label = ''.obs,
      description = ''.obs,
      detail = ''.obs,
      devLang = ''.obs;
  RxList tags = [].obs, platform = [].obs;

  ProjectModel({
    required this.showDetails,
    required this.image,
    required this.label,
    required this.link,
    required this.ios_link,
    required this.site,
    required this.devLang,
    required this.description,
    required this.detail,
    required this.platform,
    required this.tags,
  });

  factory ProjectModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final docData = documentSnapshot.data()!;
    return ProjectModel(
      showDetails: false.obs,
      image: Image.asset(ImageConstants.projectsPath + docData['icon']),
      label: docData['label'].toString().obs,
      link: ((docData['link'] ?? '').toString()).obs,
      ios_link: ((docData['ios_link'] ?? '').toString()).obs,
      site: ((docData['site'] ?? '').toString()).obs,
      devLang: docData['dev'].toString().obs,
      description: docData['description'].toString().obs,
      detail: (docData['app_detail'] ?? '').toString().obs,
      platform: [docData['platform'].toString()].obs,
      tags: [docData['status'].toString()].obs,
    );
  }
}
