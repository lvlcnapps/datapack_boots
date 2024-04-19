# работа глобального счетчика времени и ловля победы хантера по времени
scoreboard players remove @e[tag=timers, scores={counter=0..}] counter 1
execute as @e[tag=timers,scores={counter=0}] run function fishhunter:hunter_win

# проверка открытых домов
execute as @a[scores={check = 1..}] run function fishhunter:show_levers

# выдача стрел для лука
execute unless score @e[tag=global,limit=1,scores={bow_toggle = 1, arrow_giver = 0..}] arrow_giver matches 0 run give @a[tag=hunter] minecraft:arrow
scoreboard players remove @e[tag=global, scores={arrow_giver = 1..}] arrow_giver 1

# работа класса танк
scoreboard players set @a[scores={mode_boots = 4, tank_relo = 1.., tank_live = ..-1}] tank_live 100
scoreboard players remove @a[scores={tank_live = 0..}] tank_live 1
clear @a[scores={tank_live = 0..}] minecraft:glass_bottle
item replace entity @a[scores={tank_live = 1..}] weapon.offhand with minecraft:totem_of_undying
scoreboard players set @a[scores={tank_live = ..0}] tank_relo 0
scoreboard players set @a[scores={tank_live = 0}] tank_cd 200
clear @a[scores={tank_cd = 0..}] minecraft:totem_of_undying
scoreboard players remove @a[scores={tank_cd = 0..}] tank_cd 1
give @a[scores={tank_cd = 0}] minecraft:honey_bottle 1

# распределение по классам ботиночков
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:lapis_lazuli"}}] mode_boots 1
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:feather"}}] mode_boots 2
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:rabbit_foot"}}] mode_boots 3
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:heart_of_the_sea"}}] mode_boots 4
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:clock"}}] mode_boots 5
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:amethyst_shard"}}] mode_boots 6
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:blaze_powder"}}] mode_boots 7
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:music_disc_wait"}}] mode_boots 8
scoreboard players set @a[nbt={SelectedItem: {id:"minecraft:diamond"}}] mode_boots 9

# убирать плохолежащие рыбы # исправлено под счетчик 2.0
execute as @e[type=item, nbt={Item: {id:"minecraft:pufferfish", Count: 1b}, Age: 50s}] run function fishhunter:remove_fish

# ловля победы хантера проёбом рыб # исправлено под счетчик 2.0
# scoreboard players operation @p[tag=hunter] fish < @e[tag=global, limit=1] lost_fish
# execute as @p[tag=hunter, scores={fish=0}] run function fishhunter:hunter_win
execute store result score @e[tag=global] tt3 run scoreboard players operation @e[tag=global] tt1 < @e[tag=global] tt2
scoreboard players operation @e[tag=global] tt3 -= @e[tag=global] tt2
execute if entity @e[tag=global,scores={tt3 = 0}] run function fishhunter:hunter_win_lost

# отбирание рыбы хантером # исправлено под счетчик 2.0
execute store success score @a[tag=hunter] fish_win run clear @a[tag=hunter] minecraft:pufferfish
execute as @p[tag=hunter, scores={fish_win = 1}] run function fishhunter:remove_fish

# отслеживание рыб на месте сдачи # исправлено под счетчик 2.0
execute store success score @a[gamemode=adventure, tag=!hunter, x = 207, y = 74, z = -110, dx = 2, dy = 1, dz = 1] fish_add run clear @a[gamemode=adventure, tag=!hunter, x = 207, y = 74, z = -110, dx = 2, dy = 1, dz = 1, scores={fish_add = 0}] minecraft:pufferfish 1
scoreboard players add @a[scores={fish_add = 1}] fishCount 1
execute as @p[scores={fish_add = 1}] run function fishhunter:add_fish

# цветной боссбар
execute as @e[tag=timers, scores={counter=..500}] run bossbar set minecraft:timer color red
execute as @e[tag=timers, scores={counter=500..1500}] run bossbar set minecraft:timer color yellow
execute as @e[tag=timers, scores={counter=1500..}] run bossbar set minecraft:timer color green

# границы безопасности в церкви
execute at @a[x=199, y=73, z=-98, dx=0,dy=2,dz=16, tag=hunter] run tp @a[x=199, y=73, z=-98, dx=0,dy=2,dz=16, tag=hunter] ~-1 ~ ~
execute at @a[x=217, y=73, z=-98, dx=0,dy=2,dz=16, tag=hunter] run tp @a[x=217, y=73, z=-98, dx=0,dy=2,dz=16, tag=hunter] ~1 ~ ~
execute at @a[x=200, y=73, z=-81, dx=16,dy=2,dz=0, tag=hunter] run tp @a[x=200, y=73, z=-81, dx=16,dy=2,dz=0, tag=hunter] ~ ~ ~1

