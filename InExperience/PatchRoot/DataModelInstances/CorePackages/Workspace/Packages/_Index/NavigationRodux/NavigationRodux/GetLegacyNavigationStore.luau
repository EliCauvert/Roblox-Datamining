local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local SignalsModule = require(Parent.Signals)
local RobloxAppNavigationModule = require(Parent.RobloxAppNavigation)
local CreateLegacyNavigationStoreModule = require(NavigationRodux.createLegacyNavigationStore)

return SignalsModule.createComputed(function()
	-- upvalues: CreateLegacyNavigationStoreModule (copy), RobloxAppNavigationModule (copy)
	return CreateLegacyNavigationStoreModule(RobloxAppNavigationModule.AppNavigationRegistry.get())
end)