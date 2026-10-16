local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
local SignalsModule = require(Parent.Signals)
local CreateShortcutBarStatusStoreModule = require(script.createShortcutBarStatusStore)

return if require(Parent.SharedFlags).FFlagEnableStickyShortcutBarOnAllPlatforms then require(Parent.AppShortcutBarStore).GetShortcutBarStatusStore else SignalsModule.createComputed(CreateShortcutBarStatusStoreModule)