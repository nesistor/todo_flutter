class Team {
  String id;
  String name;
  List<String> members; // Lista identyfikatorów uczestników zespołu UUID

  Team({required this.id, required this.name, required this.members});
}

class TeamMember {
  String id;
  String name;
  // Dodaj inne pola, jeśli potrzebujesz, np. e-mail, zdjęcie profilowe, itp.

  TeamMember({required this.id, required this.name});
}
