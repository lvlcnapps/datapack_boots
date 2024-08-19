tag @a remove hunter
scoreboard players set @e[tag=timers] counter -1
scoreboard players set @a fish_add 0
scoreboard players set @e[tag=handle_sushi] cooking_time -2
scoreboard players set @e[tag=data] choice_tp_boots 0
scoreboard players set @e[tag=data] cd_spawn -1
scoreboard players set @e[tag=timers] bootsCount 1
scoreboard players set @a ignite 0

gamemode adventure @a
tp @a 465 43 -622
fill 490 47 -619 490 47 -625 minecraft:redstone_block

clear @a
effect clear @a

function fishhunter:update_map

fill 477 77 -623 477 77 -621 minecraft:quartz_block
fill 477 78 -623 477 80 -621 anvil
setblock 489 78 -625 air
setblock 488 78 -620 air
setblock 485 78 -616 air
setblock 478 78 -624 air