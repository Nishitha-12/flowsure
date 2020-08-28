class Exercise {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String rating;
  final String year;
  final String duration;

  Exercise({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.rating,
    this.year,
    this.duration,
  });
}



final bestMovieList = [
  Exercise(
      id: 'tt04370323861',
      title: 'Cat Pose',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSGJEW8bw0EFVYAjJ7SGFv20d1Aro4jm_QSiw&usqp=CAU',
      description: 'An mazing exercise \n to ease cramps.',
      rating: 'Cramp Relief',
      year: '2-3 reps',
      duration: '1 min'
  ),
  Exercise(
      id: 'tt63206282434',
      title: 'Hip Rolls',
      imageUrl: 'data:image/png;base64,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',
      description: 'An mazing exercise \n to ease cramps.',
      rating: 'Pain Relief',
      year: '1-3 reps',
      duration: '30 sec'
  ),
  Exercise(
      id: 'tt1979323736',
      title: 'Walking',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRNAC_VO1apWWtXlMIbYPRZRcnCg17RmYxO6A&usqp=CAU',
      description: 'Walking is perfect if you don’t feel like doing anything too hard core. Lace up your favourite sneakers and hit the road for a stroll or a brisk walk around your estate. Even though it’s not an intense workout, you can still clock steps and torch calories by walking. ',
      rating: 'Weight loss\n Flexibility',
      year: '1-2 times a day',
      duration: '20 min'
  ),
];
