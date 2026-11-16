# Show the current brewing duration in ticks.
# `data get` prints its value through command feedback, which is not shown in
# chat for every player running a function. `tellraw` always reaches @s.
execute store result score $duration fastbrew.config run data get storage fastbrew:config duration
tellraw @s {text:"Current brewing duration: ",color:"gray",extra:[{score:{name:"$duration",objective:"fastbrew.config"}},{text:" ticks (Vanilla default: 400 ticks = 20 seconds)",color:"gray"}]}
