local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useNetworking = require(parent.AvatarExperienceCommon).Hooks.useNetworking
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local selectHydratedWidgetDataModule = require(avatarExperienceCatalog.State.Selectors.selectHydratedWidgetData)
local getCatalogContentToHydrateModule = require(avatarExperienceCatalog.Utils.getCatalogContentToHydrate)
local useCatalogPageMonolithDependenciesModule = require(avatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)
local t = {}

return function(p0, p1) --[[ line: 47 | named "useHydrateCatalogItemGridOnDemandEffect" ]]
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useNetworking (ref), useStore (ref), reactModule (ref), t (ref), selectHydratedWidgetDataModule (ref), getCatalogContentToHydrateModule (ref)
	local fetchHydratedWidgetContent = useCatalogPageMonolithDependenciesModule().fetchHydratedWidgetContent
	local var6 = useNetworking()
	local var7 = useStore()
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 62 ]]
		-- upvalues: p0 (ref), p1 (ref), t (copy), var8 (ref), var9 (ref), selectHydratedWidgetDataModule (copy), var7 (ref), getCatalogContentToHydrateModule (copy), fetchHydratedWidgetContent (ref), var6 (ref)
		if not p0 or p0 == "" then return end
		local p1_1 = p1 or t
		
		if var8.current == p0 and var9.current == p1_1 then return end
		local var11 = getCatalogContentToHydrateModule(p1_1, selectHydratedWidgetDataModule(var7:getState()), nil)
		var8.current = p0
		var9.current = p1_1
		
		if #var11 == 0 then
			return
		end
		fetchHydratedWidgetContent(var6, var11, p0)
	end, {
		p0,
		p1,
		var6,
		fetchHydratedWidgetContent,
		var7
	})
end