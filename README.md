# Fast Brew

Requires Minecraft 26.3 or newer.

Makes brewing fast (1 second per batch by default) and lets players change the
brewing time in game with a simple `/trigger` command.

⚠️If you change the brewing speed after a brewing batch has already started (blaze powder consumed and active), you will need to break and replace your brewing stand for the change to take effect.

## Changing the brewing time

The speed number in **ticks**. Larger = slower.

```
/trigger fastbrew.speed set 20     # 20 ticks  = 1 second (default)
/trigger fastbrew.speed set 100    # 100 ticks = 5 seconds
/trigger fastbrew.speed set 200    # 200 ticks = 10 seconds
/trigger fastbrew.speed set 400    # 400 ticks = 20 seconds (vanilla)
```

Other commands:

```
/function fastbrew:get             # show the current duration in ticks
/function fastbrew:reset           # back to 20 ticks (1 second)
```

## Notes

- Only the **brewing time** changes. Blaze powder is consumed at the normal rate
  (20 batches per piece), and all vanilla brewing recipes are unchanged.
- This affects every fuel that references `minecraft:brewing/speed_default`,
  including custom fuel items that use the default provider.
- Duration `0` or negative values are ignored (the trigger detector only
  accepts positive values), which also avoids dividing by zero.
- Upgrading from an older version of this pack: any previously saved custom
  `speed` value is replaced by the default 20-tick duration on `/reload`.
