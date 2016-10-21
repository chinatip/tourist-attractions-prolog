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

place_with_custom_filters(PLACE, DISTRICT, TYPE, ACTIVITY, AGE, EN_DIS, EN_TYPE, EN_ACTIVITY, EN_ACT_AGE):-
	((EN_DIS, place_in_district(DISTRICT, PLACE)); not(EN_DIS)),
	((EN_TYPE, place_in_type(TYPE, PLACE)); not(EN_TYPE)),
	((
		EN_ACTIVITY,
		place_in_act(ACTIVITY, PLACE),
		((EN_ACT_AGE, act_for_age(ACTIVITY, AGE)); not(EN_ACT_AGE))
	); not(EN_ACTIVITY)).

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

