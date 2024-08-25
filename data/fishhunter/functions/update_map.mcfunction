# ================ ДОМИКИ ================ #
# подземелья / замок
setblock 450 -4 -525 minecraft:redstone_block destroy

# суши бар
setblock 399 2 -547 minecraft:redstone_block destroy

# фабрика
setblock 382 2 -684 minecraft:redstone_block destroy

# шизодом
setblock 538 15 -654 minecraft:redstone_block destroy

# бордель
fill 528 -5 -590 528 -5 -593 minecraft:redstone_block destroy

# теплица
setblock 425 -15 -602 minecraft:redstone_block destroy

# грибильня
setblock 449 -12 -649 minecraft:redstone_block destroy

# бурж
setblock 395 12 -601 minecraft:redstone_block destroy

# свинина
setblock 493 7 -569 minecraft:redstone_block destroy

# изумрудный дом
setblock 352 6 -635 minecraft:redstone_block destroy

# ================ ДИНАМИТ ================ #

# теплица - динамит
setblock 431 -15 -603 minecraft:redstone_block destroy

# грибы - динамит
setblock 426 14 -692 minecraft:redstone_block destroy

# фабрика - динамит
setblock 386 -1 -693 minecraft:redstone_block destroy

# бордель - динамит
setblock 525 -5 -590 minecraft:redstone_block destroy

# замок - динамит
setblock 458 12 -553 minecraft:redstone_block destroy

# ================ ЗАЖИГАЛКИ ================ #

# церковь
setblock 395 12 -598 minecraft:redstone_block destroy

# склеп
setblock 429 -6 -657 minecraft:redstone_block destroy

# рельсы
setblock 379 7 -687 minecraft:redstone_block destroy





# ================ УБИВАЕМ ДРОП ================ #

kill @e[tag=mark]

schedule function fishhunter:delete_shit 5s replace
schedule function fishhunter:delete_shit 10s replace

say cleaning