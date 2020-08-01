enum BookStatus { any, ongoing, completed }

extension BookStatusExtension on BookStatus {
  bool toActive() {
    switch (this) {
      case BookStatus.any:
        return null;
      case BookStatus.ongoing:
        return true;
      case BookStatus.completed:
        return false;
      default:
        return null;
    }
  }

  String toStr() {
    switch (this) {
      case BookStatus.any:
        return 'Any';
      case BookStatus.ongoing:
        return 'Ongoing';
      case BookStatus.completed:
        return 'Completed';
      default:
        return 'Any';
    }
  }
}
