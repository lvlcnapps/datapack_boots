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
# execute as @e[tag=timers,scores={bootsCount=0}] run function fishhunter:hunter_win

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

scoreboard players set @a[tag=hunter,nbt={SelectedItem: {id:"minecraft:tnt"}}] mode_hunters 1
scoreboard players set @a[tag=hunter,nbt={SelectedItem: {id:"minecraft:netherite_helmet"}}] mode_hunters 2
scoreboard players set @a[tag=hunter,nbt={SelectedItem: {id:"minecraft:lead"}}] mode_hunters 3
scoreboard players set @a[tag=hunter,nbt={SelectedItem: {id:"minecraft:diamond"}}] mode_hunters 9
scoreboard players set @a[tag=!hunter] mode_hunters 0


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
execute as @a[scores={mode_boots=4}] at @s if entity @e[distance=..15, limit=1,tag=mark] run scoreboard players set @s tp_near 1
execute as @e[tag=data, scores={game = 1}] run title @a[scores={mode_boots = 4, tp_near = 1}] actionbar {"text":"You can tp","bold":true,"color":"green"}
execute as @e[tag=data, scores={game = 1}] run title @a[scores={mode_boots = 4, tp_near = 0}] actionbar {"text":"","bold":true,"color":"green"}
scoreboard players set @a tp_near 0


execute store success score @a[scores={mode_boots = 6}] duble_reload run kill @e[type=minecraft:snowball]
execute as @a[scores={duble_reload = 1}] run kill @e[tag=duble]
scoreboard players set @a[scores={duble_reload = 1..}] duble_reload 0
execute at @a[scores={mode_boots = 6, duble_used = 1..}] run summon minecraft:piglin ~ ~ ~ {NoAI:1b,PersistenceRequired:0b,CanPickUpLoot:0b,Silent:1,Age:0,ArmorItems:[{id:"minecraft:leather_boots",Count:1},{id:"minecraft:leather_leggings",Count:1},{},{}],active_effects:[{id:"minecraft:invisibility",show_icon: 0b, amplifier:0,duration:-1,show_particles:0b}],Tags:["duble"]}
scoreboard players set @a[scores={duble_used = 1..}] duble_cd 100
scoreboard players set @a[scores={duble_used = 1..}] duble_used 0

effect give @a[tag=hunter, scores={killed_fake = 1..}] minecraft:darkness 3 50 true
effect give @a[tag=hunter, scores={killed_fake = 1..}] minecraft:slowness 3 50 true
effect give @a[tag=hunter, scores={killed_fake = 1..}] minecraft:jump_boost 3 128 true
execute as @a[scores={killed_fake = 1..}] run title @a[scores={mode_boots = 6}] actionbar {"text":"Stunned","bold":true,"color":"blue"}
scoreboard players set @a[scores={killed_fake = 1..}] killed_fake 0

scoreboard players remove @a[scores={duble_cd = 0..}] duble_cd 1
give @a[scores={duble_cd = 0}] minecraft:snowball 1

execute at @a[scores={mode_boots = 6, change_body_handler = 1..}] run function fishhunter:change_body
execute as @a[scores={change_body_handler = 1..}] run kill @e[type=minecraft:eye_of_ender]
scoreboard players set @a[scores={change_body_handler = 1..}] change_body_cd 100
scoreboard players set @a[scores={change_body_handler = 1..}] change_body_handler 0

scoreboard players remove @a[scores={change_body_cd = 0..}] change_body_cd 1
give @a[scores={change_body_cd = 0}] minecraft:ender_eye 1

execute as @e[tag=timers, scores={counter=..500}] run bossbar set minecraft:bb1 color red
execute as @e[tag=timers, scores={counter=500..1500}] run bossbar set minecraft:bb1 color yellow
execute as @e[tag=timers, scores={counter=1500..}] run bossbar set minecraft:bb1 color green

effect give @a[tag=!hunter, scores={mode_boots = 2}] minecraft:speed infinite 0 true
# execute as @e[tag=data, scores={game = 1}] run attribute @a[limit=1,tag=!hunter, scores={mode_boots = 3}] minecraft:generic.step_height base set 2.5

clear @a[scores={mode_boots = 3, blink_used = 1..}] minecraft:leather_leggings
clear @a[scores={mode_boots = 3, blink_used = 1..}] minecraft:leather_boots
scoreboard players set @a[scores={mode_boots = 3, blink_used = 1..}] cd_blink 160
scoreboard players set @a[scores={mode_boots = 3, blink_used = 1..}] blink_used 0

