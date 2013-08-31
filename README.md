texmemocat
==========

## Una classe  de documents per crear memoràndums senzills però complets

texMemo és una classe de documents creada per Rob Oakes i publicada al post texMemo: A Simple Memo Class for LaTeX and LyX del seu blog oak-tree. El seu principal avantatge és que és molt senzill d'utilitzar perquè només cal donar les quatre dades bàsiques (destinatari, remetent, tema i data), posar el contingut i deixar que LaTeX s'ocupi de la resta. A més, permet incloure fàcilment un logo que situa a la part superior dreta.

En un primer intent per catalanitzar el paquet ens hem adonat que l'autor no havia pensat en crear els comandaments perquè fos senzill fer una personalització als diferents idiomes. Per això de seguida vàrem veure que calia introduir canvis en aquesta classe de manera que el resultat final fos millor.

En aquest sentit hem canviat els texts fixos originals (To, From, etc) per comandaments que depenent de l'opció d'idioma de la classe automàticament apareguin traduïts (per exemple al català: \textto: Per a, \textfrom: De, etc).

Aprofitant que introduíem opcions a la classe, també hi he introduït alguns paquets que permetran millorar l'aspecte de capçaleres i peus , dels enllaços i d'altres aspectes menors. També hem introduït el títol Memoràndum (amb les traduccions per cadascuna de les tres opcions d'idioma anglès, català i castellà) que proposava l'autor del  post Writing a memo in LaTeX del blog texblog, because LaTeX matters.

[Article a cataLàTeX](http://catalatex.blogspot.com.es/2013/08/memorandums-amb-texmemocat.html)
