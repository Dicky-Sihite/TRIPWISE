class HistoryItem {
  final DateTime timestamp;
  final int days;
  final double hotel;
  final double food;
  final double transport;
  final double tour;
  final double others;
  final double total;

  HistoryItem({
    required this.timestamp,
    required this.days,
    required this.hotel,
    required this.food,
    required this.transport,
    required this.tour,
    required this.others,
  }) : total = (hotel + food) * days + transport + tour + others;
}

class HistoryData {
  static final List<HistoryItem> _history = [];

  static void addHistory(HistoryItem item) {
    _history.insert(0, item); // tambah di paling atas
  }

  static List<HistoryItem> get history => _history;
}
