function fishhunter:logging

# текст
tellraw @a "рыбы мои рыбы"

# вернуть рыб в изначальное положение, чтобы игра не выдавала вечно победу хантеру
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
# кулдаун, после которого всех телепортирует в хаб
scoreboard players operation @e[tag=timers] cooldown = @e[tag=global, limit=1] cooldown

# красивый тайтл на весь экран
title @a title {"text":"Boots Win","color":"green"}