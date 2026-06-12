# Bad Items Equipped

A small WeakAura helper that warns when you are wearing utility or teleport gear in content where it is easy to forget you swapped it on.

It checks your equipped items when you enter the world, change gear, join/leave a group, or enter a party/raid situation. If a listed bad item is equipped, it stores the item info in `aura_env` for display text.

## Files

- `BadItemsEquipped.lua` - custom trigger code
- `CustomText.lua` - custom text code

## WeakAura Setup

Recommended structure:

```text
Bad Items Equipped
+-- Bad item equipped
```

Use a simple group as the parent if you want a clean icon/name in the WeakAuras list.

## Trigger

Set the aura trigger to:

```text
Type: Custom
Event Type: Event
Check On: Event(s)
```

Events:

```text
PLAYER_EQUIPMENT_CHANGED
PLAYER_ENTERING_WORLD
GROUP_JOINED
GROUP_LEFT
```

Paste the contents of `BadItemsEquipped.lua` into the custom trigger field.

The trigger returns true when:

- you are in a raid instance
- you are in a party/dungeon instance
- you are in a group outside an instance

It returns false when you are solo outside an instance.

## Untrigger

No custom untrigger is required.

The trigger returns `false` when the aura should hide, including after `GROUP_LEFT` if you are now solo outside an instance.

## Custom Text

Paste the contents of `CustomText.lua` into the custom text function.

Current text output:

```text
<ITEM NAME> EQUIPPED YOU BUM
```

## Publishing

For GitHub, keep the readable Lua files in this repo.

For actual WeakAura importing, export the full aura/group from in-game and either:

- upload it to Wago.io
- add the export string to `exports/BadItemsEquipped.txt`

Wago.io is the easiest install path for users. GitHub is best for source code, changelog, issues, and documentation.

## Editing Items

Add new items to the `badItems` table like this:

```lua
[itemID] = "Item Name",
```

Example:

```lua
[32757] = "Blessed Medallion of Karabor",
```
