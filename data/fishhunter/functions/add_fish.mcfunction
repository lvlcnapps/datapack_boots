# разрешить снова удалять рыбу и добавить рыбу к общему числу # исправлено под счетчик 2.0
scoreboard players set @a[tag=hunter] fish_add 0
scoreboard players remove @e[tag=global] tt4 1
#scoreboard players add @a fish_counter 1
# добавление времени за принос рыбы, берется у курицы с тегом глобал
scoreboard players operation @e[tag=timers] counter += @e[tag=global, limit=1] add_time

execute if entity @e[tag=global,scores={tt4 = 8}] positioned 208 74 -109 as @p[team=boots] run say еще 8 рыбри
execute if entity @e[tag=global,scores={tt4 = 7}] positioned 208 74 -109 as @p[team=boots] run say еще 7 рыбов
execute if entity @e[tag=global,scores={tt4 = 6}] positioned 208 74 -109 as @p[team=boots] run say еще 6 рыбув
execute if entity @e[tag=global,scores={tt4 = 5}] positioned 208 74 -109 as @p[team=boots] run say еще 5 рыбер
execute if entity @e[tag=global,scores={tt4 = 4}] positioned 208 74 -109 as @p[team=boots] run say еще 4 рыбра
execute if entity @e[tag=global,scores={tt4 = 3}] positioned 208 74 -109 as @p[team=boots] run say еще 3 рыбив
execute if entity @e[tag=global,scores={tt4 = 2}] positioned 208 74 -109 as @p[team=boots] run say еще 2 рыбао
execute if entity @e[tag=global,scores={tt4 = 1}] positioned 208 74 -109 as @p[team=boots] run say еще 1 рыбим
execute if entity @e[tag=global,scores={tt4 = 0}] positioned 208 74 -109 as @p[team=boots] run function fishhunter:boots_win