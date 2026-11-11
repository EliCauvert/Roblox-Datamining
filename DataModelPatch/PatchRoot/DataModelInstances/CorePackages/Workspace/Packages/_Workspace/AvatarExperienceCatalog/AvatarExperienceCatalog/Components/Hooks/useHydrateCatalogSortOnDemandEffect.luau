local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local ItemTypeEnum = AvatarExperienceCommonModule.Enums.ItemTypeEnum
local UseNetworkingFunction = AvatarExperienceCommonModule.Hooks.useNetworking
local FFlagAXMigrateAllTabToSduiDev = require(Parent.AvatarExperienceFlags).FFlagAXMigrateAllTabToSduiDev
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local WidgetConstantsModule = require(AvatarExperienceCatalog.WidgetConstants)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local SelectHydratedWidgetDataModule = require(AvatarExperienceCatalog.State.Selectors.selectHydratedWidgetData)
local UseCatalogPageMonolithDependenciesModule = require(AvatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)
local AXCarouselMaxItems = game:DefineFastInt("AXCarouselMaxItems", 50)

local function getContentToHydrate(p1, p2, p3)
	-- upvalues: AXCarouselMaxItems (copy), ItemTypeEnum (copy), FFlagAXMigrateAllTabToSduiDev (copy)
	local List = {}
	local Content = p1 and p1.content
	
	if not Content or #Content == 0 then
		return List
	end
	local t = {}
	
	for i = 1, math.min(p3 or AXCarouselMaxItems, #Content) do
		local ContentEntry = Content[i]
		local Type = ContentEntry.type
		local Entry = t[Type]
		
		if Entry == nil then
			Entry = p2 and p2[Type] or false
			t[Type] = Entry
		end
		local Entry1 = Entry and Entry[ContentEntry.id]
		
		if Type == ItemTypeEnum.Look and not FFlagAXMigrateAllTabToSduiDev or not Entry1 then
			table.insert(List, ContentEntry)
		end
	end
	return List
end

return function(p4, p5, p6)
	-- upvalues: UseCatalogPageMonolithDependenciesModule (copy), UseNetworkingFunction (copy), UseStoreFunction (copy), ReactModule (copy), WidgetConstantsModule (copy), SelectHydratedWidgetDataModule (copy), getContentToHydrate (copy)
	local FetchHydratedWidgetContentFunction = UseCatalogPageMonolithDependenciesModule().fetchHydratedWidgetContent
	local UseNetworkingResult = UseNetworkingFunction()
	local UseStoreResult = UseStoreFunction()
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p4 (copy), WidgetConstantsModule (upval), UseRefResult (copy), p5 (copy), p6 (copy), SelectHydratedWidgetDataModule (upval), UseStoreResult (copy), getContentToHydrate (upval), FetchHydratedWidgetContentFunction (copy), UseNetworkingResult (copy)
		local Id = p4 and p4.id
		
		if not Id or p4.type == WidgetConstantsModule.Types.MySharedAvatarsWidget then return end
		if UseRefResult.current == Id then return end
		local ContentToHydrate = getContentToHydrate(p4, SelectHydratedWidgetDataModule(UseStoreResult:getState()), if p5 and p5.customizedDataMap and p5.customizedDataMap.hydrateOnlyVisibleItems then p6 else nil)
		
		if #ContentToHydrate ~= 0 then
			UseRefResult.current = Id
			FetchHydratedWidgetContentFunction(UseNetworkingResult, ContentToHydrate, Id)
			
			return
		end
	end, {
		p4, p5, p6, UseNetworkingResult, FetchHydratedWidgetContentFunction,
		UseStoreResult
	})
end