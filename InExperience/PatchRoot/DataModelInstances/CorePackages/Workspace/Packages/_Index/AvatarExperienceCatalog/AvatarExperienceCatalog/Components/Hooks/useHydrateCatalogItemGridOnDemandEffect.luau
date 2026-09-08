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

return function(p1, p2)
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useNetworking (ref), useStore (ref), reactModule (ref), t (ref), selectHydratedWidgetDataModule (ref), getCatalogContentToHydrateModule (ref)
	local fetchHydratedWidgetContent = useCatalogPageMonolithDependenciesModule().fetchHydratedWidgetContent
	local var1 = useNetworking()
	local var2 = useStore()
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), t (copy), var3 (ref), var4 (ref), selectHydratedWidgetDataModule (copy), var2 (ref), getCatalogContentToHydrateModule (copy), fetchHydratedWidgetContent (ref), var1 (ref)
		if not p1 or p1 == "" then return end
		local p3 = p2 or t
		
		if var3.current == p1 and var4.current == p3 then return end
		local var5 = getCatalogContentToHydrateModule(p3, selectHydratedWidgetDataModule(var2:getState()), nil)
		var3.current = p1
		var4.current = p3
		
		if #var5 == 0 then
			return
		end
		fetchHydratedWidgetContent(var1, var5, p1)
	end, {
		p1,
		p2,
		var1,
		fetchHydratedWidgetContent,
		var2
	})
end