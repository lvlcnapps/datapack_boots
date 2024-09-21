clear @a[tag=hunter]
effect clear @a[tag=hunter]
gamemode adventure @a[tag=hunter]
effect give @a[tag=hunter] minecraft:invisibility infinite 1 true
scoreboard players set @e[tag=data] game 1

item replace entity @a[tag=hunter, scores={mode_hunters = ..1}] armor.feet with minecraft:golden_boots
item replace entity @a[tag=hunter, scores={mode_hunters = 3..}] armor.feet with minecraft:golden_boots
item replace entity @a[tag=hunter, scores={mode_hunters = ..1}] armor.legs with minecraft:golden_leggings
item replace entity @a[tag=hunter, scores={mode_hunters = 3..}] armor.legs with minecraft:golden_leggings
item replace entity @a[tag=hunter, scores={mode_hunters = ..1}] armor.chest with minecraft:golden_chestplate
item replace entity @a[tag=hunter, scores={mode_hunters = 3..}] armor.chest with minecraft:golden_chestplate
item replace entity @a[tag=hunter, scores={mode_hunters = ..1}] armor.head with minecraft:golden_helmet
item replace entity @a[tag=hunter, scores={mode_hunters = 3..}] armor.head with minecraft:golden_helmet

item replace entity @a[tag=hunter, scores={mode_hunters = 2}] armor.feet with minecraft:netherite_boots
item replace entity @a[tag=hunter, scores={mode_hunters = 2}] armor.legs with minecraft:netherite_leggings
item replace entity @a[tag=hunter, scores={mode_hunters = 2}] armor.chest with minecraft:netherite_chestplate
item replace entity @a[tag=hunter, scores={mode_hunters = 2}] armor.head with minecraft:netherite_helmet

give @a[tag=hunter, scores={mode_hunters = 1}] lingering_potion[custom_name='{"text":"Strike"}',potion_contents={custom_color:1,custom_effects:[{id:"minecraft:instant_damage",amplifier:4,duration:100}]}] 3
give @p[tag=hunter, scores={mode_hunters = 3}] map[custom_name='{"text":"Trap"}']

effect give @a[tag=hunter] minecraft:speed infinite 3 true
effect give @a[tag=hunter] minecraft:strength infinite 50 true
give @a[tag=hunter] golden_sword[minecraft:custom_name='[{"text":"Мечъ","italic":false}]',minecraft:enchantments={levels: {"sharpness": 255}}] 1
execute if entity @e[tag=data, scores={bow_toggle = 1}] run give @a[tag=hunter] minecraft:bow[minecraft:custom_name='[{"text":"Калаш","italic":false}]', minecraft:enchantments={levels: {"power": 255}}] 1

scoreboard players set @a ignite 0
# execute store result score @e[tag=data] arrow_giver run scoreboard players get @e[tag=data, limit=1] arrow_count
scoreboard players operation @e[tag=timers] counter = @e[tag=data] counter

execute store result bossbar minecraft:bb1 max run scoreboard players get @e[tag=data, limit=1] counter
scoreboard players set @e[tag=handle_sushi] cooking_time -2
scoreboard players set @e[tag=data] choice_tp_boots 0
scoreboard players set @e[tag=data] cd_spawn -1

give @a[tag=hunter] minecraft:arrow 64

schedule function fishhunter:delete_shit 5s replace