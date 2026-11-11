local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local CatalogSearchModule = require(Modules.AvatarExperience.Catalog.Components.Search.CatalogSearch)
local OnFocusExperimentExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)((require(CorePackages.Packages.RoactRodux).connect(function(p1, p2)
	return { searchParameters = p1.SearchesParameters[p2.detail] }
end)(function(p1)
	-- upvalues: RoactModule (copy), CatalogSearchModule (copy), OnFocusExperimentExposureLoggerModule (copy)
	return RoactModule.createFragment({
		SearchPage = RoactModule.createElement(CatalogSearchModule, {
			searchUuid = p1.detail,
			searchParameters = p1.searchParameters
		}),
		OnFocusExperimentExposureLogger = RoactModule.createElement(OnFocusExperimentExposureLoggerModule, { ixpTests = {} })
	})
end))))))