class Post {
  String? id;
  String? user;
  String? imageUser;
  String? date;

  String? description;
  String? image;
  bool isFav;
  int? likes;
  Map<String, String>? comments;

  Post(
      {required this.id,
      required this.description,
      this.isFav = false,
      this.image = '',
      required this.user,
      required this.date,
      required this.imageUser,
      this.likes = 0});

  static List<Post> PostList() {
    return [
      Post(
          id: '01',
          description: 'Messi Messi en cara Messi',
          user: 'Juanito Banana',
          imageUser: '',
          date: '8 de marzo',
          likes: 12),
      Post(
          id: '02',
          description: 'Messi Messi en cara Messi',
          user: 'Valeria Fin',
          imageUser: '',
          date: '1 d',
          likes: 14),
      Post(
          id: '03',
          description: 'Goool Gooool Goool',
          user: 'Dora exploradora',
          imageUser: '',
          date: '23 de abril',
          likes: 1),
      Post(
          id: '04',
          description: 'Goool Gooool Goool',
          user: 'Daniel Contreras',
          imageUser: '',
          date: '19 h',
          likes: 3),
      Post(
          id: '05',
          description: 'Goool Gooool Goool',
          image: 'assets/images/bob.jpg',
          user: 'Rosa Lia',
          imageUser: '',
          date: '14 de abril',
          likes: 23),
      Post(
          id: '06',
          description: '*Back ground Sound',
          user: 'Bad Bunny',
          imageUser: '',
          date: '12 h',
          likes: 1),
      Post(
          id: '07',
          description: 'Tururururururururu',
          user: 'El Benito',
          imageUser: '',
          date: '2 d',
          likes: 3),
    ];
  }
}
