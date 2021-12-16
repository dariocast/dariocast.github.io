import 'package:dariocast/models/project_model.dart';
import 'assets.dart';

final List<Project> projects = [
  Project(
      name: 'Quaderno Torneo Android',
      image: Assets.quaderno,
      darkImage: Assets.quaderno,
      description:
          'Quaderno Torneo è l\'app Android per la gestione, i risultati, le classifiche e le statistiche live del torneo ACG a Piano di Sorrento',
      link:
          'https://play.google.com/store/apps/details?id=it.dariocast.quadernotorneo'),
  Project(
      name: 'Quaderno Torneo iOS',
      image: Assets.quaderno,
      darkImage: Assets.quaderno,
      description:
          'Quaderno Torneo è l\'app iOS per la gestione, i risultati, le classifiche e le statistiche live del torneo ACG a Piano di Sorrento',
      link: 'https://apps.apple.com/us/app/quaderno-torneo/id1575877834'),
  Project(
      name: 'Torneo ACG',
      image: Assets.torneo,
      darkImage: Assets.torneobianco,
      description:
          'Torneo ACG mostra i risultati, le classifiche e le statistiche live del torneo ACG a Piano di Sorrento',
      link: 'https://torneoacg.it'),
  Project(
      name: 'FantaTorneo ACG',
      image: Assets.torneo,
      darkImage: Assets.torneobianco,
      description:
          'La piattaforma gestiste un fantacalcio di giocatori di un torneo personalizzato',
      link: 'https://fanta.torneoacg.it'),
  Project(
      name: 'Quis ut Deus',
      image: Assets.quisutdeus,
      darkImage: Assets.quisutdeus,
      description:
          'Quis ut Deus mette a disposizione di tutti i podcast e le registrazioni da San Michele Arcangelo a Piano di Sorrento, per non perdere nessun momento proposto',
      link:
          'https://play.google.com/store/apps/details?id=it.dariocast.qud&hl=en_US'),
  Project(
      name: 'Graphics',
      image: Assets.kermit,
      darkImage: Assets.kermit,
      description:
          'Una raccolta di loghi e immagini che nel tempo ho prodotto per diverse commissioni',
      link: 'https://dariocast.github.io/artwork'),
];
