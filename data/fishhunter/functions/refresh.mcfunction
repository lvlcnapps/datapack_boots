tag @a remove hunter
scoreboard players set @e[tag=timers] counter -1
scoreboard players set @a fish_add_burj 0
scoreboard players set @a fish_add_bur 0
scoreboard players set @a fish_add_pump 0
scoreboard players set @e[tag=handle_sushi] cooking_time -2
scoreboard players set @e[tag=data] choice_tp_boots 0
scoreboard players set @e[tag=data] cd_spawn -1
scoreboard players set @a tp_reload -1
scoreboard players set @e[tag=timers] bootsCount 1
scoreboard players set @a ignite 0
scoreboard players set @e[tag=data] game 0
execute as @a run attribute @s minecraft:generic.step_height base set 0.6

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

# выдача предметов выбора класса
execute as @e[tag=data, scores={class_toggle = 1}] run item replace entity @a hotbar.0 with minecraft:lapis_lazuli[minecraft:custom_name='{"text":"Полуинвиз","italic":false, "color":"green"}'] 1
execute as @e[tag=data, scores={class_toggle = 1}] run item replace entity @a hotbar.1 with minecraft:feather[minecraft:custom_name='{"text":"Скорость","italic":false, "color":"green"}'] 1
execute as @e[tag=data, scores={class_toggle = 1}] run item replace entity @a hotbar.2 with minecraft:rabbit_foot[minecraft:custom_name='{"text":"Ползун","italic":false, "color":"green"}'] 1
execute as @e[tag=data, scores={class_toggle = 1}] run item replace entity @a hotbar.3 with minecraft:blaze_powder[minecraft:custom_name='{"text":"Спецкласс Телепорт","italic":false, "color":"blue"}'] 1
execute as @e[tag=data, scores={class_toggle = 1}] run item replace entity @a hotbar.4 with minecraft:weeping_vines[minecraft:custom_name='{"text":"Спецкласс Дублёр","italic":false, "color":"blue"}'] 1
execute as @e[tag=data, scores={class_toggle = 1}] run item replace entity @a hotbar.5 with minecraft:nether_star[minecraft:custom_name='{"text":"Спецкласс Хамелеон","italic":false, "color":"blue"}'] 1
execute as @e[tag=data, scores={class_toggle = 1}] run item replace entity @a hotbar.8 with minecraft:diamond[minecraft:custom_name='{"text":"-не работает-","italic":false, "color":"red"}'] 1