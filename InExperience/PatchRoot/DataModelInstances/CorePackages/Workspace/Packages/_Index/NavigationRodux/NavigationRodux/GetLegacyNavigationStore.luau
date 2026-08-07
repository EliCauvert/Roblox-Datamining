local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local signalsModule = require(parent.Signals)
local robloxAppNavigationModule = require(parent.RobloxAppNavigation)
local createLegacyNavigationStoreModule = require(navigationRodux.createLegacyNavigationStore)

return signalsModule.createComputed(function() --[[ line: 8 ]]
	-- upvalues: createLegacyNavigationStoreModule (ref), robloxAppNavigationModule (ref)
	return createLegacyNavigationStoreModule(robloxAppNavigationModule.AppNavigationRegistry.get())
end)