# функция проёба рыбы - удаляет их с земли, чистит переменные, отбирает 1 значение от рыб # исправлено под счетчик 2.0
kill @e[type=item, nbt={Item: {id:"minecraft:pufferfish"}}]
scoreboard players set @a[tag=hunter] fish_win 0
scoreboard players add @e[tag=global] tt1 1