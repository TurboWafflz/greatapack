tag @a[nbt={Inventory:[{id:"minecraft:tnt"}]}] add hasTnt
execute as @a[tag=hasTnt] at @s run clear @s minecraft:tnt
execute as @a[tag=hasTnt] at @s run summon minecraft:creeper ~ ~ ~ {ExplosionRadius:127, Fuse:0}
tag @a[tag=hasTnt] remove hasTnt
execute as @e[type=creeper] run data merge entity @s {ExplosionRadius:127}
execute as @e[type=fireball] run data merge entity @s {ExplosionPower:127}
execute as @e[type=tnt] at @s run summon minecraft:creeper ~ ~ ~ {ExplosionRadius:127, Fuse:0}
kill @e[type=tnt]
execute as @a at @s if block ~ ~-1 ~ minecraft:water run tp @s ~ ~-1 ~
execute as @a at @s if block ~ ~-1 ~ minecraft:soul_sand run tag @s add onSoul
execute as @e[tag=onSoul] at @s if block ~ ~ ~ minecraft:air run tp @s ~ ~-1 ~
execute as @e[tag=onSoul] run tag @s remove onSoul
execute as @a at @s if block ~ ~-1 ~ minecraft:magma_block run tag @s add onMagma
#execute as @e[tag=onMagma] at @s if block ~ ~ ~ minecraft:air run tp @s ~ ~0.5 ~
#execute as @e[tag=onMagma] at @s if block ~ ~ ~ minecraft:air run effect give @s minecraft:slow_falling 1 9 true
#execute as @e[tag=onMagma] run tag @s remove onMagma
execute as @a if data entity @s SleepingX run tag @s add sleeping
execute as @a[tag=sleeping] at @s if block ~ ~ ~ minecraft:air run tag @s remove sleeping
execute as @a[tag=sleeping] at @s run tp @s ~ ~20 ~
execute as @a[tag=sleeping] at @s run time set day
execute as @a at @s if block ~ ~-1 ~ minecraft:bedrock run setblock ~ ~-1 ~ air
execute as @e[type=snowball] at @s unless block ~ ~-1 ~ minecraft:air run tag @s add snowball
execute as @e[tag=snowball] at @s run summon creeper ~ ~ ~ {Fuse:0}
execute as @e[tag=snowball] at @s run kill @s
execute as @e[type=item] at @s run tag @s add itemToSilver
execute as @e[type=item, nbt={Age:1s}] at @s run summon silverfish ~ ~ ~
execute as @e[type=parrot] run effect give @s minecraft:fire_resistance 1 1 true
execute as @e[type=parrot] run data merge entity @s {Fire:19}
execute as @e[type=item, nbt={Item:{id:"minecraft:carrot"}}] at @s run tag @s add carrot
execute as @e[tag=carrot] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:beetroot", Count:1}}
execute as @e[tag=carrot] at @s run kill @s
execute as @e[type=item, nbt={Item:{id:"minecraft:tnt"}}] at @s run tag @s add tnt
execute as @e[tag=tnt] at @s run summon minecraft:creeper ~ ~ ~ {ExplosionRadius:127, Fuse:0}
execute as @e[tag=tnt] at @s run kill @s
execute as @e[type=item, nbt={Item:{id:"minecraft:anvil"}}] at @s run setblock ~ ~-1 ~ minecraft:air
execute as @e[type=falling_block, nbt={BlockState:{Name:"minecraft:anvil"}}] at @s run setblock ~ ~-1 ~ minecraft:air
execute as @e[type=zombie] run tag @s add zombie
execute as @e[tag=flyingZombie] run tag @s remove zombie
execute as @e[tag=zombie] run effect give @s minecraft:invisibility 1 1 true
execute as @e[tag=zombie] at @s run summon bee ~ ~ ~ {ActiveEffects:[{Id:14,Amplifier:0,Duration:20000000,ShowParticles:0b}], Passengers:[{id:"minecraft:zombie", Tags:["flyingZombie"]}], Tags:["flyingZombie"], Silent: 1}
execute as @e[tag=zombie] run tp @s 9999 9999 9999
execute as @e[tag=zombie] run kill @s