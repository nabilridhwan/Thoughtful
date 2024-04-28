class Prompt{
  final String prompt;
  final List<String> tags;

  Prompt({required this.prompt, required this.tags});

  factory Prompt.fromJson(Map<String, dynamic> json) {
    return Prompt(
      prompt: json['prompt'],
      tags: List<String>.from(json['tags'])
    );
  }
}