# -1 = tp random
execute as @e[tag=data, scores={choice_tp_boots = 1}] run tp @a[tag=!hunter] 374 -9 -569
execute as @e[tag=data, scores={choice_tp_boots = 2}] run tp @a[tag=!hunter] 517 -7 -559
execute as @e[tag=data, scores={choice_tp_boots = 3}] run tp @a[tag=!hunter] 443 -8 -675

scoreboard players set @e[tag=data] choice_tp_boots 0
scoreboard players set @e[tag=data] cd_spawn -1
scoreboard players set @e[tag=data] cd_hunter_spawn 300

give @p[tag=!hunter, scores={mode_boots = 4}] minecraft:ender_pearl 1
give @p[tag=!hunter, scores={mode_boots = 4}] minecraft:suspicious_stew 1

# open vault chamber for hunter to choose tp
fill 477 75 -623 477 77 -621 air