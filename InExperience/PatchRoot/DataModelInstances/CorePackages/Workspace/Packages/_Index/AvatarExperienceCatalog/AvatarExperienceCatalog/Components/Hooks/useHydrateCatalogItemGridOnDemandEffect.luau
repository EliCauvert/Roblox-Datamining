local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseNetworkingFunction = require(Parent.AvatarExperienceCommon).Hooks.useNetworking
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local SelectHydratedWidgetDataModule = require(AvatarExperienceCatalog.State.Selectors.selectHydratedWidgetData)
local GetCatalogContentToHydrateModule = require(AvatarExperienceCatalog.Utils.getCatalogContentToHydrate)
local UseCatalogPageMonolithDependenciesModule = require(AvatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)
local t = {}

return function(Current, p1) --[[ Line: 47 | Named "useHydrateCatalogItemGridOnDemandEffect" ]]
	-- upvalues: UseCatalogPageMonolithDependenciesModule (copy), UseNetworkingFunction (copy), UseStoreFunction (copy), ReactModule (copy), t (copy), SelectHydratedWidgetDataModule (copy), GetCatalogContentToHydrateModule (copy)
	local FetchHydratedWidgetContentFunction = UseCatalogPageMonolithDependenciesModule().fetchHydratedWidgetContent
	local UseNetworkingResult = UseNetworkingFunction()
	local UseStoreResult = UseStoreFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 62 ]]
		-- upvalues: Current (copy), p1 (copy), t (upval), UseRefResult (copy), UseRefResult1 (copy), SelectHydratedWidgetDataModule (upval), UseStoreResult (copy), GetCatalogContentToHydrateModule (upval), FetchHydratedWidgetContentFunction (copy), UseNetworkingResult (copy)
		if not Current or Current == "" then return end
		local P1 = p1 or t
		
		if UseRefResult.current == Current and UseRefResult1.current == P1 then return end
		local CatalogContentToHydrateModule = GetCatalogContentToHydrateModule(P1, SelectHydratedWidgetDataModule(UseStoreResult:getState()), nil)
		UseRefResult.current = Current
		UseRefResult1.current = P1
		
		if #CatalogContentToHydrateModule ~= 0 then
			FetchHydratedWidgetContentFunction(UseNetworkingResult, CatalogContentToHydrateModule, Current)
			
			return
		end
	end, {
		Current,
		p1,
		UseNetworkingResult,
		FetchHydratedWidgetContentFunction,
		UseStoreResult
	})
end