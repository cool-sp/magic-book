abstract class HttpExecutable<T> {
  String getHost() {
    return 'https://www.wuxiaworld.com';
  }

  String getPath() {
    return getHost() + getSubPath();
  }

  // functions needs to be overridden
  String getSubPath();
  Future<T> execute();
}
