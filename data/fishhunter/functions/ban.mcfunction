# закроем все сундуки на дефолтный ключ
function fishhunter:open_all_fishes

# на основе переменной делаем бан определенной рыбы
execute as @e[tag=global, scores={key_banned_fish = 1}] run data merge block 218 71 -136 {Lock:"locked11"}
execute as @e[tag=global, scores={is_anon_ban = 0,key_banned_fish = 1}] run tellraw @a "Забанено Кладбище"


execute as @e[tag=global, scores={key_banned_fish = 2}] run data merge block 154 78 -5 {Lock:"locked11"}
execute as @e[tag=global, scores={key_banned_fish = 2}] run data merge block 272 83 -109 {Lock:"locked11"}
execute as @e[tag=global, scores={is_anon_ban = 0,key_banned_fish = 2}] run tellraw @a "Забанены Ойвей и Лягушки"

execute as @e[tag=global, scores={key_banned_fish = 3}] run data merge block 148 80 -46 {Lock:"locked11"}
execute as @e[tag=global, scores={key_banned_fish = 3}] run data merge block 264 78 -89 {Lock:"locked11"}
execute as @e[tag=global, scores={is_anon_ban = 0,key_banned_fish = 3}] run tellraw @a "Забанены Уву и Барби"

execute as @e[tag=global, scores={key_banned_fish = 4}] run data merge block 124 83 -91 {Lock:"locked11"}
execute as @e[tag=global, scores={key_banned_fish = 4}] run data merge block 241 81 -53 {Lock:"locked11"}
execute as @e[tag=global, scores={is_anon_ban = 0,key_banned_fish = 4}] run tellraw @a "Забанены Гостиница и Тортики"

execute as @e[tag=global, scores={key_banned_fish = 5}] run data merge block 237 82 -26 {Lock:"locked11"}
execute as @e[tag=global, scores={key_banned_fish = 5}] run data merge block 173 75 -132 {Lock:"locked11"}
execute as @e[tag=global, scores={is_anon_ban = 0,key_banned_fish = 5}] run tellraw @a "Забанены Таверна и Бомжи"