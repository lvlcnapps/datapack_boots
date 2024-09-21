execute at @e[type = minecraft:area_effect_cloud, limit = 1, tag=!blocked] run summon area_effect_cloud ~ ~ ~ {Particle:ambient_entity_effect,Color:11730967,Potion:strong_strength,Radius:5,Duration:400,Tags:["blocked"]}
execute at @e[type = minecraft:area_effect_cloud, limit = 1, tag=!blocked] run summon area_effect_cloud ~ ~-1 ~ {Particle:ambient_entity_effect,Color:11730967,Potion:strong_strength,Radius:5,Duration:400,Tags:["blocked"]}
tag @e[type=minecraft:area_effect_cloud] add blocked
scoreboard players set @a[tag=hunter, scores={mode_hunters = 4, striker_used = 1..}] striker_used 0