# автореколл после окончания игры
scoreboard players remove @a[tag=hunter, scores={cooldown=0..}] cooldown 1
execute as @a[scores={cooldown=0}] run function fishhunter:refresh

scoreboard players remove @e[tag=timers, scores={cooldown=0..}] cooldown 1
execute as @e[tag=timers,scores={cooldown=0}] run function fishhunter:refresh

# потеря рыбы из-за смерти ботиночка # исправлено под счетчик 2.0
execute store success score @a[tag=!hunter, scores={deaths=1..}] lost_fish run clear @a[tag=!hunter, scores={deaths=1.., lost_fish = 0}] minecraft:pufferfish 1
execute as @p[tag=!hunter, scores={lost_fish = 1}] run function fishhunter:remove_fish

# запрет стрелять в церкви
kill @e[type=minecraft:arrow, x = 217, y = 72, z = -81, dx = 12, dy = 9, dz = -18]
kill @e[type=minecraft:arrow, x = 217, y = 72, z = -81, dx = -18, dy = 9, dz = 28]
kill @e[type=minecraft:arrow, x = 199, y = 72, z = -81, dx = -12, dy = 9, dz = -18]

# эффекты классов
execute as @e[tag=global, scores={game = 1}] run effect give @a[tag=!hunter, scores={mode_boots = 2}] minecraft:speed infinite 0 true
execute as @e[tag=global, scores={game = 1}] run effect give @a[tag=!hunter, scores={mode_boots = 3}] minecraft:jump_boost infinite 1 true
give @a[tag=!hunter, scores={tank_reload = 1..}] minecraft:enchanted_golden_apple 1
scoreboard players set @a[tag=!hunter, scores={tank_reload = 1..}] tank_reload 0

# работа класса радар
# execute store success score @a[tag=!hunter, level=1.., scores={mode_boots = 5}] is_radared run execute at @a[tag=!hunter, level=1.., scores={mode_boots = 5}] run effect give @a[tag=hunter, distance=..75] minecraft:glowing 3 1 true
# xp set @a[tag=!hunter, scores = {mode_boots = 5}, level=1..] 0 levels
# scoreboard players set @a[tag=!hunter, scores={mode_boots = 5, radar_used = 1..}] radar_reload 400
# scoreboard players set @a[tag=!hunter, scores={mode_boots = 5, radar_used = 1..}] radar_used 0
# scoreboard players remove @a[scores={radar_reload = 0..}] radar_reload 1
# give @a[scores={radar_reload = 0}] minecraft:experience_bottle 1
# # effect give @a[scores={is_radared = 0}] minecraft:glowing 3 1 true
# scoreboard players set @a is_radared -1

# работа класса радар 2.0
tellraw @a[scores={mode_boots = 5, radar_reload = 0.., radar_used = 1..}] ["",{"text":"До следующего использования радара: "},{"score":{"name":"@a[scores={mode_boots = 5, radar_reload = 0.., radar_used = 1..}]","objective":"radar_reload"}},{"text":" тиков"}]
# tellraw @a[scores={mode_boots = 5, radar_reload = 0.., radar_used = 1..}] {"score":{"name":"@a[scores={mode_boots = 5, radar_reload = 0.., radar_used = 1..}]","objective":"radar_reload"}}
execute store success score @a[tag=!hunter, scores={radar_used = 1.., mode_boots = 5, radar_reload = ..0}] is_radared run execute at @a[tag=!hunter, scores={radar_used = 1.., mode_boots = 5, radar_reload = ..0}] run effect give @a[tag=hunter, distance=..75] minecraft:glowing 10 1 true
effect give @a[scores={is_radared = 1}] minecraft:glowing 2 1 true
# tellraw @a[scores={is_radared = 0}] {"text":"Ниггер","color":"red"}
title @a[scores={is_radared = 0}] actionbar {"text":"Nobody","color":"red"}
scoreboard players set @a[tag=!hunter, scores={mode_boots = 5, radar_used = 1.., is_radared = 0}] radar_reload 1000
scoreboard players set @a[tag=!hunter, scores={mode_boots = 5, radar_used = 1.., is_radared = 1}] radar_reload 600
scoreboard players set @a[tag=!hunter, scores={mode_boots = 5, radar_used = 1..}] radar_used 0
scoreboard players remove @a[scores={radar_reload = 0..}] radar_reload 1
scoreboard players set @a is_radared -1

