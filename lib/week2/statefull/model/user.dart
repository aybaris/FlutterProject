class User {
  final String imageUrl;
  final String title;
  final String decription;
  final String storyText;

  User({
    required this.imageUrl,
    required this.title,
    required this.decription,
    required this.storyText,
  });

  factory User.fakeItem() {
    return User(
        imageUrl: 'https://picsum.photos/536/354',
        title: 'Baris',
        decription: 'Programmer',
        storyText:
            'orem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m');
  }
}
