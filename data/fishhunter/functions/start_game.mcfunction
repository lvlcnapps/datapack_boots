say start

# очистка стоек в борделе
kill @e[type=minecraft:armor_stand, x = 123, dx = 15, y = 73, dy = 10, z = -96, dz = 11]

# обновление карты
function fishhunter:update_map

spawnpoint @a 207 52 -99

# релоад боссбара
bossbar set minecraft:timer players sdsdcc2442
bossbar set minecraft:timer players @a

execute store result score @e[tag=global] arrow_giver run scoreboard players get @e[tag=global, limit=1] arrow_count
scoreboard players set @e[tag=global] game 1
clear @a

# назначить игроков в комнате хантерами
# tag @a[x = 212, y = 52, z = -96, dx = 5, dy = 3, dz = 6] add hunter
tag @a[x=184, y=7, z=-111, dx=21, dy=10, dz=41] add hunter

# посчитать количество ботиночков перед игрой
scoreboard players set @e[tag=timers] bootsCount -1
execute as @a[tag=!hunter] run scoreboard players add @e[tag=timers] bootsCount 1
scoreboard players add @e[tag=timers] bootsCount 1

# выдача амуниции и эффектов всем подряд
effect give @a minecraft:invisibility infinite 1 true
gamemode adventure @a
item replace entity @a armor.feet with minecraft:netherite_boots
item replace entity @a[scores={mode_boots = ..0}] armor.legs with minecraft:netherite_leggings
item replace entity @a[scores={mode_boots = 3..}] armor.legs with minecraft:netherite_leggings
item replace entity @a[scores={mode_boots = 2}] armor.legs with minecraft:netherite_leggings{display:{Name:'[{"text":"SPEEEEEED","italic":false}]'},Enchantments:[{id:swift_sneak,lvl:255}]}
item replace entity @a[tag=hunter] armor.legs with minecraft:netherite_leggings
item replace entity @a[tag=hunter] armor.chest with minecraft:netherite_chestplate
item replace entity @a[tag=hunter] armor.head with minecraft:wither_skeleton_skull
execute as @a[tag=hunter] run function fishhunter:make_skin
effect give @a[tag=hunter] minecraft:speed infinite 3 true
effect give @a[tag=hunter] minecraft:strength infinite 50 true
give @a[tag=hunter] netherite_sword{display:{Name:'[{"text":"Мечъ","italic":false}]'},Enchantments:[{id:sharpness,lvl:100}]} 1
execute if entity @e[tag=global, scores={bow_toggle = 1}] run give @a[tag=hunter] minecraft:bow{display:{Name:'[{"text":"Калаш","italic":false}]'},Enchantments:[{id:power,lvl:255}]} 1
execute if entity @e[tag=global, scores={arrow_count = 1..}] run 
give @a carrot_on_a_stick{display:{Name:'[{"text":"Датчик","italic":false}]'},RepairCost:1,Unbreakable:1b,Damage:1} 1
give @a[tag=!hunter, scores={mode_boots = 4}] minecraft:honey_bottle 1
give @a[tag=!hunter, scores={mode_boots = 5}] minecraft:warped_fungus_on_a_stick 1
give @p[tag=!hunter, scores={mode_boots = 6}] minecraft:snowball 1
give @p[tag=!hunter, scores={mode_boots = 7}] minecraft:ender_pearl 1
give @p[tag=!hunter, scores={mode_boots = 7}] minecraft:suspicious_stew 1
give @p[tag=!hunter, scores={mode_boots = 8}] minecraft:warped_fungus_on_a_stick 1
give @p[tag=!hunter, scores={mode_boots = 8}] minecraft:ender_eye 1
execute as @e[tag=global, scores={mode_respawn = 0}] run fill 205 52 -90 203 54 -88 glass

# тп на нужные места - ботиночки в церковь, хантеры в хаб
tp @a[tag=!hunter] 208 72 -90
tp @a[tag=hunter] 204 52 -89

execute as @e[tag=global, scores={mode_respawn = 0}] run schedule function fishhunter:let_hunter_go 10s replace

# подгрузка значения рыб и настройка счетчиков
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
scoreboard players set @a fish_counter 0

# настройка глобального счетчика времени и максимального значения боссбара
execute store result score @e[tag=timers] counter run scoreboard players get @e[tag=global, limit=1] counter
execute store result bossbar minecraft:timer max run scoreboard players get @e[tag=global,limit=1] counter

team join hunter @a[tag=hunter]
team join boots @a[tag=!hunter]

execute store result score @e[tag=global] bootsCount run scoreboard players get @e[tag=timers, limit=1] bootsCount