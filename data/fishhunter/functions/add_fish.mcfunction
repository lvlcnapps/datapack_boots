# разрешить снова удалять рыбу и добавить рыбу к общему числу # исправлено под счетчик 2.0
scoreboard players set @a[tag=!hunter] fish_add_burj 0
scoreboard players set @a[tag=!hunter] fish_add_bur 0
scoreboard players set @a[tag=!hunter] fish_add_pump 0
scoreboard players remove @e[tag=timers] fish_all 1
#scoreboard players add @a fish_counter 1
# добавление времени за принос рыбы, берется у курицы с тегом глобал
scoreboard players operation @e[tag=timers] counter += @e[tag=data, limit=1] add_time

execute as @s if entity @e[tag=timers, scores={fish_all = 8}] run say 8
execute as @s if entity @e[tag=timers, scores={fish_all = 7}] run say 7
execute as @s if entity @e[tag=timers, scores={fish_all = 6}] run say 6
execute as @s if entity @e[tag=timers, scores={fish_all = 5}] run say 5
execute as @s if entity @e[tag=timers, scores={fish_all = 4}] run say 4
execute as @s if entity @e[tag=timers, scores={fish_all = 3}] run say 3
execute as @s if entity @e[tag=timers, scores={fish_all = 2}] run say 2
execute as @s if entity @e[tag=timers, scores={fish_all = 1}] run say 1
execute as @s if entity @e[tag=timers, scores={fish_all = 0}] run function fishhunter:boots_win