# перевод игрока в режим спектатора, если респавн отключен, обнуление его смертей
gamemode spectator
execute as @a[scores={mode_respawn = 0, deaths=1..}] run scoreboard players set @a[scores={mode_respawn = 0, deaths=1..}] deaths 0