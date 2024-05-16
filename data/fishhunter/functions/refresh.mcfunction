say refresh
# полная очистка всех переменных
scoreboard players set @e[tag=timers] counter -1
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
scoreboard players set @a fish_win 0
scoreboard players set @a fish_add 0
scoreboard players set @a fish_counter 0
scoreboard players set @e[tag=timers] cooldown -1
scoreboard players set hhuy mode_respawn -1
scoreboard players set hhuy diff_chat -1
scoreboard players set @a dead_cd -1
scoreboard players set @e[tag=timers] bootsCount -1
# execute store result score @a mode_respawn run scoreboard players get @p[scores={mode_respawn=0..1}] mode_respawn
scoreboard players set @e[tag=global] game 0
scoreboard players set @a tank_relo 0
scoreboard players set @a tank_live -1
scoreboard players set @a tank_cd -1
scoreboard players set @a radar_reload -1
scoreboard players set @a stun_reload -1
scoreboard players set @a tp_reload -1
scoreboard players set @a cam_cd -1
scoreboard players set @a cam_change 0
scoreboard players set @a cam_destroy 0
scoreboard players set @a cam_mode 0
scoreboard players set @a cam_reload 0
scoreboard players set @a cam_timer 0
scoreboard players set @a cam_use 0
scoreboard players set @a cam_work 1
scoreboard players set @e[tag=global] tt1 0
scoreboard players operation @e[tag=global] tt4 = @e[tag=global] tt0
scoreboard players set @a trig_ravine 0
execute as @a run attribute @s minecraft:generic.step_height base set 0.6

# чистка вещей, эффектов и тегов
clear @a
effect clear @a
tag @a remove hunter
bossbar set minecraft:timer players dgdg

# тп на нужное место с параметром
tp @a 195 0 -100
gamemode adventure @a
team join Lobby @a

# выдача предметов выбора класса
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.0 with minecraft:lapis_lazuli[minecraft:custom_name='{"text":"Полуинвиз","italic":false, "color":"green"}'] 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.1 with minecraft:feather[minecraft:custom_name='{"text":"Скорость","italic":false, "color":"green"}'] 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.2 with minecraft:rabbit_foot[minecraft:custom_name='{"text":"Прыгун","italic":false, "color":"green"}'] 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.3 with minecraft:heart_of_the_sea[minecraft:custom_name='{"text":"Танк","italic":false, "color":"green"}'] 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.4 with minecraft:clock[minecraft:custom_name='{"text":"Спецкласс Радар","italic":false, "color":"blue"}'] 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.5 with minecraft:amethyst_shard[minecraft:custom_name='{"text":"Спецкласс Стан","italic":false, "color":"blue"}'] 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.6 with minecraft:blaze_powder[minecraft:custom_name='{"text":"Спецкласс Телепорт","italic":false, "color":"blue"}'] 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.7 with minecraft:music_disc_wait[minecraft:custom_name='{"text":"Спецкласс Наблюдатель","italic":false, "color":"blue"}'] 1
execute as @e[tag=global, scores={class_toggle = 1}] run item replace entity @a hotbar.8 with minecraft:diamond[minecraft:custom_name='{"text":"-не работает-","italic":false, "color":"red"}'] 1