class AppwriteConstants {
  static const String databaseId = '646eee8d80709917123a';
  static const String projectId = '646ee13f559754e8a428';
  // static const String endPoint = 'http://10.0.2.2:80/v1';
  static const String endPoint = 'https://cloud.appwrite.io/v1';
  // static const String endPoint = 'http://localhost:80/v1';

  static const String usersCollection = '646eefc58805e15b316f';
  static const String postsCollection = '646ef1fbcabe9d95d3d7';
  static const String notificationsCollection = '646ef245df6a0ffdb7d6';

  static const String imagesBucket = '646eeedd354acd6d6a0b';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
