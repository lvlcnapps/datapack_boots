say refresh
# полная очистка всех переменных
scoreboard players set @a counter -1
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
scoreboard players set @a fish_win 0
scoreboard players set @a fish_add 0
scoreboard players set @a fish_counter 0
scoreboard players set @a cooldown -1
scoreboard players set hhuy mode_respawn -1
scoreboard players set @a dead_cd -1
scoreboard players set @a bootsCount -1
execute store result score @a mode_respawn run scoreboard players get @p[scores={mode_respawn=0..1}] mode_respawn
scoreboard players set @e[tag=global] game 0
scoreboard players set @a tank_relo 0
scoreboard players set @a tank_live -1
scoreboard players set @a tank_cd -1

# чистка вещей, эффектов и тегов
clear @a
effect clear @a
tag @a remove hunter

# тп на нужное место с параметром
tp @a 214 52 -101
gamemode adventure @a

# выдача предметов выбора класса
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.0 with minecraft:lapis_lazuli{display:{Name:'[{"text":"Полуинвиз","italic":false, "color":"green"}]'}} 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.1 with minecraft:feather{display:{Name:'[{"text":"Скорость","italic":false, "color":"green"}]'}} 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.2 with minecraft:rabbit_foot{display:{Name:'[{"text":"Прыгун","italic":false, "color":"green"}]'}} 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.3 with minecraft:heart_of_the_sea{display:{Name:'[{"text":"Танк","italic":false, "color":"green"}]'}} 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.4 with minecraft:clock{display:{Name:'[{"text":"Радар","italic":false, "color":"green"}]'}} 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.5 with minecraft:diamond{display:{Name:'[{"text":"-не работает-","italic":false, "color":"red"}]'}} 1