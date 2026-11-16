# Fast Brew (Minecraft Java 26.3)

Makes brewing fast (1 second per batch by default) and lets players change the
speed **in game** with a simple `/trigger` command — no braces, no macro syntax,
no reload.

## How it works

Minecraft 26.3 added data-driven fuel definitions. The `minecraft:brewing_fuel`
item component (on blaze powder) points at the registry entry
`minecraft:brewing/speed_default` for its speed multiplier.

This datapack overrides that entry with a **`minecraft:storage` provider**.
Instead of a fixed number, it reads the current value from command storage
`fastbrew:config` at `speed`. A player changes that value with `/trigger`, and a
tick function copies the trigger score into the storage.

If the storage value is ever missing, a `fallback` of `20.0` keeps the default
1-second brewing.

## File layout

```
fast-brew/
├── pack.mcmeta                                              # data pack format 121.0 (26.3)
├── README.md
└── data/
    ├── minecraft/
    │   ├── context_float_provider/
    │   │   └── brewing/
    │   │       └── speed_default.json                       # storage-backed provider
    │   └── tags/
    │       └── function/
    │           ├── load.json                                # sets up objective + default config
    │           └── tick.json                                # runs the trigger detector
    └── fastbrew/
        └── function/
            ├── load.mcfunction                              # creates objective, initializes config
            ├── tick.mcfunction                              # keeps trigger enabled, applies changes
            ├── apply.mcfunction                             # writes the chosen speed to storage
            ├── get.mcfunction                               # shows current speed
            └── reset.mcfunction                             # back to 1 second
```

## Install

1. Copy the `fast-brew` folder into your world's `datapacks` folder
   (server: `world/datapacks`).
2. Run `/reload` (or restart the server).
3. Brew a potion — it finishes in about a second by default.

## Changing the speed in game

Any player can type:

```
/trigger fastbrew.speed set 20     # 1 second (default)
/trigger fastbrew.speed set 2      # 10 seconds
/trigger fastbrew.speed set 1      # 20 seconds (vanilla speed)
/trigger fastbrew.speed set 100    # 400/100 = 4 ticks = 0.2 seconds
```

Other commands:

```
/function fastbrew:get             # show the current speed multiplier
/function fastbrew:reset           # back to 1 second
```

The formula is `duration_ticks = 400 / speed`:

| Speed | Brew time |
|-------|-----------|
| `1`   | 20 s (vanilla) |
| `2`   | 10 s |
| `20`  | 1 s (default in this pack) |
| `100` | 0.2 s |

Only **positive whole numbers** work with `/trigger` (scoreboard scores are
integers). For a fractional speed you can still use
`/data modify storage fastbrew:config speed set value 1.5f` directly if you have
permission level 2.

The chosen value lives in command storage, so it persists across restarts and
is not overwritten by `/reload`.

## Notes

- `/trigger` is available to all players by default — no special permission
  level needed.
- Only the **duration** changes. Blaze powder is consumed at the normal rate
  (20 batches per piece), and all vanilla brewing recipes are unchanged.
- This affects every fuel that references `minecraft:brewing/speed_default`,
  including custom fuel items that use the default provider.
- The game may cache the multiplier when a batch starts, so a change may only
  apply to the **next** batch rather than one already brewing.
- Speed `0` or negative values are ignored (the trigger detector only accepts
  positive scores).
- Requires Minecraft Java 26.3 or newer (data pack format 121.0).
