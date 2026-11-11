local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local RobloxAppNavigationModule = require(Parent.RobloxAppNavigation)
local CreateLegacyNavigationStoreModule = require(NavigationRodux.createLegacyNavigationStore)

return require(Parent.Signals).createComputed(function()
	-- upvalues: CreateLegacyNavigationStoreModule (copy), RobloxAppNavigationModule (copy)
	return CreateLegacyNavigationStoreModule(RobloxAppNavigationModule.AppNavigationRegistry.get())
end)