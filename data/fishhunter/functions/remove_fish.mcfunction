# функция проёба рыбы - удаляет их с земли, чистит переменные, отбирает 1 значение от рыб
kill @e[type=item, nbt={Item: {id:"minecraft:pufferfish"}}]
scoreboard players set @a[tag=hunter] fish_win 0
#scoreboard players set @a[tag=!hunter] lost_fish 0
scoreboard players remove @a fish 1