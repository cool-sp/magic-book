enum BookGenre {
  action,
  alchemy,
  comedy,
  cooking,
  crafting,
  esports,
  fantasy,
  femaleProtagonist,
  kingdomBuilding,
  mature,
  modernSetting,
  mystery,
  politicalIntrigue,
  postApocalyptic,
  romance,
  sciFi,
  superpowers,
  thriller,
  tragedy,
  virtualReality,
  wuxia,
  xianxia,
  xuanhuan,
}

extension BookGenreExtension on BookGenre {
  String toStr() {
    switch (this) {
      case BookGenre.action:
        return 'Action';
      case BookGenre.alchemy:
        return 'Alchemy';
      case BookGenre.comedy:
        return 'Comedy';
      case BookGenre.cooking:
        return 'Cooking';
      case BookGenre.crafting:
        return 'Crafting';
      case BookGenre.esports:
        return 'Esports';
      case BookGenre.fantasy:
        return 'Fantasy';
      case BookGenre.femaleProtagonist:
        return 'Female Protagonist';
      case BookGenre.kingdomBuilding:
        return 'Kingdom Building';
      case BookGenre.mature:
        return 'Mature';
      case BookGenre.modernSetting:
        return 'Modern Setting';
      case BookGenre.mystery:
        return 'Mystery';
      case BookGenre.politicalIntrigue:
        return 'Political Intrigue';
      case BookGenre.postApocalyptic:
        return 'Post-apocalyptic';
      case BookGenre.romance:
        return 'Romance';
      case BookGenre.sciFi:
        return 'Sci-fi';
      case BookGenre.superpowers:
        return 'Superpowers';
      case BookGenre.thriller:
        return 'Thriller';
      case BookGenre.tragedy:
        return 'Tragedy';
      case BookGenre.virtualReality:
        return 'Virtual Reality';
      case BookGenre.wuxia:
        return 'Wuxia';
      case BookGenre.xianxia:
        return 'Xianxia';
      case BookGenre.xuanhuan:
        return 'Xuanhuan';
      default:
        return 'Action';
    }
  }
}
