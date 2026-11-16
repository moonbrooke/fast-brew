# Recreate the objective as type "trigger" (/trigger only works on that type).
# Removing first also upgrades worlds that already loaded the old "dummy" version.
scoreboard objectives remove fastbrew.speed
scoreboard objectives add fastbrew.speed trigger

# Initialize the config only if it hasn't been set yet, so a player's custom
# speed survives /reload and server restarts.
execute unless data storage fastbrew:config speed run data modify storage fastbrew:config speed set value 20.0f
