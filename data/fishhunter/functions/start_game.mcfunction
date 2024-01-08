say start

# очистка стоек в борделе
kill @e[type=minecraft:armor_stand, x = 123, dx = 15, y = 73, dy = 10, z = -96, dz = 11]

# обновление карты
function fishhunter:update_map

spawnpoint @a 207 52 -99

# релоад боссбара
bossbar set minecraft:timer players sdsdcc2442
bossbar set minecraft:timer players @a

scoreboard players set @e[tag=global] game 1
clear @a

# назначить игроков в комнате хантерами
tag @a[x = 212, y = 52, z = -96, dx = 5, dy = 3, dz = 6] add hunter

# посчитать количество ботиночков перед игрой
scoreboard players set @a bootsCount -1
execute as @a[tag=!hunter] run scoreboard players add @a bootsCount 1
scoreboard players add @a bootsCount 1

# выдача амуниции и эффектов всем подряд
effect give @a minecraft:invisibility infinite 1 true
gamemode adventure @a
item replace entity @a armor.feet with minecraft:netherite_boots
item replace entity @a[scores={mode_boots = ..0}] armor.legs with minecraft:netherite_leggings
item replace entity @a[scores={mode_boots = 2..}] armor.legs with minecraft:netherite_leggings
item replace entity @a[tag=hunter] armor.legs with minecraft:netherite_leggings
item replace entity @a[tag=hunter] armor.chest with minecraft:netherite_chestplate
item replace entity @a[tag=hunter] armor.head with minecraft:wither_skeleton_skull
effect give @a[tag=hunter] minecraft:speed infinite 3 true
effect give @a[tag=hunter] minecraft:strength infinite 50 true
give @a[tag=hunter] netherite_sword{display:{Name:'[{"text":"Мечъ","italic":false}]'},Enchantments:[{id:sharpness,lvl:100}]} 1
give @a[tag=!hunter, scores={mode_boots = 4}] minecraft:honey_bottle 1
give @a[tag=!hunter, scores={mode_boots = 5}] minecraft:experience_bottle 1

execute as @p[scores={mode_respawn = 0}] run fill 205 52 -90 203 54 -88 glass

# тп на нужные места - ботиночки в церковь, хантеры в хаб
tp @a[tag=!hunter] 208 72 -90
tp @a[tag=hunter] 204 52 -89

execute as @p[scores={mode_respawn = 0}] run schedule function fishhunter:let_hunter_go 10s replace

# подгрузка значения рыб и настройка счетчиков
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
scoreboard players set @a fish_counter 0

# настройка глобального счетчика времени и максимального значения боссбара
execute store result score @a[tag=hunter] counter run scoreboard players get @e[tag=global, limit=1] counter
execute store result bossbar minecraft:timer max run scoreboard players get @p[tag=hunter] counter

# 1) полуинвиз, видно только ботинки, нету штанов
# 2) быстрый чел speed 1
# 3) паркурист, высокие прыжки
# 4) чел танк
# 5) телепорты
# 6) радар (в некотором радиусе по нажатию кнопки будет подсвечивать хантера, в случае, если хантер не нашелся, подсветится сам)

# /summon minecraft:item_frame ~ ~ ~ {Rotation:[0.0f, -90.f], Facing:1b, Invisible: 1b, Item:{id: "minecraft:raw_gold_block", Count: 1b}}
# /kill @e[nbt= {Rotation:[0.0f, -90.f], Facing:1b, Invisible: 1b, Item:{id: "minecraft:raw_gold_block", Count: 1b}}]
# scoreboard players set @a nearTP 0
# execute as @a at @s if entity @e[distance=..7, limit=1,nbt= {Facing:1b, Invisible: 1b, Item:{id: "minecraft:raw_gold_block", Count: 1b}}] run scoreboard players set @s nearTP 1
