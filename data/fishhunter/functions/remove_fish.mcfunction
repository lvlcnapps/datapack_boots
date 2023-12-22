kill @e[type=item, nbt={Item: {id:"minecraft:pufferfish"}}]
scoreboard players set @a[tag=hunter] fish_win 0
scoreboard players set @a[tag=!hunter, scores={dead_cd=0}] lost_fish 0
scoreboard players remove @a fish 1