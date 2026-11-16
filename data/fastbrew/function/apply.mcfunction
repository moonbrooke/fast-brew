# Copy the player's chosen speed (an integer) into the config storage as a float.
execute store result storage fastbrew:config speed float 1.0 run scoreboard players get @s fastbrew.speed

# Tell them the new value, then reset the score so the trigger can be used again.
tellraw @s {text:"Brewing speed set to ",color:"gray",extra:[{score:{name:"@s",objective:"fastbrew.speed"}},{text:" (ticks per batch = 400 / speed)",color:"gray"}]}
scoreboard players set @s fastbrew.speed 0
