say start

# очистка стоек в борделе
kill @e[type=minecraft:armor_stand, x = 123, dx = 15, y = 73, dy = 10, z = -96, dz = 11]
kill @e[type=minecraft:block_display, x=233, y=77, z=-37]

# обновление карты
function fishhunter:update_map

scoreboard players set @e[tag=global] tt1 0
scoreboard players operation @e[tag=global] tt4 = @e[tag=global] tt0

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

# # выдача амуниции и эффектов всем подряд
effect give @a minecraft:invisibility infinite 1 true
gamemode adventure @a
item replace entity @a armor.feet with minecraft:netherite_boots
item replace entity @a[scores={mode_boots = ..0}] armor.legs with minecraft:netherite_leggings
item replace entity @a[scores={mode_boots = 3..}] armor.legs with minecraft:netherite_leggings
item replace entity @a[scores={mode_boots = 2}] armor.legs with minecraft:netherite_leggings[minecraft:custom_name='[{"text":"SPEEEEEED","italic":false}]',minecraft:enchantments={levels: {"swift_sneak": 255}}]
item replace entity @a[tag=hunter] armor.legs with minecraft:netherite_leggings
item replace entity @a[tag=hunter] armor.chest with minecraft:netherite_chestplate
item replace entity @a[tag=hunter] armor.head with minecraft:wither_skeleton_skull
# execute as @a[tag=hunter] run function fishhunter:make_skin
effect give @a[tag=hunter] minecraft:speed infinite 3 true
effect give @a[tag=hunter] minecraft:strength infinite 50 true
give @a[tag=hunter] netherite_sword[minecraft:custom_name='[{"text":"Мечъ","italic":false}]',minecraft:enchantments={levels: {"sharpness": 255}}] 1
execute if entity @e[tag=global, scores={bow_toggle = 1}] run give @a[tag=hunter] minecraft:bow[minecraft:custom_name='[{"text":"Калаш","italic":false}]', minecraft:enchantments={levels: {"power": 255}}] 1
give @a carrot_on_a_stick[minecraft:custom_name='[{"text":"Датчик","italic":false}]', minecraft:custom_data={RepairCost:1,Unbreakable:1b,Damage:1}] 1
give @a[tag=!hunter, scores={mode_boots = 4}] minecraft:honey_bottle 1
give @p[tag=!hunter, scores={mode_boots = 5}] minecraft:warped_fungus_on_a_stick 1
give @p[tag=!hunter, scores={mode_boots = 6}] minecraft:snowball 1
give @p[tag=!hunter, scores={mode_boots = 7}] minecraft:ender_pearl 1
give @p[tag=!hunter, scores={mode_boots = 7}] minecraft:suspicious_stew 1
give @p[tag=!hunter, scores={mode_boots = 8}] minecraft:warped_fungus_on_a_stick 1
give @p[tag=!hunter, scores={mode_boots = 8}] minecraft:ender_eye 1
execute as @e[tag=global, scores={mode_respawn = 0}] run fill 205 52 -90 203 54 -88 glass
give @a[tag=!hunter] tripwire_hook[minecraft:custom_name='{"text":"Chest Key","color":"dark_red","bold":true,"italic":false}'] 1

# тп на нужные места - ботиночки в церковь, хантеры в хаб
tp @a[tag=!hunter] 208 72 -90
tp @a[tag=hunter] 204 52 -89

title @a[tag=!hunter] title ["",{"text":"\u041d\u0443\u0436\u043d\u043e ","color":"aqua"},{"score":{"name":"@e[tag=global]","objective":"tt0"},"color":"aqua"},{"text":" \u0440\u044b\u0431","color":"aqua"}]

execute as @e[tag=global, scores={mode_respawn = 0}] run schedule function fishhunter:let_hunter_go 10s replace
scoreboard players add @e[limit=1, tag=global] games_counter 1

# подгрузка значения рыб и настройка счетчиков
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
scoreboard players set @a fish_counter 0

# настройка глобального счетчика времени и максимального значения боссбара
execute store result score @e[tag=timers] counter run scoreboard players get @e[tag=global, limit=1] counter
execute store result bossbar minecraft:timer max run scoreboard players get @e[tag=global,limit=1] counter

team join hunter @a[tag=hunter]
team join boots @a[tag=!hunter]

execute store result score @e[tag=global] bootsCount run scoreboard players get @e[tag=timers, limit=1] bootsCount

# execute store result entity 51eb35c5-41c9-429c-a58f-0b485f95f0f5 Pos[0] double 1 run data get entity LvLLCn LastDeathLocation.pos[0] 1