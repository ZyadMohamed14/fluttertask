extension RepeatList<T> on List<T> {
  List<T> repeat(int times) {
    List<T> repeatedList = [];
    for (int i = 0; i < times; i++) {
      repeatedList.addAll(this);
    }
    return repeatedList;
  }
}