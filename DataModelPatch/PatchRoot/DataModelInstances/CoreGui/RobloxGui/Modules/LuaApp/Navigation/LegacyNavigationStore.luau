local CorePackages = game:GetService("CorePackages")
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)

return if require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP2NavigationPrimitives then NavigationRoduxModule.GetLegacyNavigationStore(false) else NavigationRoduxModule.createLegacyNavigationStore((require(script.Parent.AppNavigation)))