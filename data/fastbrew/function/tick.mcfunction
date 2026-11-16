# Keep the trigger objective usable for everyone (it disables itself after each
# use, and new players need it enabled too).
scoreboard players enable @a fastbrew.speed

# Apply any pending speed change (the player's score is the chosen multiplier).
execute as @a[scores={fastbrew.speed=1..}] run function fastbrew:apply
