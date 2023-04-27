class AppwriteConstants {
  static const String databaseId = '643f51910922bbb98e4b';
  static const String projectId = '643cc57a8234711038d3';
  static const String endPoint = 'http://10.0.2.2:80/v1';

  static const String usersCollection = '6446e2c67931f4b823d9';
  static const String postsCollection = '6449f3a0c36cf1a54e2b';
  static const String notificationsCollection = '644a608f1283fead9f66';

  static const String imagesBucket = '63cbdab48cdbccb6b34e';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
