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
      id: '121',
      title: 'Pelvic Tucks',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSCZt9VS7hvJpPH7Hgd7uurYybWSkvq5JnXbA&usqp=CAU',
      description: 'Lie on the floor and place your feet a little wider than hip-width apart. Slowly lift your hips off the floor and up, then gently lower down one vertebra at time. Lift and lower slowly for one to two minutes. Why it works: “Getting the blood to circulate to the lower back muscles, while also gently strengthening them, is a great way to relieve lower back pain,” says Becker.',
      rating: 'Cramp Relief',
      year: '2-3 reps',
      duration: '2 min'
  ),
  Exercise(
      id: '122',
      title: 'Seated Quad Extension \n on Chair',
      imageUrl: 'https://i.dailymail.co.uk/1s/2019/02/10/19/9634900-6688673-image-a-42_1549827394847.jpg',
      description: 'EXHALE: Keeping left foot planted and upper body still, extend the right leg (bending from the knee) until it is parallel with the floor. Hold here for 2 counts and then (optional) pulse up and down for 3 counts (not shown) .INHALE Bend knee to lower right leg back to floor to complete one rep. Complete all reps on one side and switch.',
      rating: 'Stretching/Toning',
      year: '1-3 reps',
      duration: '2 min'
  ),
  Exercise(
      id: '123',
      title: 'Side Leag Raise',
      imageUrl: 'https://i.pinimg.com/originals/a0/a0/5a/a0a05a64b91694869ff463ec5b9ffb05.png',
      description: 'An mazing exercise \n to ease cramps.',
      rating: 'Toning/ Pain Relief',
      year: '2-3 reps',
      duration: '2 min'
  ),
];
