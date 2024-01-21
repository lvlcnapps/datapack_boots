tellraw @s "Вот в каких домиках открыто:"
execute as @e[tag=levers, scores={gekko = 1}] run tellraw @a[scores={check = 1..}] {"text":"ящерица","color":"dark_green"}
execute as @e[tag=levers, scores={barbie = 1}] run tellraw @a[scores={check = 1..}] {"text":"барби","color":"#FC00FF"}
execute as @e[tag=levers, scores={elves = 1}] run tellraw @a[scores={check = 1..}] {"text":"эльфы","color":"green"}
execute as @e[tag=levers, scores={frog = 1}] run tellraw @a[scores={check = 1..}] {"text":"лягушка","color":"#6E905D"}
execute as @e[tag=levers, scores={bomj = 1}] run tellraw @a[scores={check = 1..}] {"text":"бомжи","color":"#4C1A1B"}

# tellraw @s "Вот в каких домиках закрыто:"
# execute as @e[tag=levers, scores={gekko = 0}] run tellraw @a[scores={check = 1..}] "GEKKO "
# execute as @e[tag=levers, scores={barbie = 0}] run tellraw @a[scores={check = 1..}] "BARBIE ON"
# execute as @e[tag=levers, scores={elves = 0}] run tellraw @a[scores={check = 1..}] "ELVES ON"
# execute as @e[tag=levers, scores={frog = 0}] run tellraw @a[scores={check = 1..}] "FROG ON"
# execute as @e[tag=levers, scores={bomj = 0}] run tellraw @a[scores={check = 1..}] "BOMJ ON"

scoreboard players set @s check 0