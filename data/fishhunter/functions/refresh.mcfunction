say refresh
scoreboard players set @a counter -1
scoreboard players set @a fish 7
scoreboard players set @a fish_win 0
scoreboard players set @a fish_add 0
scoreboard players set @a fish_counter 0
scoreboard players set @a cooldown -1
scoreboard players set hhuy mode_respawn -1
scoreboard players set @a dead_cd -1
execute store result score @a mode_respawn run scoreboard players get @p[scores={mode_respawn=0..1}] mode_respawn

clear @a
effect clear @a
tag @a remove hunter

tp @a 214 52 -101
gamemode adventure @a