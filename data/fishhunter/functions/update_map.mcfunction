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

kill @e[tag=stun]
kill @e[tag=mark]

# через некоторое время удалить все выпавшие рамки и т п
schedule function fishhunter:delete_shit 5s replace