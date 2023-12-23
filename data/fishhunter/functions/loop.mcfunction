execute as @a[scores={lol=1}] run function fishhunter:test

scoreboard players remove @a[tag=hunter, scores={counter=0..}] counter 1
execute as @a[scores={counter=0}] run function fishhunter:hunter_win

execute as @e[type=item, nbt={Item: {id:"minecraft:pufferfish", Count: 1b}, Age: 50s}] run function fishhunter:remove_fish

execute as @p[tag=hunter, scores={fish=..4}] run function fishhunter:hunter_win

execute store success score @a[tag=hunter] fish_win run clear @a[tag=hunter] minecraft:pufferfish
execute as @p[tag=hunter, scores={fish_win = 1}] run function fishhunter:remove_fish

execute store success score @a[tag=!hunter, x = 207, y = 74, z = -110, dx = 2, dy = 1, dz = 1] fish_add run clear @a[tag=!hunter, x = 207, y = 74, z = -110, dx = 2, dy = 1, dz = 1, scores={fish_add = 0}] minecraft:pufferfish 1
scoreboard players add @a[scores={fish_add = 1}] fishCount 1
execute as @p[scores={fish_add = 1}] run function fishhunter:add_fish

execute as @p[tag=hunter, scores={counter=..500}] run bossbar set minecraft:timer color red
execute as @p[tag=hunter, scores={counter=500..1500}] run bossbar set minecraft:timer color yellow
execute as @p[tag=hunter, scores={counter=1500..}] run bossbar set minecraft:timer color green

execute at @a[x=199, y=73, z=-98, dx=0,dy=2,dz=16, tag=hunter] run tp @a[x=199, y=73, z=-98, dx=0,dy=2,dz=16, tag=hunter] ~-1 ~ ~
execute at @a[x=217, y=73, z=-98, dx=0,dy=2,dz=16, tag=hunter] run tp @a[x=217, y=73, z=-98, dx=0,dy=2,dz=16, tag=hunter] ~1 ~ ~
execute at @a[x=200, y=73, z=-81, dx=16,dy=2,dz=0, tag=hunter] run tp @a[x=200, y=73, z=-81, dx=16,dy=2,dz=0, tag=hunter] ~ ~ ~1

scoreboard players remove @a[tag=hunter, scores={cooldown=0..}] cooldown 1
execute as @a[scores={cooldown=0}] run function fishhunter:refresh

execute store success score @a[tag=!hunter, scores={deaths=1..}] lost_fish run clear @a[tag=!hunter, scores={deaths=1.., lost_fish = 0}] minecraft:pufferfish 1
execute as @p[tag=!hunter, scores={lost_fish = 1}] run function fishhunter:remove_fish

#scoreboard players set @a[tag=hunter, scores={mode_respawn = 0, deaths=1..}] dead_cd 200
scoreboard players operation @a[tag=hunter, scores={mode_respawn = 0, deaths=1..}] dead_cd = @e[tag=global, limit=1] dead_cd
effect give @a[tag=hunter,scores={dead_cd = 0..}] minecraft:speed infinite 3 true
effect give @a[tag=hunter,scores={dead_cd = 0..}] minecraft:strength infinite 50 true
execute as @a[tag=!hunter, scores={mode_respawn = 0, deaths=1..}] run scoreboard players remove @a bootsCount 1
execute as @a[tag=!hunter, scores={mode_respawn = 0, deaths=1..}] run function fishhunter:spec
scoreboard players set @a[scores={mode_respawn = 0, deaths=1..}] deaths 0
execute as @a[scores={mode_respawn = 0, bootsCount=0}] run function fishhunter:hunter_win

#scoreboard players set @a[scores={mode_respawn = 1, deaths=1..}] dead_cd 200
scoreboard players operation @a[scores={mode_respawn = 1, deaths=1..}] dead_cd = @e[tag=global, limit=1] dead_cd
# effect give @a[scores={mode_respawn = 1, deaths=1..}] minecraft:invisibility infinite 1 true
effect give @a[tag=hunter,scores={mode_respawn = 1, deaths=1..}] minecraft:speed infinite 3 true
effect give @a[tag=hunter,scores={mode_respawn = 1, deaths=1..}] minecraft:strength infinite 50 true
scoreboard players set @a[scores={mode_respawn = 1, deaths=1..}] deaths 0
scoreboard players remove @a[scores={dead_cd=0..}] dead_cd 1
effect give @a[scores={dead_cd=0..}] minecraft:invisibility infinite 1 true
execute at @a[tag=!hunter, scores={dead_cd=0}] run tp @a[tag=!hunter, scores={dead_cd=0}] 208 72 -90
execute at @a[tag=hunter, scores={dead_cd=0}] run tp @a[tag=hunter, scores={dead_cd=0}] 204 52 -89

execute as @p[scores={mode_respawn = 1}] run data modify block 216 53 -91 front_text.messages set value ['{"text":""}', '{"text":"Allow respawn:"}', '{"text":"ON", "color":"green"}', '{"text":""}']
execute as @p[scores={mode_respawn = 0}] run data modify block 216 53 -91 front_text.messages set value ['{"text":""}', '{"text":"Allow respawn:"}', '{"text":"OFF", "color":"red"}', '{"text":""}']

execute store result bossbar minecraft:timer value run scoreboard players get @p[tag=hunter] counter