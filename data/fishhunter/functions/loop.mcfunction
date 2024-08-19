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

execute as @e[tag=data, scores={game = 1}] run execute store success score @a[gamemode=adventure, tag=!hunter, x=368, y=-10, z=-567, dx=1, dy=0, dz=1] fish_add_burj run clear @a[gamemode=adventure, tag=!hunter, x=368, y=-10, z=-567, dx=1, dy=0, dz=1, scores={fish_add_burj = 0}] minecraft:pufferfish 1
execute as @e[tag=data, scores={game = 1}] run execute store success score @a[gamemode=adventure, tag=!hunter, x=439, y=-8, z=-681, dx=2, dy=0, dz=2] fish_add_bur run clear @a[gamemode=adventure, tag=!hunter, x=439, y=-8, z=-681, dx=2, dy=0, dz=2, scores={fish_add_bur = 0}] minecraft:pufferfish 1
execute as @e[tag=data, scores={game = 1}] run execute store success score @a[gamemode=adventure, tag=!hunter, x=514, y=-8, z=-556, dx=1, dy=0, dz=1] fish_add_pump run clear @a[gamemode=adventure, tag=!hunter, x=514, y=-8, z=-556, dx=1, dy=0, dz=1, scores={fish_add_pump = 0}] minecraft:pufferfish 1
execute as @p[scores={fish_add_burj = 1}] run tellraw @a {"text": "а воот в моё вреемя рыб сдааваали в церковь...", "color":"blue"}
execute as @p[scores={fish_add_bur = 1}] run tellraw @a {"text":"\u044f \u0437\u0430\u0431\u0438\u0432\u0430\u044e \u0441\u0432\u0430\u0438!..","color":"dark_green"}
execute as @p[scores={fish_add_pump = 1}] run tellraw @a {"text":"всех с тыквенным спасом","color":"yellow"}
execute as @p[scores={fish_add_burj = 1}] run function fishhunter:add_fish
execute as @p[scores={fish_add_bur = 1}] run function fishhunter:add_fish
execute as @p[scores={fish_add_pump = 1}] run function fishhunter:add_fish

tag @a[x = 448, y = 76, z = -608, dx = 40, dy = 20, dz = -40] add hunter
team join hunter @a[x = 448, y = 76, z = -608, dx = 40, dy = 20, dz = -40]
tag @a[x = 448, y = 40, z = -608, dx = 40, dy = 20, dz = -40] remove hunter
team join boots @a[x = 448, y = 40, z = -608, dx = 40, dy = 20, dz = -40]

execute as @e[tag=data, scores={cd_spawn = 1.., choice_tp_boots = 1..}] run function fishhunter:tp_boots
execute as @e[tag=data, scores={cd_spawn = 0}] run function fishhunter:tp_boots

kill @e[type=tnt]

scoreboard players set @a[tag=!hunter,nbt={SelectedItem: {id:"minecraft:lapis_lazuli"}}] mode_boots 1
scoreboard players set @a[tag=!hunter,nbt={SelectedItem: {id:"minecraft:feather"}}] mode_boots 2
scoreboard players set @a[tag=!hunter,nbt={SelectedItem: {id:"minecraft:rabbit_foot"}}] mode_boots 3
scoreboard players set @a[tag=!hunter,nbt={SelectedItem: {id:"minecraft:blaze_powder"}}] mode_boots 4
scoreboard players set @a[tag=!hunter,nbt={SelectedItem: {id:"minecraft:weeping_vines"}}] mode_boots 5
scoreboard players set @a[tag=!hunter,nbt={SelectedItem: {id:"minecraft:nether_star"}}] mode_boots 6
scoreboard players set @a[tag=!hunter,nbt={SelectedItem: {id:"minecraft:diamond"}}] mode_boots 9
scoreboard players set @a[tag=hunter] mode_boots 0


execute as @a store result score @s place_y run data get entity @s Pos[1] 10
scoreboard players operation @a place_y %= hhuy place_y

execute as @a[scores={tp_spawn = 1..}] run kill @e[tag=mark]
give @a[scores={tp_spawn = 1.., place_y = 1..}] minecraft:suspicious_stew 1
give @a[scores={tp_spawn = 1.., place_y = ..-1}] minecraft:suspicious_stew 1
execute at @a[scores={tp_spawn = 1.., place_y = 0}] run summon minecraft:item_frame ~ ~ ~ {Tags:["mark"], Rotation:[0.0f, -90.f], Facing:1b, Invisible: 1b, Item:{id: "minecraft:raw_gold_block", Count: 1b}}
scoreboard players set @a[scores={tp_spawn = 1.., place_y = 0}] tp_reload 1600
scoreboard players set @a[scores={tp_spawn = 1..}] tp_spawn 0
give @a[scores={tp_reload = 0}] minecraft:suspicious_stew 1
scoreboard players set @a[scores={error_tp = 1..}] error_tp 0
scoreboard players remove @a[scores={tp_reload = 0..}] tp_reload 1
kill @e[type=minecraft:ender_pearl]
execute as @a[scores={tp_toggle = 1..}] at @s if entity @e[distance=..15, limit=1,tag=mark] run tp @a[scores={tp_toggle = 1..}] @e[limit=1,tag=mark]
give @a[scores={tp_toggle = 1..}] minecraft:ender_pearl 1
clear @a minecraft:bowl
scoreboard players set @a[scores={tp_toggle = 1..}] tp_toggle 0
execute as @a[scores={mode_boots=7}] at @s if entity @e[distance=..15, limit=1,tag=mark] run scoreboard players set @s tp_near 1
execute as @e[tag=global, scores={game = 1}] run title @a[scores={mode_boots = 7, tp_near = 1}] actionbar {"text":"You can tp","bold":true,"color":"green"}
execute as @e[tag=global, scores={game = 1}] run title @a[scores={mode_boots = 7, tp_near = 0}] actionbar {"text":"","bold":true,"color":"green"}
scoreboard players set @a tp_near 0


execute as @e[tag=timers, scores={counter=..500}] run bossbar set minecraft:bb1 color red
execute as @e[tag=timers, scores={counter=500..1500}] run bossbar set minecraft:bb1 color yellow
execute as @e[tag=timers, scores={counter=1500..}] run bossbar set minecraft:bb1 color green

execute as @e[tag=data, scores={game = 1}] run effect give @a[tag=!hunter, scores={mode_boots = 2}] minecraft:speed infinite 0 true
execute as @e[tag=data, scores={game = 1}] run attribute @a[limit=1,tag=!hunter, scores={mode_boots = 3}] minecraft:generic.step_height base set 2.5
