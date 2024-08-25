scoreboard players set @s save_fish_count 0
execute as @s run function fishhunter:get_fishes
scoreboard players operation @s body_type *= hhuy body_type
scoreboard players operation @s body_type -= hhuy body_type
summon minecraft:text_display ~ ~ ~ {Tags:["changer"]}
tp @e[scores={mode_boots = 6}] @e[limit=1, tag=duble]
tp @e[limit=1, tag=duble] @e[limit=1, tag=changer]
kill @e[tag=changer]