:-style_check(- discontiguous).

%-------------------------------------------------------------------------------
% Aufgabe 1
%-------------------------------------------------------------------------------
% Semester 1 und 2
modul(assIT).
bezeichnung(assIT, 'Assessment IT').
ects(assIT, 60).
semester(assIT, 1).
semester(assIT, 2).

% Semester 3
modul(sisy1).
bezeichnung(sisy1, 'Signale & Systeme 1').
voraussetzung(sisy1, assIT).
ects(sisy1, 4).
semester(sisy1, 3).

modul(ood).
bezeichnung(ood, 'Objektorientiertes Design').
voraussetzung(ood, assIT).
ects(ood, 4).
semester(ood, 3).

modul(tin1).
bezeichnung(tin1, 'Technische Informatik').
voraussetzung(tin1, assIT).
ects(tin1, 4).
semester(tin1, 3).

% Semester 4
modul(dnet).
bezeichnung(dnet, 'Dot-net-Technologie').
voraussetzung(dnet, ood).
ects(dnet, 4).
semester(dnet, 4).

modul(sep).
bezeichnung(sep, 'Software-Entwicklungspraxis').
voraussetzung(sep, ood).
ects(sep, 4).
semester(sep, 4).

modul(swe).
bezeichnung(swe, 'Software Engineering').
voraussetzung(swe, ood).
ects(swe, 4).
semester(swe, 4).

modul(vsy).
bezeichnung(vsy, 'Verteilte Systeme').
voraussetzung(vsy, ood).
ects(vsy, 4).
semester(vsy, 4).

modul(reesy).
bezeichnung(reesy, 'Entwurf und Realis. von Embed. Sys.').
voraussetzung(reesy, tin1).
ects(reesy, 4).
semester(reesy, 4).

modul(tin2).
bezeichnung(tin2, 'Technische Informatik 2').
voraussetzung(tin2, tin1).
ects(tin2, 4).
semester(tin2, 4).

% Semester 5
modul(dd1).
bezeichnung(dd1, 'Digitale Datenübert. 1').
voraussetzung(dd1, sisy1).
ects(dd1, 4).
semester(dd1, 5).

modul(jff).
bezeichnung(jff, 'Java für Fortgesch.').
voraussetzung(jff, swe).
ects(jff, 4).
semester(jff, 5).

modul(cgr).
bezeichnung(cgr, 'Computergrafik').
voraussetzung(cgr, tin2).
ects(cgr, 4).
semester(cgr, 5).

modul(pra).
bezeichnung(pra, 'Prozessorarchitekturen').
voraussetzung(pra, tin2).
ects(pra, 4).
semester(pra, 5).

modul(mc).
bezeichnung(mc, 'Mikrokontr.').
voraussetzung(mc, tin2).
ects(mc, 4).
semester(mc, 5).

modul(psp).
bezeichnung(psp, 'Programmiersprachen').
voraussetzung(psp, assIT).
ects(psp, 4).
semester(psp, 5).

% Semester 6
modul(dd2).
bezeichnung(dd2, 'Digitale Datenübert. 2').
voraussetzung(dd2, dd1).
ects(dd2, 4).
semester(dd2, 6).

modul(eesy).
bezeichnung(eesy, 'Embedded Systems').
voraussetzung(eesy, pra).
ects(eesy, 4).
semester(eesy, 6).

%-------------------------------------------------------------------------------
% Aufgabe 2
%-------------------------------------------------------------------------------
alleVoraussetzungen(X, Y) :- voraussetzung(X, Y).
alleVoraussetzungen(X, Y) :- voraussetzung(X, Z), alleVoraussetzungen(Z, Y).

%-------------------------------------------------------------------------------
% Aufgabe 3
%-------------------------------------------------------------------------------
nachfolger(X, Y) :- voraussetzung(Y, X).
alleNachfolger(X, Y) :- alleVoraussetzungen(Y, X).

%-------------------------------------------------------------------------------
% Aufgabe 4
%-------------------------------------------------------------------------------
waehlbar(X, Y) :- setof(Z, semester(Z, X), Y).

%-------------------------------------------------------------------------------
% Aufgabe 5
%-------------------------------------------------------------------------------
ectslist([], S) :- S is 0.
ectslist([X | Y], S) :- ectslist(Y, S1), ects(X, Z), S is S1 + Z.

