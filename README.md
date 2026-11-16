# Fast Brew

Makes **every** brewing stand finish a batch in **1 second (20 ticks)** instead
of the vanilla 20 seconds (400 ticks) — no commands, no markers, no functions.

Requires Minecraft Java 26.3 or newer (data pack format 121.0). The registry and this provider do not exist in older versions.

## How it works

Minecraft 26.3 added data-driven fuel definitions. The `minecraft:brewing_fuel`
item component (on blaze powder) points at a registry entry for its speed:

```
minecraft:brewing/speed_default
```

The vanilla value of that entry is `1.0`. This datapack overrides it with
`20.0`, so brewing runs 20× faster: 400 ticks / 20 = 20 ticks = 1 second.

## Tuning the duration

Change the number in `speed_default.json`. The formula is:

```
duration_ticks = 400 / speed_multiplier
```

| Value | Brew time |
|-------|-----------|
| `1.0`  | 20 s (vanilla) |
| `2.0`  | 10 s |
| `20.0` | 1 s (default in this pack) |
| `40.0` | 0.5 s |

Smaller values than `1.0` make brewing slower.
