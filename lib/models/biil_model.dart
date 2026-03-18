class BillModel {

  final String billNo;
  final String patientName;
  final double amount;
  final DateTime date;

  BillModel({
    required this.billNo,
    required this.patientName,
    required this.amount,
    required this.date,
  });

}