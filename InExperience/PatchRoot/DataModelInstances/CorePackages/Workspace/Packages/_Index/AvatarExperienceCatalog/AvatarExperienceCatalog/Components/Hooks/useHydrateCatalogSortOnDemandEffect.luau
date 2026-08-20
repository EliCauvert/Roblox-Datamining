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

local function getContentToHydrate(p0, p1, p2) --[[ line: 55 ]]
	-- upvalues: AXCarouselMaxItems (ref), itemTypeEnum (ref), fFlagAXMigrateAllTabToSduiDev (ref)
	local t = {}
	local content = p0 and p0.content
	
	if not content or #content == 0 then
		return t
	end
	local t_1 = {}
	
	for i = 1, math.min(p2 or AXCarouselMaxItems, #content) do
		local var11 = content[i]
		local type = var11.type
		local var12 = t_1[type]
		
		if var12 == nil then
			var12 = if p1 then p1[type] else false
			t_1[type] = var12
		end
		if (type == itemTypeEnum.Look and not fFlagAXMigrateAllTabToSduiDev) or not (var12 and var12[var11.id]) then
			table.insert(t, var11)
		end
	end
	return t
end

return function(p3, p4, p5) --[[ line: 98 | named "useHydrateCatalogSortOnDemandEffect" ]]
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useNetworking (ref), useStore (ref), reactModule (ref), widgetConstantsModule (ref), selectHydratedWidgetDataModule (ref), getContentToHydrate (ref)
	local fetchHydratedWidgetContent = useCatalogPageMonolithDependenciesModule().fetchHydratedWidgetContent
	local var13 = useNetworking()
	local var14 = useStore()
	local var15 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 117 ]]
		-- upvalues: p3 (ref), widgetConstantsModule (copy), var15 (ref), p4 (ref), p5 (ref), selectHydratedWidgetDataModule (copy), var14 (ref), getContentToHydrate (copy), fetchHydratedWidgetContent (ref), var13 (ref)
		local id = p3 and p3.id
		
		if not id or p3.type == widgetConstantsModule.Types.MySharedAvatarsWidget then return end
		if var15.current == id then return end
		local var17 = getContentToHydrate(p3, selectHydratedWidgetDataModule(var14:getState()), if p4 and p4.customizedDataMap and p4.customizedDataMap.hydrateOnlyVisibleItems then p5 else nil)
		
		if #var17 == 0 then
			return
		end
		var15.current = id
		fetchHydratedWidgetContent(var13, var17, id)
	end, {
		p3, p4, p5, var13, fetchHydratedWidgetContent, var14
	})
end