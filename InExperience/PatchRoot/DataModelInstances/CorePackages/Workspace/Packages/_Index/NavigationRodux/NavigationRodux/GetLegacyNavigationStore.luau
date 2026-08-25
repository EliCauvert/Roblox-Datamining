local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local signalsModule = require(parent.Signals)
local robloxAppNavigationModule = require(parent.RobloxAppNavigation)
local createLegacyNavigationStoreModule = require(navigationRodux.createLegacyNavigationStore)

return signalsModule.createComputed(function()
	-- upvalues: createLegacyNavigationStoreModule (ref), robloxAppNavigationModule (ref)
	return createLegacyNavigationStoreModule(robloxAppNavigationModule.AppNavigationRegistry.get())
end)