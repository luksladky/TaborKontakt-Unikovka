import 'package:kontakt_unikovka/state/cipher_manager.dart';

List<Cipher> buildCipherData() => [
      Cipher( // SMYCOVANI
          password: "todo", //TODO
          coordinates: "Vyjděte z tábořiště směrem ke splavu, pokračujte po cestě.",
          hint: ""),
      Cipher( // SYSTEM KONTROLY
          password: "todo", //TODO
          coordinates: "Pokračujte na silnici, jděte dolů a za zeleným mostem doleva. Pokračujte pořád po zelené. Pozor, občas jde špatně vidět. Nahoře u lesní školky vlevo. Na další odbočce je na stromě značka a žluté šipky. Jděte vlevo. Za hromadou klád doleva, po poli kolem lesa. Koukejte na zelené značky, ale moc jich tam není. Jedna je na pahýlu stromu se dvěma červenými pruhy. Za tím, pořád podél pole, je mladý listnatý lesík, běžte do něj.",
          hint: ""),
      Cipher( // SEMAFOR
          password: "kmotr",
          coordinates: "Pokračujte po malé pěšince podél pole, ignorujte cesty pro traktory. Je to pořád po zelené, ale není tam příliš často. Zanoří se do lesa a u krmelce do houští. U rozcestí pokračujte po zelené na Senohradský mlýn. Sejděte dolů k řece. Pozor, dívejte se na druhý břeh.",
          hint: "Tady be se hodilo znat morseovku."),
      Cipher( // JIDLO
          password: "todo", //TODO
          coordinates: "Nyní pokračujte po červené směr Kraví Hora. Přejděte přes most na druhou stranu řeky, kolem chatek. Značka je na skříni s elektro rozvody. Jděte až nahoru ke zřícenině. Zde najdete schované jídlo.",
          hint: "Jidlo je u posezení se stolem, za pahylem zlomeneho stromu."),
      Cipher( // LANOVA SIT
          password: "todo", //TODO
          coordinates: "Pokračujte dál po červené. Na rozcestí u \"hradu\" se dejte doprava po cyklostezce. Na další křižovatce jsou na zemi bílé šipky, jděte vlevo. V zatáčce u žebříku a klád pokračujte rovně lesní cestou až k posedu."
      ),
      Cipher( // OBVOD
      password: "todo", //TODO
      coordinates: "Běžte dolů do houští, pak vyschlým korytem potoka (roklí), dokud nenarazíte na potok. Běžte po proudu potokem nebo podél něj, ale mějte ho na dohled. Další cíl bude v potoku."
      ),
      Cipher( // PLIZENI KOLEM STRAZI
          password: "kadmium",
          coordinates: "Pokračujte dál potokem až k řece. Téměř na konci je spadlý strom, je nutné ho podlézt a jít pěšinkou v houští. Pokračujte doprava až k tábořišti. Pořád rovně a nezapomenout odbočit vlevo. Okolo kosmodromu je hlídka, nesmí vás vidět. Dveře nejdou otevřít, dokud nedostanete pokyn."
      )
];
