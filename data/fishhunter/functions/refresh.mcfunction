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

# чистка вещей, эффектов и тегов
clear @a
effect clear @a
tag @a remove hunter

# тп на нужное место с параметром
tp @a 214 52 -101
gamemode adventure @a