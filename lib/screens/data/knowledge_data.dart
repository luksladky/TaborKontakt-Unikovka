import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:photo_view/photo_view.dart';
import 'package:markdown/markdown.dart' as md;

typedef FactoryFunc = Widget Function();

class KnowledgePageData {
  String title;
  FactoryFunc content;

  KnowledgePageData(this.title, this.content);
}

List<KnowledgePageData> knowledgeDatabase = [
  KnowledgePageData(
      "Brailovo písmo", () => const FullScreenImage("assets/brailovo_pismo.png")),
  KnowledgePageData("Fyzikální veličiny",
      () => const FullScreenImage("assets/fyzikalni_veliciny.png")),
  KnowledgePageData("Informace o lodi", buildInfoOLodi),
  KnowledgePageData(
      "Junácký kříž", () => const FullScreenImage("assets/junacky_kriz.png")),
  KnowledgePageData("Morseovka", () => const FullScreenImage("assets/morseovka.png")),
  KnowledgePageData("Periodická tabulka prvků",
      () => const FullScreenImage("assets/periodicka_soustava.png")),
  KnowledgePageData(
      "Posunutá abeceda", () => const FullScreenImage("assets/posunuta_abeceda.png")),
  KnowledgePageData("Semafor", () => const FullScreenImage("assets/semafor.png")),
  KnowledgePageData("Sluneční soustava",
      () => const FullScreenImage("assets/slunecnisoustava.jpg")),
];

class FullScreenImage extends StatelessWidget {
  final String assetPath;

  const FullScreenImage(this.assetPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: PhotoView(
        backgroundDecoration: const BoxDecoration(color: Colors.white),
        imageProvider: AssetImage(assetPath),
      ),
    );
  }
}

Widget buildInfoOLodi() => Markdown(
      data: r'''
-   Název: Starlifter
-   Třída a typ: Osobní transport, typ XL-20000
-   Délka: 500 metrů
-   Maximální rychlost: 0,4 světelné rychlosti (0,4c)
-   Zrychlení: 0,1c/3 roky
-   Pohon: Hybridní hyperionický iontový pohon a gravitační impulzní motory
-   Kapacita pasažérů: 20 000 osob
-   Kapacita nákladu: 5000 tun
-   Vybavení a služby:
	-   Široká škála kajut různých tříd a velikostí
	-   Restaurace a kavárny s různými kulinářskými specialitami
	-   Obchodní centrum a obchody s luxusním zbožím    
	-   Velké zábavní a rekreační areály včetně bazénů, fitness center a zahrad
	-   Nemocnice a zdravotnická zařízení s pokročilými diagnostickými a léčebnými technologiemi
-   Obranné systémy: Silné energetické štíty, protiraketové systémy a plazmové dělostřelectvo pro ochranu posádky a pasažérů
-   Předpokládaná životnost: 500 let
-   Posádka: 400 členů posádky
-   Navigační systémy: Pokročilé mezigalaktické navigační systémy s umělou inteligencí a rozsáhlou databází kosmických map
-   Komunikační systémy: Vysokorychlostní subprostorové komunikační systémy s galaktickým pokrytím a možností komunikace na dlouhé vzdálenosti
-   Palivový systém: Vyspělý antihmotový reaktor spolu s kvantovými energetickými generátory
-   Záchranné čluny: 20 velkých záchranných člunů s kapacitou přes 100 osob každý, vybavených vlastním pohonem a základními zdravotnickými zařízeními
-   Posádka:
	-   Kapitánka Aisha Patel
	-   První důstojnice Rachel Sullivan
	-   Admirálka Alexandra Mitchell
	-   Hlavní lékař Jonathan Lawson
	-   Inženýrka Olivia Thompson
	-   Komandér Malik Patel
      ''',
      extensionSet: md.ExtensionSet(
        md.ExtensionSet.gitHubFlavored.blockSyntaxes,
        [md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
      ),
    );
