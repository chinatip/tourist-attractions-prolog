:- use_module(facts,[]).
gte(X, Y):-
	number(X), number(Y) -> X>=Y.

lte(X, Y):-
	number(X), number(Y) -> X=<Y.

place_in_district(DISTRICT, PLACE):-
	facts:place(PLACE),
	facts:has_place(DISTRICT, PLACE).

place_in_type(TYPE, PLACE):-
	facts:place(PLACE),
	facts:is_type(PLACE, TYPE).

place_in_act(ACTIVITY, PLACE):-
	facts:place(PLACE),
	facts:has_act(PLACE, ACTIVITY).

act_for_age(ACTIVITY, AGE):-
	facts:act_age_range_end(ACTIVITY, LIMIT_UPPER_AGE),
	facts:act_age_range_start(ACTIVITY, LIMIT_LOWER_AGE),
	gte(AGE, LIMIT_LOWER_AGE),
	lte(AGE, LIMIT_UPPER_AGE).

time_for_place(PLACE, TIME):-
	facts:open_at(PLACE, LIMIT_LOWER_TIME),
	facts:close_at(PLACE, LIMIT_UPPER_TIME),
	gte(TIME, LIMIT_LOWER_TIME),
	lte(TIME, LIMIT_UPPER_TIME).

is_open(PLACE,T1,T2):-
	time_for_place(PLACE, T1),
	time_for_place(PLACE, T2).

is_enough_budget(AMOUNT,PLACE):-
	facts:budget(PLACE,AMOUNT_B),
	gte(AMOUNT,AMOUNT_B).
	
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

query_dis_type_act(DIS, TYPE, ACT, PLACE, ENABLE_QUERY_1, ENABLE_QUERY_2, ENABLE_QUERY_3):-
	(
		(ENABLE_QUERY_1, place_in_district(DIS,PLACE));
		(ENABLE_QUERY_2, place_in_type(TYPE,PLACE));
		(ENABLE_QUERY_3, place_in_act(ACT,PLACE))
	),
	write(PLACE), nl, fail;true.