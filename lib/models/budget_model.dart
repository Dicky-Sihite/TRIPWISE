class BudgetModel {
  final int days;
  final double hotel;
  final double food;
  final double transport;
  final double tour;
  final double others;

  BudgetModel({
    required this.days,
    required this.hotel,
    required this.food,
    required this.transport,
    required this.tour,
    required this.others,
  });

  double get total => (hotel + food) * days + transport + tour + others;

  double get dailyExpense => total / days;
}