# работа класса камера
scoreboard players remove @a[scores={mode_boots = 8, cam_timer = 1..}] cam_timer 1
execute as @a[scores={mode_boots = 8, cam_timer = 1}] run function fishhunter:cam_tp

kill @e[type=minecraft:eye_of_ender]
scoreboard players set @a[scores={mode_boots = 8, cam_use=1.., cam_mode=1}] cam_cd 0
scoreboard players set @a[scores={mode_boots = 8, cam_use=1.., cam_mode=1}] cam_use 0
scoreboard players set @a[scores={mode_boots = 8, cam_use=1.., cam_mode=0}] cam_cd 50
execute at @a[scores={mode_boots = 8,cam_work = 1, cam_timer = 0, cam_use = 1..,cam_mode=0}] run summon minecraft:armor_stand ~ ~ ~ {Tags:["stander"],ArmorItems:[{id:"minecraft:netherite_boots",Count:1},{id:"minecraft:netherite_leggings",Count:1},{},{}]}
data modify entity @e[limit=1, tag=stander] Rotation[0] set from entity @a[limit=1, scores={mode_boots = 8,cam_timer = 0, cam_work = 1,}] Rotation[0]
gamemode spectator @a[scores={mode_boots = 8,cam_work = 1,cam_use = 1..,cam_mode=0}]
spectate @e[limit=1, tag=camera] @a[limit=1, scores={mode_boots = 8,cam_work = 1,cam_use = 1..,cam_mode=0}]
scoreboard players set @a[scores={mode_boots = 8,cam_work = 1,cam_timer = 0, cam_use = 1..,cam_mode=0}] cam_timer 100
scoreboard players set @a[scores={mode_boots = 8,cam_work = 0}] cam_use 0
give @a[scores={mode_boots = 8,cam_cd = 0}] minecraft:ender_eye 1
scoreboard players remove @a[scores={mode_boots = 8,cam_cd = 0..}] cam_cd 1
title @a[scores={mode_boots=8, cam_work = 0}] actionbar {"text":"Camera Broken","color":"red"}

execute as @a[scores={mode_boots = 8,cam_change = 1..}] unless entity @e[tag=camera] run summon minecraft:armor_stand ~ ~ ~ {Tags:["camera"]}
execute as @a[scores={mode_boots = 8}] unless entity @e[tag=camera] run title @s actionbar {"text":"Camera Broken","color":"red"}
scoreboard players operation @a[scores={mode_boots = 8,cam_change = 1..}] cam_mode *= hhuy cam_mode
scoreboard players operation @a[scores={mode_boots = 8,cam_change = 1..}] cam_mode -= hhuy cam_mode
scoreboard players set @a[scores={mode_boots = 8,cam_change = 1..}] cam_work 1
execute if entity @a[scores={mode_boots = 8,cam_change = 1..}] run item replace entity @e[tag=camera] armor.head with minecraft:player_head{SkullOwner:Edna_I} 1
scoreboard players set @a[scores={mode_boots = 8,cam_change = 1..}] cam_change 0

data modify entity @e[tag=camera, limit=1] Rotation[0] set from entity @a[limit=1, scores={mode_boots = 8,cam_mode = 1}] Rotation[0]
execute at @a[limit=1, scores={mode_boots = 8,cam_mode = 1}] run tp @e[tag=camera, limit=1] ^1 ^1 ^2

