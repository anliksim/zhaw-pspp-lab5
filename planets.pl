% planets
orbits(mercury, sun).
orbits(venus,   sun).
orbits(earth,   sun).
orbits(mars,    sun).
orbits(jupiter, sun).
orbits(saturn,  sun).
orbits(uranus,  sun).
orbits(neptune, sun).

ae(mercury, 0.39).
ae(venus,   0.72).
ae(earth,   1).
ae(mars,    1.52).
ae(jupiter, 5.20).
ae(saturn,  9.54).
ae(uranus,  19.22).
ae(neptune, 30.06).

% moons
orbits(moon, earth).
orbits(deimos, mars).
orbits(phobos, mars).
orbits(ganymede, jupiter).
orbits(callisto, jupiter).
orbits(io,       jupiter).
orbits(europa,   jupiter).
orbits(titan,     saturn).
orbits(enceladus, saturn).
orbits(titania, uranus).
orbits(oberon,  uranus).
orbits(umbriel, uranus).
orbits(ariel,   uranus).
orbits(miranda, uranus).
orbits(triton, neptune).

terrestrials([mercury,venus,earth, mars]).


% checks if its a moon
moon(O) :- orbits(O,X), orbits(X,Y), Y=sun.


% checks if its not a terrestrial
gas_planet(P) :- terrestrials(T), not(member(P,T)), orbits(P,X), X=sun.

% count all plantes
countPlantes(C) :- setof(X, orbits(X,sun), S), length(S,C).

% count all moons of a planet
countMoons(P,C) :- setof(X, orbits(X,P), S) *-> length(S,C); length([],C).

% all plantes and moons O that are further away from the sun (ae) than P 
%outer_orbit(P,O) :- ae(P,L), D>L, setof(X, ae(X, D), O). 



