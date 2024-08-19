execute at @e[type=tnt] run function fishhunter:explode

scoreboard players remove @e[tag=data,scores={cd_spawn = 0..}] cd_spawn 1
scoreboard players remove @e[tag=data,scores={cd_hunter_spawn = 0..}] cd_hunter_spawn 1
scoreboard players remove @e[tag=data,scores={cd_to_tp_hunter = 0..}] cd_to_tp_hunter 1

execute unless score @e[tag=timers,limit=1,scores={bow_toggle = 1, arrow_giver = 0..}] arrow_giver matches 0 run give @a[tag=hunter] minecraft:arrow
scoreboard players remove @e[tag=data, scores={arrow_giver = 1..}] arrow_giver 1

execute as @e[tag=data,scores={cd_hunter_spawn = 0}] run function fishhunter:accept_tp

scoreboard players remove @e[tag=timers, limit=1, scores={counter = 0..}] counter 1

execute store result bossbar minecraft:bb1 value run scoreboard players get @e[tag=timers, limit=1] counter
execute as @e[tag=timers, scores={counter = 0}] run function fishhunter:hunter_win
execute as @e[tag=timers,scores={bootsCount=0}] run function fishhunter:hunter_win

execute store success score @a[gamemode=adventure, tag=!hunter, x=368, y=-10, z=-567, dx=1, dy=0, dz=1] fish_add run clear @a[gamemode=adventure, tag=!hunter, x=368, y=-10, z=-567, dx=1, dy=0, dz=1, scores={fish_add = 0}] minecraft:pufferfish 1
execute store success score @a[gamemode=adventure, tag=!hunter, x=439, y=-8, z=-681, dx=2, dy=0, dz=2] fish_add run clear @a[gamemode=adventure, tag=!hunter, x=439, y=-8, z=-681, dx=2, dy=0, dz=2, scores={fish_add = 0}] minecraft:pufferfish 1
execute store success score @a[gamemode=adventure, tag=!hunter, x=514, y=-8, z=-556, dx=1, dy=0, dz=1] fish_add run clear @a[gamemode=adventure, tag=!hunter, x=514, y=-8, z=-556, dx=1, dy=0, dz=1, scores={fish_add = 0}] minecraft:pufferfish 1
execute as @p[scores={fish_add = 1}] run function fishhunter:add_fish

tag @a[x = 448, y = 76, z = -608, dx = 40, dy = 20, dz = -40] add hunter
team join hunter @a[x = 448, y = 76, z = -608, dx = 40, dy = 20, dz = -40]
tag @a[x = 448, y = 40, z = -608, dx = 40, dy = 20, dz = -40] remove hunter
team join boots @a[x = 448, y = 40, z = -608, dx = 40, dy = 20, dz = -40]

execute as @e[tag=data, scores={cd_spawn = 1.., choice_tp_boots = 1..}] run function fishhunter:tp_boots
execute as @e[tag=data, scores={cd_spawn = 0}] run function fishhunter:tp_boots

kill @e[type=tnt]