local parent = script:FindFirstAncestor("AppShortcutBar").Parent

return if require(parent.SharedFlags).FFlagEnableStickyShortcutBarOnAllPlatforms then require(parent.AppShortcutBarStore).GetShortcutBarStatusStore else require(parent.Signals).createComputed(require(script.createShortcutBarStatusStore))