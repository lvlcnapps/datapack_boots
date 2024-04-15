# исправлено под счетчик 2.0
scoreboard players set @e[tag=global] winner 0
scoreboard players set @e[tag=global] tt1 0

function fishhunter:logging

# восстановление рыбов, кулдаун после которого автореколл и очистка одной из переменных, чтоб не лагало
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
scoreboard players operation @e[tag=timers] cooldown = @e[tag=global, limit=1] cooldown
scoreboard players set @e[tag=timers] bootsCount -1

# красевый тайтл
title @a title {"text":"Hunter Win","color":"red"}