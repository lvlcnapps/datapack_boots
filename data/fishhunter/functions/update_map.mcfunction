# обновление карты

setblock 287 72 -109 minecraft:redstone_block destroy
setblock 278 65 -64 minecraft:redstone_block destroy
setblock 217 97 -56 minecraft:redstone_block destroy
setblock 154 70 -146 minecraft:redstone_block destroy
# setblock 113 73 18 minecraft:redstone_block destroy
# setblock 118 71 -37 minecraft:redstone_block destroy
setblock 201 79 -142 minecraft:redstone_block destroy
setblock 115 64 -120 minecraft:redstone_block destroy
setblock 117 69 -66 minecraft:redstone_block destroy
setblock 161 75 16 minecraft:redstone_block destroy
setblock 155 68 -79 minecraft:redstone_block destroy
setblock 164 53 -85 minecraft:redstone_block destroy

kill @e[tag=stun]
kill @e[tag=mark]
kill @e[tag=stander]
kill @e[tag=camera]
kill @e[type=minecraft:arrow]

scoreboard players set @e[tag=levers] gekko 0
scoreboard players set @e[tag=levers] barbie 0
scoreboard players set @e[tag=levers] elves 0
scoreboard players set @e[tag=levers] frog 0
scoreboard players set @e[tag=levers] bomj 0
scoreboard players set @e[tag=levers] guests 0

# через некоторое время удалить все выпавшие рамки и т п
schedule function fishhunter:delete_shit 5s replace