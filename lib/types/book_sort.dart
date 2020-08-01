enum BookSort {
  sortByName,
  sortByPopular,
  sortByChapters,
  sortByNew,
  sortByRating,
}

extension BookSortExtension on BookSort {
  String toStr() {
    switch (this) {
      case BookSort.sortByName:
        return 'Name';
      case BookSort.sortByPopular:
        return 'Popular';
      case BookSort.sortByChapters:
        return 'Chapters';
      case BookSort.sortByNew:
        return 'New';
      case BookSort.sortByRating:
        return 'Rating';
      default:
        return 'Name';
    }
  }
}
