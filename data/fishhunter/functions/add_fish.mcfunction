scoreboard players set @a[tag=hunter] fish_add 0
scoreboard players add @a fish_counter 1
scoreboard players add @a[tag=hunter] counter 1200

execute as @p[scores={fish_counter = 1}] run say еще 4 рыбра
execute as @p[scores={fish_counter = 2}] run say еще 3 рыбив
execute as @p[scores={fish_counter = 3}] run say еще 2 рыбао
execute as @p[scores={fish_counter = 4}] run say еще 1 рыбим
execute as @p[scores={fish_counter = 5}] run function fishhunter:boots_win