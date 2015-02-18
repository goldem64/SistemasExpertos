top_goal(X):-ave(X).

genero(tubenose) :-  nariz(tubular_externo),  vive(mar),  pico(engachado).
genero(acuaticas) :-  patas(palmeadas),  pico(plano).
genero(rapaces)   :-  come(carne),  patas(garras_curvadas), pico(enganchado_agudo).
genero(pajaros)   :-  patas(un_dedo_largo_hacia_atras).

familia(albatros)   :- genero(tubenose), tamano(largo),  alas(largas_angostas).
familia(cisne)      :- genero(acuaticas), cuello(long), color(blanco), vuelo(ponderoso).
familia(ganso)      :- genero(acuaticas), tamano(gordo), vuelo(potente).
familia(pato)       :- genero(acuaticas), come(peces_pequeños), vuelo(agil).
familia(buitre)     :- genero(rapaces), come(cadaveres_animales),  alas(anchas).
familia(halcon)     :- genero(rapaces), alas(puntiaguda), cabeza(largo),cola(punta_estrecha).
familia(golondrinas):- genero(pajaros), alas(puntiagudas), cola(bifurcada), pico(corto).

ave(laysan_albatros)  :- familia(albatros),  color(blanco).
ave(albatros_patas_negras) :-  familia(albatros),  color(negro).
ave(cisne_silbador)   :- familia(cisne), canto(silbido_musical_sordo).
ave(cisne_trompetero) :- familia(cisne), canto(trompeta_ruidosa).
ave(canada_ganso)     :- familia(ganso), estaciones(invierno),	cabeza(negro).
ave(ganso_nieve)      :- familia(ganso), color(blanco).
ave(mallard)          :- familia(pato), canto(quack), cabeza(verde).
ave(mallard)          :- familia(pato), canto(quack), color(marron_moteado).
ave(pintail)          :- familia(pato), canto(silbido_corto).
ave(turkey_vulture)   :-  familia(buitre),  perfil_vuelo(forma_v).
ave(condor_california):-  familia(buitre),  perfil_vuelo(plano).
ave(gavilan)	       :-  familia(halcon),  come(insectos).
ave(halcon_peregrino) :-  familia(halcon),  come(ave).
ave(golondrina_andorina)  :- familia(golondrina),  cola(bifurcada).
ave(golondrina_acantilado):- familia(golondrina),  cola(cuadrada).
ave(glondrina_purpura)    :- familia(golondrina),  color(obscuro).

nariz(X)  :-  pregunta(nariz,X).
vive(X)   :-  pregunta(vive,X).
pico(X)   :-  pregunta(pico,X).
tamano(X) :-  observador(tamano,X,[largo,gordo,mediano,pequeño]).

come(X)  :-  pregunta(come,X).
patas(X) :-  pregunta(patas,X).
alas(X)  :-  pregunta(alas,X).
cuello(X):-  pregunta(cuello,X).
color(X) :-  pregunta(color,X).
vuelo(X) :-  observador(vuelo,X,[ponderoso,potente,agil,other]).

cabeza(X) :-  pregunta(cabeza,X).
cola(X)	  :-  observador(cola,X,[punta_estrecha,bifurcada,cuadrada,other]).

canto(X)        :-  pregunta(canto,X).
estaciones(X) :-  observador(estaciones,X,[invierno,verano]).

perfil_vuelo(X) :-  observador(perfil_vuelo,X,[plano,forma_v,other]).

pregunta(Attr, Val):- write(Attr:Val), write('? '), read(si).
observador(A, V, MenuList) :- write('Observador:  '), write(A),write('?'),
	nl,write(MenuList), nl,read(X), check_val(X, A, V, MenuList),
	asserta( known(si, A, X) ),  X == V.

check_val(X, A, V, MenuList) :-write(X),write('Error, intente de nuevo.'),
	nl, observador(A, V, MenuList).













