say hunter win!

#scoreboard players set @a fish 7
execute store result score @a fish run scoreboard players get @e[tag=global, limit=1] fish
scoreboard players operation @a[tag=hunter] cooldown = @e[tag=global, limit=1] cooldown
scoreboard players set @a bootsCount -1

title @a title {"text":"Hunter Win","color":"red"}