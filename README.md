# Tourist Attractions in Petchaburi Province
This project uses knowledge representation and Prolog language to find tourist attractions in Petchaburi province in Thailand. 

In this project, you can find tourist attractions by district, type, activity, age, time, budget, and entrance fee. 

This project provides you a filter which you can use to find a place with just a function.
## Requirement
SWI-Prolog

## Knowledge Base
For tourist attractions data is in [__data for tourist attractions__](https://goo.gl/JMcMX2)

## API
You can use `rules` appears below to find data from `facts`
  * `place_with_custom_filters(PLACE, DISTRICT, TYPE, ACTIVITY, AGE, TIME, BUDGET, ENTRANCE_FEE, EN_DIS, EN_TYPE, EN_ACTIVITY, EN_ACT_AGE, EN_TIME, EN_BUDGET, EN_ENT_FEE)`
    * Find places by district, type of place, activity you can do, age, time, budget, and entrance fee. (filter age must be used with activity ex. ???, swimming, 20, ???)
    * To use this filter, EN_??? will be true if it is used in the filter.
    * Ex. place_with_custom_filters(X, cha_am, water_park, _, _, 12, _, 500, true, true, false, false, true, false, true). This filter wants to find places in Cha-am district, which is water park, open at 12 and entrance fee not greater than 500 Baht.
    ``` 
    ?- place_with_custom_filters(X, cha_am, water_park, _, _, 12, _, 500, true, true, false, false, true, false, true).
    X = santorini_park ;
    false.
    ```

## Examples

Use `TAB` or `SPACE` for multiple answers
``` 
$ swipl -s rules.pl 

?- place_in_district(DISTRICT, cha_am_forest_park).
DISTRICT = cha_am.

?- place_in_act(ACTIVITY, cha_am_forest_park).
ACTIVITY = natural_observation ;
ACTIVITY = camping.

?- place_in_type(temple, PLACE).
PLACE = wat_yai_suwannaram_temple ;
PLACE = wat_khoi_temple ;
PLACE = saiyat_buddhist_temple ;
PLACE = neranchararam_temple ;
PLACE = mahathat_worawihan_temple ;
PLACE = khao_takrao_temple ;
PLACE = khao_luang_cave ;
PLACE = khao_bandai_it_temple ;
PLACE = kamphaeng_laeng_temple ;
PLACE = chao_por_khao_yai_shrine ;
false.

?- place_in_district(khao_yoi, PLACE).
PLACE = tai_dam_cultural_village ;
PLACE = khao_yoi_cave ;
false.
```

## Implementation
  * `place_in_district(DISTRICT, PLACE)`
    * Find places by district
  * `place_in_type(TYPE, PLACE)`
    * Find places by type of place
  * `place_in_act(ACTIVITY, PLACE)`
    * Find places by activity can do
  * `act_for_age(ACTIVITY, AGE)`
    * Find activities suits for that age
  * `time_for_place(PLACE, TIME)`
    * Find places that open at that time
  * `is_open(PLACE,TIME_START, TIME_END)`
    * Find place that open between specific time
  * `is_enough_budget(BUDGET, PLACE)`
    * Check whether budget is enough for a place or not
    * Find places requires budget belows or equals
  * `is_enough_entrance_fee(ENTRANCE_FEE, PLACE)`
    * Check whether entrance fee is enough for a place or not
    * Find places requires entrance fee belows or equals