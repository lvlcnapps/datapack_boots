say boots win!
tellraw @a "рыбы мои рыбы"

#scoreboard players set @a fish 7
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
#scoreboard players set @a[tag=hunter] cooldown 300
scoreboard players operation @a[tag=hunter] cooldown = @e[tag=global, limit=1] cooldown

title @a title {"text":"Boots Win","color":"green"}