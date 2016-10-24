from pyswip import Prolog

prolog = Prolog()
prolog.consult("rules.pl")

EN_DIS = raw_input("Filter by district(true/false): ")
EN_TYPE = raw_input("Filter by type(true/false): ")
EN_ACTIVITY = raw_input("Filter by activity(true/false): ")
if(EN_ACTIVITY)
EN_ACT_AGE = raw_input("Filter by age(true/false): ")
EN_TIME = raw_input("Filter by time(true/false): ")
EN_BUDGET = raw_input("Filter by budget(true/false): ")

#place_with_custom_filters(PLACE, DISTRICT, TYPE, ACTIVITY, AGE, TIME, BUDGET, EN_DIS, EN_TYPE, EN_ACTIVITY, EN_ACT_AGE, EN_TIME, EN_BUDGET)
#print str(list(prolog.query("getSeat(X, adam).")))
