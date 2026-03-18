class QuickBillModel {

  String patientName;
  String mobile;
  String email;
  String treatment;
  String medicine;

  double fees;
  double discount;

  QuickBillModel({
    this.patientName = "",
    this.mobile = "",
    this.email = "",
    this.treatment = "",
    this.medicine = "",
    this.fees = 0,
    this.discount = 0,
  });

  double get total => fees - discount;
}