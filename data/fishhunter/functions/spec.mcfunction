# перевод игрока в режим спектатора, если респавн отключен, обнуление его смертей
gamemode spectator
team join specs

#execute as @a[scores={mode_respawn = 0, deaths=1..}] run scoreboard players set @a[scores={mode_respawn = 0, deaths=1..}] deaths 0
execute as @a[scores={deaths=1..}] if entity @e[scores={mode_respawn = 0}] run scoreboard players set @a[scores={deaths=1..}] deaths 0