execute store success score @a[tag=hunter] cam_destroy run clear @a[tag=hunter] minecraft:player_head{SkullOwner: {Id: [I; -1603909985, 514476567, -1545101897, -736314301], Properties: {textures: [{Value: "ewogICJ0aW1lc3RhbXAiIDogMTcwNzgzNTk1MTYwNSwKICAicHJvZmlsZUlkIiA6ICJhMDY2NDY5ZjFlYWE0YTE3YTNlNzlkYjdkNDFjYmM0MyIsCiAgInByb2ZpbGVOYW1lIiA6ICJFZG5hX0kiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDBhMWNkYzU0ZGI1NDViN2MwNzM0ZTNhOTI0Nzc2ZThiZDA1OTFiZDVkM2JiNzVkMzk5Zjg0YmEyOTE4ZDkzMSIKICAgIH0KICB9Cn0=", Signature: "VBb4Jo3mgvymA1j4KgOUc7PF8+U49HfVUc5rxX8AFxVv/DQ7NbJYSYh2fsj8thDecF1pSY/jVKmlfgA4cm0EhqFk1IEHQXnaMwZWB/nQW5DiFxOREQyNkU6hVPCuowsefDAbcKVQwpVYfE674msoyIpdrh2AMpf3TkSp6hAVlZ4Q1IwRvPdZMl9j5PrZDiNB08H7q/aRoR/zJpbhiqtLGOdygr/k8jv8zNk5dvqdJ7fI9yxwOCSGdw2zT0FZepSyTx6jJS7g5Pa5uZmn+qc5/YgO5chtYb9JeJ/AQw2Y7oQvNDoCbbfq2DlTsLFq8GdnFZz/lrV1cq7a7Khxppl6AnV8+8/CPtQivjlD+cQUHTmTXm6Vk1byeVUkCElXYf43dx8PEnv0E1oKeUl56Jz18dDqqkqZFVgdCx2PqxNd7yiK97C9FHCnnH/JRzcC5CGPM6y87yb23Peu6xhb0JEnLAfr3IO52v0LD5eRdB+eIR3TKYZ+++FgZSlMi7tDu2y3ACDhGY3nKuniaLhSKjkVqRkthEJyGiz9ZNm+lGWU67zcacZfKaYyXyDCoQDe5s+Z92otnxUz6u8H3mfwZeqdwTcLF0+X+k0ngJh2lNy+U1ZEibn2GRXu2PWfDHWIpUgfm0v/4RRfKVuzKgzgVpFEA/fIn1WCEJjBrwlxsiyx6Jw="}]}, Name: "Edna_I"}}
execute if entity @a[tag=hunter, scores={cam_destroy = 1}] run scoreboard players set @a cam_work 0
scoreboard players set @a[scores={cam_destroy = 1}] cam_destroy 0

