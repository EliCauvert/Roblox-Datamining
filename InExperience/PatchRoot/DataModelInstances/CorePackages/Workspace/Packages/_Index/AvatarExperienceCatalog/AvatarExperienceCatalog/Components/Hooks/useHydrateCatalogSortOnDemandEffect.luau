local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local itemTypeEnum = avatarExperienceCommonModule.Enums.ItemTypeEnum
local useNetworking = avatarExperienceCommonModule.Hooks.useNetworking
local fFlagAXMigrateAllTabToSduiDev = require(parent.AvatarExperienceFlags).FFlagAXMigrateAllTabToSduiDev
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local widgetConstantsModule = require(avatarExperienceCatalog.WidgetConstants)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local selectHydratedWidgetDataModule = require(avatarExperienceCatalog.State.Selectors.selectHydratedWidgetData)
local useCatalogPageMonolithDependenciesModule = require(avatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)
local AXCarouselMaxItems = game:DefineFastInt("AXCarouselMaxItems", 50)

local function getContentToHydrate(p1, p2, p3)
	-- upvalues: AXCarouselMaxItems (ref), itemTypeEnum (ref), fFlagAXMigrateAllTabToSduiDev (ref)
	local t = {}
	local content = p1 and p1.content
	
	if not content or #content == 0 then
		return t
	end
	local t_1 = {}
	
	for i = 1, math.min(p3 or AXCarouselMaxItems, #content) do
		local var1 = content[i]
		local type = var1.type
		local var2 = t_1[type]
		
		if var2 == nil then
			var2 = if p2 then p2[type] else false
			t_1[type] = var2
		end
		if (type == itemTypeEnum.Look and not fFlagAXMigrateAllTabToSduiDev) or not (var2 and var2[var1.id]) then
			table.insert(t, var1)
		end
	end
	return t
end

return function(p4, p5, p6)
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useNetworking (ref), useStore (ref), reactModule (ref), widgetConstantsModule (ref), selectHydratedWidgetDataModule (ref), getContentToHydrate (ref)
	local fetchHydratedWidgetContent = useCatalogPageMonolithDependenciesModule().fetchHydratedWidgetContent
	local var3 = useNetworking()
	local var4 = useStore()
	local var5 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), widgetConstantsModule (copy), var5 (ref), p5 (ref), p6 (ref), selectHydratedWidgetDataModule (copy), var4 (ref), getContentToHydrate (copy), fetchHydratedWidgetContent (ref), var3 (ref)
		local id = p4 and p4.id
		
		if not id or p4.type == widgetConstantsModule.Types.MySharedAvatarsWidget then return end
		if var5.current == id then return end
		local var6 = getContentToHydrate(p4, selectHydratedWidgetDataModule(var4:getState()), if p5 and p5.customizedDataMap and p5.customizedDataMap.hydrateOnlyVisibleItems then p6 else nil)
		
		if #var6 == 0 then
			return
		end
		var5.current = id
		fetchHydratedWidgetContent(var3, var6, id)
	end, {
		p4, p5, p6, var3, fetchHydratedWidgetContent, var4
	})
end