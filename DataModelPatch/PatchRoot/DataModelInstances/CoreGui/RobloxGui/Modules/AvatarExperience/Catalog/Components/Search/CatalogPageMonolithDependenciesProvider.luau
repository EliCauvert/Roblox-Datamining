local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CatalogPageMonolithDependenciesContext = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Providers.CatalogPageMonolithDependenciesContext
local FetchHydratedWidgetContentModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchHydratedWidgetContent)
local WidgetTileWithImpressionsTaggingModule = require(Modules.AvatarExperience.Common.Components.Widgets.WidgetTileWithImpressionsTagging)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch

return require(CorePackages.Workspace.Packages.RoactServices).RoactServices.connect({
	catalogAnalytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
})(function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FetchHydratedWidgetContentModule (copy), WidgetTileWithImpressionsTaggingModule (copy), CatalogPageMonolithDependenciesContext (copy)
	local UseDispatchResult = UseDispatchFunction()
	local CatalogAnalytics = p1.catalogAnalytics
	
	return ReactModule.createElement(CatalogPageMonolithDependenciesContext.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: CatalogAnalytics (copy), UseDispatchResult (copy), FetchHydratedWidgetContentModule (upval), WidgetTileWithImpressionsTaggingModule (upval)
			return {
				catalogAnalytics = CatalogAnalytics,
				fetchHydratedWidgetContent = function(p2, p3, p4)
					-- upvalues: UseDispatchResult (upval), FetchHydratedWidgetContentModule (upval)
					UseDispatchResult(FetchHydratedWidgetContentModule(p2, p3, p4))
				end,
				WidgetTileWithImpressionsTagging = WidgetTileWithImpressionsTaggingModule
			}
		end, { UseDispatchResult, CatalogAnalytics })
	}, p1.children)
end)