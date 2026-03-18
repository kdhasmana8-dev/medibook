class CampaignModel {

  String? campaignType;
  String? sendTo;
  String? title;
  String? emailSubject;
  String? header;
  String? subHeader;
  String? message;
  bool includePatientName;
  bool includeDoctorName;
  bool includePhone;
  bool includeClinicName;

  CampaignModel({
    this.campaignType,
    this.sendTo,
    this.title,
    this.emailSubject,
    this.header,
    this.subHeader,
    this.message,
    this.includePatientName = false,
    this.includeDoctorName = false,
    this.includePhone = false,
    this.includeClinicName = false,
  });
}