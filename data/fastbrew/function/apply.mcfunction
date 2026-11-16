# Copy the player's chosen brewing time (in ticks) into the config storage.
execute store result storage fastbrew:config duration float 1.0 run scoreboard players get @s fastbrew.speed

# Tell them the new value, then reset the score so the trigger can be used again.
tellraw @s {text:"Brewing duration set to ",color:"gray",extra:[{score:{name:"@s",objective:"fastbrew.speed"}},{text:" ticks (Vanilla default: 400 ticks = 20 seconds)",color:"gray"}]}
scoreboard players set @s fastbrew.speed 0
