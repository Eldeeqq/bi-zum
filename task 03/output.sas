begin_version
3
end_version
begin_metric
0
end_metric
27
begin_variable
var0
-1
2
Atom has_connections_shady()
NegatedAtom has_connections_shady()
end_variable
begin_variable
var1
-1
2
Atom has_bear_skin()
NegatedAtom has_bear_skin()
end_variable
begin_variable
var2
-1
2
Atom has_cocoa()
NegatedAtom has_cocoa()
end_variable
begin_variable
var3
-1
2
Atom is_sober()
NegatedAtom is_sober()
end_variable
begin_variable
var4
-1
2
Atom is_weak()
NegatedAtom is_weak()
end_variable
begin_variable
var5
-1
2
Atom is_drunk()
NegatedAtom is_drunk()
end_variable
begin_variable
var6
-1
2
Atom has_alcohol()
NegatedAtom has_alcohol()
end_variable
begin_variable
var7
-1
2
Atom has_wood()
NegatedAtom has_wood()
end_variable
begin_variable
var8
-1
2
Atom has_boat()
NegatedAtom has_boat()
end_variable
begin_variable
var9
-1
2
Atom has_frigate()
NegatedAtom has_frigate()
end_variable
begin_variable
var10
-1
9
Atom at(academy)
Atom at(docks)
Atom at(forest)
Atom at(inn)
Atom at(island)
Atom at(lighthouse)
Atom at(river)
Atom at(sea)
Atom at(town)
end_variable
begin_variable
var11
-1
2
Atom has_gold_nugget()
NegatedAtom has_gold_nugget()
end_variable
begin_variable
var12
-1
2
Atom is_criminal()
NegatedAtom is_criminal()
end_variable
begin_variable
var13
-1
2
Atom has_gold_coin()
NegatedAtom has_gold_coin()
end_variable
begin_variable
var14
-1
2
Atom is_mellow()
NegatedAtom is_mellow()
end_variable
begin_variable
var15
-1
2
Atom is_bear_killer()
NegatedAtom is_bear_killer()
end_variable
begin_variable
var16
-1
2
Atom has_flowers()
NegatedAtom has_flowers()
end_variable
begin_variable
var17
-1
2
Atom has_map()
NegatedAtom has_map()
end_variable
begin_variable
var18
-1
2
Atom has_coke()
NegatedAtom has_coke()
end_variable
begin_variable
var19
-1
2
Atom is_captain()
NegatedAtom is_captain()
end_variable
begin_variable
var20
-1
2
Atom has_connections_good()
NegatedAtom has_connections_good()
end_variable
begin_variable
var21
-1
2
Atom has_gold_brick()
NegatedAtom has_gold_brick()
end_variable
begin_variable
var22
-1
2
Atom has_pearl()
NegatedAtom has_pearl()
end_variable
begin_variable
var23
-1
2
Atom has_ring()
NegatedAtom has_ring()
end_variable
begin_variable
var24
-1
2
Atom has_bride()
NegatedAtom has_bride()
end_variable
begin_variable
var25
-1
2
Atom is_friend_with_smuglers()
NegatedAtom is_friend_with_smuglers()
end_variable
begin_variable
var26
-1
2
Atom is_happy()
NegatedAtom is_happy()
end_variable
0
begin_state
1
1
1
0
0
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
end_state
begin_goal
1
26 0
end_goal
63
begin_operator
become_drug_addict 
4
18 0
9 0
21 0
25 0
1
0 26 -1 0
1
end_operator
begin_operator
become_married island
5
10 4
24 0
20 0
12 1
3 0
1
0 26 -1 0
1
end_operator
begin_operator
befriend_smugglers docks
3
10 1
0 0
21 0
1
0 25 -1 0
1
end_operator
begin_operator
brawl_in_inn inn
2
10 3
14 0
1
0 4 -1 1
1
end_operator
begin_operator
buy_pardon town
1
10 8
2
0 11 0 1
0 12 0 1
1
end_operator
begin_operator
buy_round inn
1
10 3
2
0 20 -1 0
0 13 0 1
1
end_operator
begin_operator
cleanse_in_river river
1
10 6
3
0 5 -1 1
0 14 -1 1
0 3 -1 0
1
end_operator
begin_operator
cleanse_in_sea sea
1
10 7
3
0 5 -1 1
0 14 -1 1
0 3 -1 0
1
end_operator
begin_operator
craft_boat 
0
2
0 8 -1 0
0 7 0 1
1
end_operator
begin_operator
craft_caravel 
0
4
0 8 0 1
0 9 -1 0
0 13 0 1
0 7 0 1
1
end_operator
begin_operator
craft_frigate 
0
4
0 8 0 1
0 9 -1 0
0 11 0 1
0 7 0 1
1
end_operator
begin_operator
drink_first_round 
0
3
0 6 0 1
0 14 -1 0
0 3 0 1
1
end_operator
begin_operator
drink_second_round 
0
3
0 6 0 1
0 5 -1 0
0 14 0 1
1
end_operator
begin_operator
drink_third_round 
0
2
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
get_robbed_by_pirates sea
1
10 7
5
0 9 -1 1
0 21 -1 1
0 13 -1 1
0 11 -1 1
0 4 0 1
1
end_operator
begin_operator
join_pirates sea
2
10 7
0 0
1
0 14 -1 0
1
end_operator
begin_operator
obtain_alcohol inn
1
10 3
2
0 6 -1 0
0 11 0 1
1
end_operator
begin_operator
obtain_bear_skin forest
1
10 2
3
0 1 -1 0
0 15 -1 0
0 4 -1 1
1
end_operator
begin_operator
obtain_boat_by_stealing river
1
10 6
2
0 8 -1 0
0 12 -1 0
1
end_operator
begin_operator
obtain_cocoa island
1
10 4
1
0 2 -1 0
1
end_operator
begin_operator
obtain_coke island
2
10 4
17 0
1
0 18 -1 0
1
end_operator
begin_operator
obtain_flowers forest
1
10 2
1
0 16 -1 0
1
end_operator
begin_operator
obtain_gold_brick town
1
10 8
3
0 20 -1 0
0 21 -1 0
0 13 0 1
1
end_operator
begin_operator
obtain_gold_coin town
1
10 8
3
0 20 -1 0
0 13 -1 0
0 11 0 1
1
end_operator
begin_operator
obtain_gold_nugget river
1
10 6
1
0 11 -1 0
1
end_operator
begin_operator
obtain_map forest
1
10 2
3
0 6 0 1
0 0 -1 0
0 17 -1 0
1
end_operator
begin_operator
obtain_pearl sea
1
10 7
1
0 22 -1 0
1
end_operator
begin_operator
obtain_ring 
0
3
0 21 0 1
0 22 0 1
0 23 -1 0
1
end_operator
begin_operator
obtain_wood forest
1
10 2
1
0 7 -1 0
1
end_operator
begin_operator
propose_as_bear_slayer lighthouse
4
10 5
16 0
23 0
15 0
1
0 24 -1 0
1
end_operator
begin_operator
propose_as_captain lighthouse
4
10 5
16 0
23 0
19 0
1
0 24 -1 0
1
end_operator
begin_operator
sail_boat docks lighthouse
1
8 0
1
0 10 1 5
1
end_operator
begin_operator
sail_boat docks sea
1
8 0
1
0 10 1 7
1
end_operator
begin_operator
sail_boat island sea
1
8 0
1
0 10 4 7
1
end_operator
begin_operator
sail_boat lighthouse docks
1
8 0
1
0 10 5 1
1
end_operator
begin_operator
sail_boat lighthouse sea
1
8 0
1
0 10 5 7
1
end_operator
begin_operator
sail_boat sea docks
1
8 0
1
0 10 7 1
1
end_operator
begin_operator
sail_boat sea island
1
8 0
1
0 10 7 4
1
end_operator
begin_operator
sail_boat sea lighthouse
1
8 0
1
0 10 7 5
1
end_operator
begin_operator
sail_frigate docks lighthouse
1
9 0
1
0 10 1 5
1
end_operator
begin_operator
sail_frigate docks sea
1
9 0
1
0 10 1 7
1
end_operator
begin_operator
sail_frigate island sea
1
9 0
1
0 10 4 7
1
end_operator
begin_operator
sail_frigate lighthouse docks
1
9 0
1
0 10 5 1
1
end_operator
begin_operator
sail_frigate lighthouse sea
1
9 0
1
0 10 5 7
1
end_operator
begin_operator
sail_frigate sea docks
1
9 0
1
0 10 7 1
1
end_operator
begin_operator
sail_frigate sea island
1
9 0
1
0 10 7 4
1
end_operator
begin_operator
sail_frigate sea lighthouse
1
9 0
1
0 10 7 5
1
end_operator
begin_operator
steal_coin town
1
10 8
2
0 13 -1 0
0 12 -1 0
1
end_operator
begin_operator
study_for_captain academy
2
10 0
12 1
2
0 13 0 1
0 19 -1 0
1
end_operator
begin_operator
trade_bear_skin docks
1
10 1
2
0 1 0 1
0 13 -1 0
1
end_operator
begin_operator
trade_cocoa docks
1
10 1
2
0 2 0 1
0 13 -1 0
1
end_operator
begin_operator
walk academy town
0
1
0 10 0 8
1
end_operator
begin_operator
walk docks inn
0
1
0 10 1 3
1
end_operator
begin_operator
walk docks river
0
1
0 10 1 6
1
end_operator
begin_operator
walk docks town
0
1
0 10 1 8
1
end_operator
begin_operator
walk forest river
0
1
0 10 2 6
1
end_operator
begin_operator
walk inn docks
0
1
0 10 3 1
1
end_operator
begin_operator
walk river docks
0
1
0 10 6 1
1
end_operator
begin_operator
walk river forest
0
1
0 10 6 2
1
end_operator
begin_operator
walk town academy
0
1
0 10 8 0
1
end_operator
begin_operator
walk town docks
0
1
0 10 8 1
1
end_operator
begin_operator
work_for_gold docks
1
10 1
1
0 11 -1 0
1
end_operator
begin_operator
work_pardon town
1
10 8
2
0 12 0 1
0 14 -1 0
1
end_operator
0
