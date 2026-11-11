local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local _ = require(Modules.AvatarExperience.Common.Types)

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(CatalogConstantsModule.DefaultFilters.PriceRange, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetPriceRange).name] = function(_, p1)
		return p1.priceRange
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters).name] = function(_, _)
		-- upvalues: CatalogConstantsModule (copy)
		return CatalogConstantsModule.DefaultFilters.PriceRange
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetSortAndFilters).name] = function(p1, p2)
		return p2.PriceRange or p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter).name] = function(p1, p2)
		return p2.priceRange or p1
	end
})