class Question{
  late final int id, answer;
  late final String question;
  late final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Where is Okan University Campus?",
    "options": ['Umraniye', 'Uskudar', 'Tuzla', 'Kadikoy'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "Which country is not in Eurpoean Union?",
    "options": ['Denmark', 'Spain', 'The Czech Republic', 'England'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "Which coding language does Flutter work with?",
    "options": ['Java', 'Dart', 'C++', 'Python'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Where is Germany?",
    "options": ['America', 'Europe', 'Africa', 'Asia'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "What is the name of Turkish Electric Car?",
    "options": ['TOGG', 'Kia', 'Tesla', 'BMW'],
    "answer_index": 0,
  }
];