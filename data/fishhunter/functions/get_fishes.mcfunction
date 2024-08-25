execute store success score @s save_fish_trigger run clear @s minecraft:pufferfish 1
execute as @p[scores={save_fish_trigger = 1}] run scoreboard players add @s save_fish_count 1
execute as @p[scores={save_fish_trigger = 1}] run function fishhunter:get_fishes