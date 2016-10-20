:- use_module(facts,[]).
place_in_district(DISTRICT,PLACE):-
	facts:place(PLACE),
	facts:has_place(DISTRICT,PLACE).

place_in_type(TYPE,PLACE):-
	facts:place(PLACE),
	facts:is_type(PLACE,TYPE).

place_in_act(ACTIVITY,PLACE):-
	facts:place(PLACE),
	facts:has_act(PLACE,ACTIVITY).

list_place_in_district(X):-
	facts:place_in_district(X,Y),
	write(Y),
	nl,
    fail
    ;
    true.

list_place_in_type(X):-
	facts:place_in_type(X,Y),
	write(Y),
	nl,
    fail
    ;
    true.