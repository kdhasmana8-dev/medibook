import 'package:flutter/material.dart';
import '../models/campaign_model.dart';

class CampaignViewModel extends ChangeNotifier {

  String campaignType = "SMS";
  String sendTo = "All Patients";

  TextEditingController titleController = TextEditingController();
  TextEditingController emailSubjectController = TextEditingController();
  TextEditingController headerController = TextEditingController();
  TextEditingController subHeaderController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool patientName = false;
  bool doctorName = false;
  bool phone = false;
  bool clinicName = false;

  List<CampaignModel> campaigns = [];

  void changeCampaignType(String type){
    campaignType = type;
    notifyListeners();
  }

  void changeSendTo(String value){
    sendTo = value;
    notifyListeners();
  }

  void togglePatientName(bool value){
    patientName = value;
    notifyListeners();
  }

  void toggleDoctorName(bool value){
    doctorName = value;
    notifyListeners();
  }

  void togglePhone(bool value){
    phone = value;
    notifyListeners();
  }

  void toggleClinicName(bool value){
    clinicName = value;
    notifyListeners();
  }

  void submitCampaign(){

    CampaignModel campaign = CampaignModel(
      campaignType: campaignType,
      sendTo: sendTo,
      title: titleController.text,
      emailSubject: emailSubjectController.text,
      header: headerController.text,
      subHeader: subHeaderController.text,
      message: messageController.text,
      includePatientName: patientName,
      includeDoctorName: doctorName,
      includePhone: phone,
      includeClinicName: clinicName,
    );

    campaigns.add(campaign);

    clearFields();

    notifyListeners();
  }

  void clearFields(){
    titleController.clear();
    emailSubjectController.clear();
    headerController.clear();
    subHeaderController.clear();
    messageController.clear();
  }
}