scoreboard players remove @a[scores={mode_boots = 3, cd_blink = 0..}] cd_blink 1
item replace entity @a[scores={mode_boots = 3, cd_blink = 0}] armor.feet with minecraft:leather_boots[minecraft:dyed_color=7603713]
item replace entity @a[scores={mode_boots = 3, cd_blink = 0}] armor.legs with minecraft:leather_leggings[minecraft:dyed_color=8420096]
scoreboard players set @a[scores={mode_boots = 3, cd_blink = 0}] blink_reload 1600

scoreboard players remove @a[scores={mode_boots = 3, blink_reload = 0..}] blink_reload 1
give @a[scores={mode_boots = 3, blink_reload = 0}] egg

kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:egg"}}]

# HUNTERS CLASSES #

scoreboard players remove @a[tag=hunter, scores={mode_hunters = 1, cd_striker = 0..}] cd_striker 1
give @a[tag=hunter, scores={mode_hunters = 1, cd_striker = 0}] lingering_potion[custom_name='{"text":"Strike"}',potion_contents={custom_color:1,custom_effects:[{id:"minecraft:instant_damage",amplifier:4,duration:100}]}]
give @a[tag=hunter, scores={mode_hunters = 1, cd_striker = 1200}] lingering_potion[custom_name='{"text":"Strike"}',potion_contents={custom_color:1,custom_effects:[{id:"minecraft:instant_damage",amplifier:4,duration:100}]}]
give @a[tag=hunter, scores={mode_hunters = 1, cd_striker = 2400}] lingering_potion[custom_name='{"text":"Strike"}',potion_contents={custom_color:1,custom_effects:[{id:"minecraft:instant_damage",amplifier:4,duration:100}]}]
execute as @a[tag=hunter, scores={mode_hunters = 1, striker_used = 1..}] run execute at @e[type = minecraft:area_effect_cloud, limit = 1, tag=!blocked] run summon area_effect_cloud ~ ~ ~ {Particle:ambient_entity_effect,Color:11730967,Potion:strong_strength,Radius:4,Duration:100,Tags:["blocked"]}
execute as @a[tag=hunter, scores={mode_hunters = 1, striker_used = 1..}] store success score @s strike_throw run execute at @e[type = minecraft:area_effect_cloud, limit = 1, tag=!blocked] run summon area_effect_cloud ~ ~-1 ~ {Particle:ambient_entity_effect,Color:11730967,Potion:strong_strength,Radius:4,Duration:100,Tags:["blocked"]}
execute as @a[tag=hunter, scores={mode_hunters = 1, strike_throw = 1..}] run tag @e[type=minecraft:area_effect_cloud] add blocked
scoreboard players set @a[tag=hunter, scores={mode_hunters = 1, strike_throw = 1.., striker_used = 1..}] striker_used 0
scoreboard players add @a[tag=hunter, scores={mode_hunters = 1, strike_throw = 1..}] cd_striker 1200
scoreboard players set @a[tag=hunter, scores={mode_hunters = 1, strike_throw = 1..}] strike_throw 0
execute at @e[tag=blocked] run effect give @a[tag=!hunter, distance=..4] minecraft:instant_damage infinite 5 true


execute as @a[tag=hunter, scores={mode_hunters = 3, engineer_used = 1..}] run kill @e[tag=eng_mark]
execute at @a[tag=hunter, scores={mode_hunters = 3, engineer_used = 1..}] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["eng_mark"]}
clear @a[tag=hunter, scores={mode_hunters = 3, engineer_used = 1..}] filled_map
scoreboard players set @a[tag=hunter, scores={mode_hunters = 3, engineer_used = 1..}] cd_eng 200
scoreboard players set @a engineer_used 0
execute at @e[limit=1, tag=eng_mark] run effect give @a[tag=!hunter, distance=..3] minecraft:glowing 3 1 true
execute at @e[limit=1, tag=eng_mark] run playsound minecraft:entity.elder_guardian.curse master @a[tag=!hunter, distance=..3] ~ ~ ~ 0.2
# execute at @e[limit=1, tag=eng_mark] run execute as @a[tag=!hunter, distance=..3] run playsound minecraft:entity.elder_guardian.curse master @a[tag=hunter] ~ ~ ~ 0.2
execute at @e[limit=1, tag=eng_mark] run execute as @a[tag=!hunter, distance=..3] run kill @e[tag=eng_mark]

scoreboard players remove @a[tag=hunter, scores={mode_hunters = 3, cd_eng = 0..}] cd_eng 1
give @a[tag=hunter, scores={mode_hunters = 3, cd_eng = 0}] map[custom_name='{"text":"Trap"}']