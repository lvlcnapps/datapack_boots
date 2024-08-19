clear @a[tag=!hunter]
effect clear @a[tag=!hunter]
gamemode adventure @a[tag=!hunter]
effect give @a[tag=!hunter] minecraft:invisibility infinite 1 true

item replace entity @a[tag=!hunter] armor.feet with minecraft:leather_boots
item replace entity @a[tag=!hunter] armor.legs with minecraft:leather_leggings

scoreboard players set @a ignite 0
scoreboard players set @e[tag=data] cd_spawn 300
# setblock 487 43 -625 minecraft:polished_blackstone_button[facing=west]
# setblock 487 43 -622 minecraft:polished_blackstone_button[facing=west]
# setblock 487 43 -619 minecraft:polished_blackstone_button[facing=west]
scoreboard players set @e[tag=timers] bootsCount 1
execute as @a[tag=!hunter] run scoreboard players add @e[tag=timers] bootsCount 1
scoreboard players remove @e[tag=timers] bootsCount 1