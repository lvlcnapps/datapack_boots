tellraw @s "Вот в каких домиках открыто:"
execute as @e[tag=levers, scores={gekko = 1}] run tellraw @a[scores={check = 1..}] {"text":"ящерица","color":"dark_green"}
execute as @e[tag=levers, scores={barbie = 1}] run tellraw @a[scores={check = 1..}] {"text":"барби","color":"#FC00FF"}
execute as @e[tag=levers, scores={elves = 1}] run tellraw @a[scores={check = 1..}] {"text":"эльфы","color":"green"}
execute as @e[tag=levers, scores={frog = 1}] run tellraw @a[scores={check = 1..}] {"text":"лягушка","color":"#6E905D"}
execute as @e[tag=levers, scores={bomj = 1}] run tellraw @a[scores={check = 1..}] {"text":"бомжи","color":"#4C1A1B"}
execute as @e[tag=levers, scores={guests = 1}] run tellraw @a[scores={check = 1..}] {"text":"гостиница","color":"gold"}

scoreboard players set @s check 0