# работа класса стан
execute store success score @a[scores={mode_boots = 6}] stun_reload run kill @e[type=minecraft:snowball]
execute as @a[scores={stun_reload = 1}] run kill @e[tag=stun]
scoreboard players set @a[scores={stun_reload = 1..}] stun_reload 0
execute at @a[scores={stun_used = 1..}] run summon minecraft:piglin ~ ~ ~ {NoAI:1b,PersistenceRequired:0b,CanPickUpLoot:0b,Silent:1,Age:0,ArmorItems:[{id:"minecraft:netherite_boots",Count:1},{id:"minecraft:netherite_leggings",Count:1},{},{}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Tags:["stun"]}
scoreboard players set @a[scores={stun_used = 1..}] stun_cd 100
scoreboard players set @a[scores={stun_used = 1..}] stun_live 600
# data modify entity @e[tag=stun,limit=1] Rotation set from entity @a[limit=1, scores={stun_cd = 95..}] Rotation
scoreboard players set @a[scores={stun_used = 1..}] stun_used 0
execute as @a[scores={killed_fake = 1..}] run scoreboard players set @a[scores={stun_live = 0..}] stun_live -1
effect give @a[tag=hunter, scores={killed_fake = 1..}] minecraft:darkness 3 50 true
effect give @a[tag=hunter, scores={killed_fake = 1..}] minecraft:slowness 3 50 true
effect give @a[tag=hunter, scores={killed_fake = 1..}] minecraft:jump_boost 3 128 true
execute as @a[scores={killed_fake = 1..}] run title @a[scores={mode_boots = 6}] actionbar {"text":"Stunned","bold":true,"color":"blue"}
scoreboard players set @a[scores={killed_fake = 1..}] killed_fake 0
scoreboard players remove @a[scores={stun_cd = 0..}] stun_cd 1
scoreboard players remove @a[scores={stun_live = 0..}] stun_live 1
give @a[scores={stun_cd = 0}] minecraft:snowball 1
execute as @a[scores={stun_live = 0}] run kill @e[tag=stun]
execute as @a[scores={stun_live = 0}] run title @a[scores={mode_boots = 6}] actionbar {"text":"Destroyed","bold":true,"color":"blue"}



# работа класса телепорт
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
# execute as @a[scores={tp_toggle = 1..}] at @s if entity @e[distance=..15, limit=1,tag=mark] run execute as @a[scores={tp_toggle = 1..}] run tp @s ~ ~ ~ ~ 0
give @a[scores={tp_toggle = 1..}] minecraft:ender_pearl 1
clear @a minecraft:bowl
# scoreboard players set @a[scores={tp_toggle = 1..}] tp_toggle 0
execute as @a[scores={mode_boots=7}] at @s if entity @e[distance=..15, limit=1,tag=mark] run scoreboard players set @s tp_near 1
execute as @e[tag=global, scores={game = 1}] run title @a[scores={mode_boots = 7, tp_near = 1}] actionbar {"text":"You can tp","bold":true,"color":"green"}
execute as @e[tag=global, scores={game = 1}] run title @a[scores={mode_boots = 7, tp_near = 0}] actionbar {"text":"","bold":true,"color":"green"}
scoreboard players set @a tp_near 0

# запретная зона для телепорта (центр церкви и верх церкви)
execute if entity @e[tag=mark, x=199, y = 70, z=-111, dx = 18, dy = 50, dz=30] run title @a[scores={mode_boots = 7}] actionbar {"text":"ABORTED","bold":true,"color":"red"}
kill @e[tag=mark, x=199, y = 70, z=-111, dx = 18, dy = 50, dz=30]
execute if entity @e[tag=mark, x = 185, dx = 46, y = 77, dy = 3, z = -93, dz = 8] run title @a actionbar {"text":"ABORTED","bold":true,"color":"red"}
kill @e[tag=mark, x = 185, dx = 46, y = 77, dy = 3, z = -93, dz = 8]

# поведение игры при чьй то смерти при выкл респавне и ловля победы хантера из-за смерти всех ботиночков
# PROBLEM!!! spawnpoint is wrong cause taking ~ ~ ~ from knowhere
# maybe the solve is at @s
execute as @a[tag=!hunter] at @a if entity @e[tag=global, scores={mode_respawn=0}] run spawnpoint @s ~ ~ ~

execute as @e[tag = global, scores={mode_respawn = 0}] run scoreboard players operation @a[tag=hunter, team=boots, scores={deaths=1..}] dead_cd = @e[tag=global, limit=1] dead_cd
effect give @a[tag=hunter,scores={dead_cd = 0..}] minecraft:speed infinite 3 true
effect give @a[tag=hunter,scores={dead_cd = 0..}] minecraft:strength infinite 50 true
execute as @a[tag=!hunter, team=boots, scores={deaths=1..}] if entity @e[tag=global, scores={mode_respawn = 0}] run scoreboard players remove @e[tag=timers] bootsCount 1
execute as @a[tag=!hunter, team=boots, scores={deaths=1..}] if entity @e[tag=global, scores={mode_respawn = 0}] run function fishhunter:spec
execute as @e[tag = global, scores={mode_respawn = 0}] run scoreboard players set @a[scores={deaths=1.., lost_fish = 0}] deaths 0
execute as @e[tag=timers,scores={bootsCount=0}] if entity @e[tag=global, scores={mode_respawn = 0}] run function fishhunter:hunter_win

# поведение игры при чьй то смерти при вкл респавне, тп на нужные места по кулдауну с выдачей всех эффектов
execute as @e[tag = global, scores={mode_respawn = 1}] run scoreboard players operation @a[scores={deaths=1..}] dead_cd = @e[tag=global, limit=1] dead_cd
execute as @e[tag = global, scores={mode_respawn = 1}] run effect give @a[tag=hunter,scores={deaths=1..}] minecraft:speed infinite 3 true
execute as @e[tag = global, scores={mode_respawn = 1}] run effect give @a[tag=hunter,scores={deaths=1..}] minecraft:strength infinite 50 true
execute as @e[tag = global, scores={mode_respawn = 1}] run scoreboard players set @a[scores={deaths=1.., lost_fish = 0}] deaths 0
scoreboard players remove @a[scores={dead_cd=0..}] dead_cd 1
effect give @a[scores={dead_cd=0..}] minecraft:invisibility infinite 1 true
execute at @a[tag=!hunter, scores={dead_cd=0}] run tp @a[tag=!hunter, scores={dead_cd=0}] 208 72 -90
execute at @a[tag=hunter, scores={dead_cd=0}] run tp @a[tag=hunter, scores={dead_cd=0}] 204 52 -89

scoreboard players set @a[tag=!hunter] lost_fish 0

# красивый текст на табличке
execute as @e[tag=global,scores={mode_respawn = 1}] run data modify block 188 8 -71 front_text.messages set value ['{"text":""}', '{"text":"Allow respawn:"}', '{"text":"ON", "color":"green"}', '{"text":""}']
execute as @e[tag=global,scores={mode_respawn = 0}] run data modify block 188 8 -71 front_text.messages set value ['{"text":""}', '{"text":"Allow respawn:"}', '{"text":"OFF", "color":"red"}', '{"text":""}']
data modify block 201 9 -71 front_text.messages set value ['{"text":""}', '{"score":{"name":"@e[tag=global,limit=1]","objective":"counter"}}', '{"text":""}', '{"text":""}']
data modify block 204 9 -73 front_text.messages set value ['{"text":""}', '{"score":{"name":"@e[tag=global,limit=1]","objective":"add_time"}}', '{"text":""}', '{"text":""}']
execute as @e[tag=global,limit=1,scores={class_toggle = 1}] run data modify block 187 8 -71 front_text.messages set value ['{"text":""}', '{"text":"Allow classes:"}', '{"text":"ON", "color":"green"}', '{"text":""}']
execute as @e[tag=global,limit=1,scores={class_toggle = 0}] run data modify block 187 8 -71 front_text.messages set value ['{"text":""}', '{"text":"Allow classes:"}', '{"text":"OFF", "color":"red"}', '{"text":""}']
execute as @e[tag=global,limit=1,scores={diff_chat = 1}] run data modify block 185 8 -74 front_text.messages set value ['{"text":"Different"}', '{"text":"Voicechats:"}', '{"text":"ON", "color":"green"}', '{"text":""}']
execute as @e[tag=global,limit=1,scores={diff_chat = 0}] run data modify block 185 8 -74 front_text.messages set value ['{"text":"Different"}', '{"text":"Voicechats:"}', '{"text":"OFF", "color":"red"}', '{"text":""}']
execute as @e[tag=global,scores={bow_toggle = 1}] run data modify block 187 14 -71 front_text.messages set value ['{"text":""}', '{"text":"Allow bow:"}', '{"text":"ON", "color":"green"}', '{"text":""}']
execute as @e[tag=global,scores={bow_toggle = 0}] run data modify block 187 14 -71 front_text.messages set value ['{"text":""}', '{"text":"Allow bow:"}', '{"text":"OFF", "color":"red"}', '{"text":""}']
data modify block 188 14 -71 front_text.messages set value ['{"text":""}', '{"text":"Arrows:"}', '{"score":{"name":"@e[tag=global,limit=1]","objective":"arrow_count"}}', '{"text":""}']
data modify block 185 14 -74 front_text.messages set value ['{"text":""}', '{"text":"Fishes:"}', '{"score":{"name":"@e[tag=global,limit=1]","objective":"tt0"}}', '{"text":""}']

# красивый таймер сверху
execute store result bossbar minecraft:timer value run scoreboard players get @e[tag=timers, limit=1] counter

# замена сломанных штанов и ботиночков
item replace entity @a[scores={br_boots = 1..}] armor.feet with minecraft:netherite_boots
scoreboard players set @a[scores={br_boots = 1..}] br_boots 0

item replace entity @a[scores={br_legs = 1..}] armor.legs with minecraft:netherite_leggings
scoreboard players set @a[scores={br_legs = 1..}] br_legs 0

# открытие сундука, если из него забрали рыбу
execute unless data block 218 71 -136 Items[0] run data merge block 218 71 -136 {Lock:""}
execute unless data block 124 83 -91 Items[0] run data merge block 124 83 -91 {Lock:""}
execute unless data block 148 80 -46 Items[0] run data merge block 148 80 -46 {Lock:""}
execute unless data block 154 78 -5 Items[0] run data merge block 154 78 -5 {Lock:""}
execute unless data block 237 82 -26 Items[0] run data merge block 237 82 -26 {Lock:""}
execute unless data block 241 81 -53 Items[0] run data merge block 241 81 -53 {Lock:""}
execute unless data block 264 78 -89 Items[0] run data merge block 264 78 -89 {Lock:""}
execute unless data block 272 83 -109 Items[0] run data merge block 272 83 -109 {Lock:""}
execute unless data block 173 75 -132 Items[0] run data merge block 173 75 -132 {Lock:""}
# кладбище
# тортики
# барби
# лягуха
# таверна
# гостиница
# уву
# ойвей
# бомжи

# костыль
effect give @a[scores={totem_used = 1..}] minecraft:invisibility infinite 1 true
scoreboard players set @a totem_used 0