# Recreate the objective as type "trigger" (/trigger only works on that type).
scoreboard objectives remove fastbrew.speed
scoreboard objectives add fastbrew.speed trigger

# Dummy objective used by get.mcfunction to display the stored duration.
scoreboard objectives remove fastbrew.config
scoreboard objectives add fastbrew.config dummy

# Initialize the duration only if it hasn't been set yet, so a player's custom
# value survives /reload and server restarts.
execute unless data storage fastbrew:config duration run data modify storage fastbrew:config duration set value 20.0f
