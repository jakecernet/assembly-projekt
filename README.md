# Prikazovalnik svetlosti, napisan v Assemblerju za Arduino Uno.

<br>

# O projektu

#### Projekt je bil narejen v sklopu predmeta Laboratorijske vaje na Vegovi. Svetlost se prikazuje v obliki številk od 0 do 9 na spodaj prikazanem zaslonu. Zraven je priključen tudi LCD zaslon, ki prikazuje besedilo <br> "Brightness -->".

<br>

# Kako deluje?

#### Program `photoresisotr.asm` prebere vrednost svetlosti, ki jo zazna fotorezistor in jo pretvori v številko. To številko nato uporabi program `computer.asm`, ki izvede ustrezno kodo iz `display.asm` s katero prikaže ustrezno številko na zaslonu. Koda za prikaz besedila na LCD zaslonu pa se nahaja v `LCD.asm`.

<br>

# Konfiguracija

#### Za delovanje je potrebno povezati Arduino Uno z zaslonom in fotorezistorjem kot je prikazano na spodnji sliki ali pa kliknite [tukaj](https://www.tinkercad.com/things/igxp6hfEISx-fantastic-jaagub). (Povezava z LCD zaslonom ni obvezna, zato je ni na sliki)

<br>

<img src="scheme.png" 
 style="margin-left: 100px;">
