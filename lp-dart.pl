% Origens da linguagem de programação Java segundo Sebesta e Wikipedia
% baseadaEm(dart, c).
baseadaEm(dart, cSharp).
baseadaEm(dart, earlang).
% baseadaEm(dart, java).
baseadaEm(dart, javaScript).
baseadaEm(dart, kotlin).
baseadaEm(dart, ruby).
baseadaEm(dart, smalltalk).
baseadaEm(dart, strongtalk).
baseadaEm(dart, typescript).
baseadaEm(algol, fortran).
baseadaEm(ada, pascal).
% baseadaEm(awk, c).
baseadaEm(awk, snobol).
baseadaEm(b, bcpl).
baseadaEm(bcpl, cpl).
baseadaEm(c, b).
baseadaEm(c, algol).
baseadaEm(cpp, c).
baseadaEm(cpp, simula).
% baseadaEm(cSharp, cpp).
baseadaEm(cSharp, java).
baseadaEm(earlang, lisp).
baseadaEm(earlang, plex).
baseadaEm(earlang, prolog).
baseadaEm(eiffel, ada).
% baseadaEm(eiffel, simula).
baseadaEm(java, cpp).
baseadaEm(javaScript, perl).
% baseadaEm(kotlin, cSharp).
baseadaEm(kotlin, eiffel).
baseadaEm(kotlin, gosu).
baseadaEm(kotlin, ml).
% baseadaEm(kotlin, java).
baseadaEm(kotlin, python).
baseadaEm(kotlin, scala).
baseadaEm(kotlin, swift).
% baseadaEm(modula, pascal).
% baseadaEm(pascal, algol).
baseadaEm(perl, awk).
baseadaEm(python, modula).
baseadaEm(python, ansic).
baseadaEm(ruby, basic).
baseadaEm(ruby, dylan).
baseadaEm(ruby, lua).
% baseadaEm(simula, algol).
% baseadaEm(smalltalk, simula).
% baseadaEm(strongtalk, smalltalk).
baseadaEm(strongtalk, self).

% Paradigmas das linguagens de programação acima segundo a Wikipedia.
paradigma(dart, funcional).
paradigma(dart, imperativa).
paradigma(dart, oo).
paradigma(dart, reflexiva).
paradigma(ada, estruturada).
paradigma(ada, imperativa).
paradigma(ada, oo).
paradigma(algol, procedural).
paradigma(algol, imperativa).
paradigma(algol, estruturada).
paradigma(awk, procedural).
paradigma(basic, procedural).
paradigma(basic, oo).
paradigma(bcpl, procedural).
paradigma(bcpl, estruturada).
paradigma(cpp, procedural).
paradigma(cpp, funcional).
paradigma(cpp, oo).
paradigma(cpp, generica).
paradigma(cpp, modular). 
paradigma(c, imperativa).
paradigma(c, procedural).
paradigma(cpl, procedural).
paradigma(cpl, imperativa).
paradigma(cpl, estruturada).
paradigma(cpl, funcional).
paradigma(cSharp, estruturada).
paradigma(cSharp, oo).
paradigma(cSharp, imperativa).
paradigma(cSharp, funcional).
paradigma(cSharp, reflexiva).
paradigma(cSharp, concorrente).
paradigma(cSharp, oe). % oe = orientada a eventos
paradigma(dylan, funcional).
paradigma(dylan, oo).
paradigma(earlang, concorrente).
paradigma(earlang, funcional).
paradigma(eiffel, oo).
paradigma(eiffel, generica).
paradigma(eiffel, concorrente).
paradigma(fortran, estruturada).
paradigma(fortran, imperativa).
paradigma(fortran, procedural).
paradigma(fortran, oo).
paradigma(fortran, generica).
paradigma(java, generica).
paradigma(java, oo).
paradigma(java, imperativa).
paradigma(java, reflexiva).
paradigma(javaScript, funcional).
paradigma(javaScript, oe).
paradigma(javaScript, imperativa).
paradigma(kotlin, oo).
paradigma(kotlin, funcional).
paradigma(kotlin, imperativa).
paradigma(kotlin, estruturada).
paradigma(kotlin, generica).
paradigma(kotlin, reflexiva).
paradigma(kotlin, concorrente).
paradigma(lisp, funcional).
paradigma(lisp, procedural).
paradigma(lisp, reflexiva).
paradigma(lua, imperativa).
paradigma(lua, funcional).
paradigma(lua, oo).
paradigma(lua, procedural).
paradigma(ml, funcional).
paradigma(ml, imperativa).
paradigma(modula, imperativa).
paradigma(modula, estruturada).
paradigma(modula, procedural).
paradigma(modula, modular).
paradigma(modula, concorrente).
paradigma(pascal, imperativa).
paradigma(pascal, estruturada).
paradigma(plex, procedural).
paradigma(plex, imperativa).
paradigma(prolog, logica).
paradigma(perl, funcional).
paradigma(perl, imperativa).
paradigma(perl, oo).
paradigma(perl, reflexiva).
paradigma(python, funcional).
paradigma(python, imperativa).
paradigma(python, oo).
paradigma(python, estruturada).
paradigma(python, reflexiva).
paradigma(ruby, funcional).
paradigma(ruby, imperativa).
paradigma(ruby, oo).
paradigma(ruby, reflexiva).
paradigma(scala, concorrente).
paradigma(scala, funcional).
paradigma(scala, imperativa).
paradigma(scala, oo).
paradigma(self, oo).
paradigma(smalltalk, oo).
paradigma(simula, procedural).
paradigma(simula, imperativa).
paradigma(simula, estruturada).
paradigma(simula, oo).
paradigma(strongtalk, oo).
paradigma(snobol, imperativa).
paradigma(swift, oo).
paradigma(swift, funcional).
paradigma(swift, imperativa).
paradigma(typescript, funcional).
paradigma(typescript, generica).
paradigma(typescript, imperativa).
paradigma(typescript, oo).


% Versões de Dart segundo https://pt.wikipedia.org/wiki/Dart_(linguagem_de_programação)
versao(dart, 1, 2013).
versao(dart, 2, 2018). 
versaoMaisRecente(dart, 2).


%%% Regras %%%
% Descendência transitiva na genealogia das linguagens.
descendente(X, Y) :- baseadaEm(X, Y).
descendente(X, Y) :- baseadaEm(X, A), descendente(A, Y).
% Hiato entre versões.
versaoAnterior(V1, V2) :- V1 is V2 - 1.
hiato(LP, Versao, Hiato) :-
 versaoAnterior(VersaoAnterior, Versao),
 versao(LP, VersaoAnterior, AnoAnterior),
 versao(LP, Versao, Ano),
 Hiato is Ano - AnoAnterior.
versaoSeguinte(V2, V1) :- V2 is V1 + 1.
hiatoReverso(LP, Versao, Hiato) :-
 versaoSeguinte(VersaoSeguinte, Versao),
 versao(LP, Versao, Ano),
 versao(LP, VersaoSeguinte, AnoSeguinte),
 Hiato is AnoSeguinte - Ano.
