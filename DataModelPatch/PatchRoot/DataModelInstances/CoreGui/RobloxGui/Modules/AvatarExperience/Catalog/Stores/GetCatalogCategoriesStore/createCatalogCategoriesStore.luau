local CorePackages = game:GetService("CorePackages")
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local SignalsModule = require(CorePackages.Packages.Signals)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetCatalogCategoriesModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategories)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXCatalogCategoriesSDUILinks = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUILinks
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local DataHydrationModule = if FFlagAXMigrateAllTabToSduiDev then require(CorePackages.Workspace.Packages.DataHydration) else nil
local CreateMapMarketplaceCategoryToCatalogCategory = if FFlagAXMigrateAllTabToSduiDev then require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Sdui.createMapMarketplaceCategoryToCatalogCategory else nil

return function()
	-- upvalues: SignalsModule (copy), FFlagAXCatalogCategoriesSDUILinks (copy), FFlagAXMigrateAllTabToSduiDev (copy), DataHydrationModule (copy), GetCatalogCategoriesModule (copy), CreateMapMarketplaceCategoryToCatalogCategory (copy), MutedErrorModule (copy), FFlagAXCatalogCategoriesSDUI (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Callback1 = nil
	local Callback = nil
	
	if FFlagAXCatalogCategoriesSDUILinks or FFlagAXMigrateAllTabToSduiDev then
		Callback1, Callback = SignalsModule.createSignal(nil)
	end
	local function buildCategoryMap(List)
		local t = {}
		
		for _, value in List do
			if value and value.Id then
				local Subcategories = value.Subcategories
				
				if Subcategories then
					local SubcategoriesMap = {}
					
					if Subcategories then
						for _, subcategory in Subcategories do
							if subcategory.Id then
								SubcategoriesMap[subcategory.Id] = subcategory
							end
						end
					end
					value.SubcategoriesMap = SubcategoriesMap
				end
				t[value.Id] = value
			end
		end
		return t
	end
	
	local Computed = nil
	local Callback3 = nil
	
	if FFlagAXMigrateAllTabToSduiDev then
		local MarketplaceCatalogCategoryStore = DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false)
		local CatalogCategoriesModuleEntry = GetCatalogCategoriesModule()[1]
		local MapMarketplaceCategoryToCatalogCategory = CreateMapMarketplaceCategoryToCatalogCategory()
		Computed = SignalsModule.createComputed(function(p1)
			-- upvalues: MarketplaceCatalogCategoryStore (copy), buildCategoryMap (copy), CatalogCategoriesModuleEntry (copy), MapMarketplaceCategoryToCatalogCategory (copy)
			local LastReceivedCategories = MarketplaceCatalogCategoryStore.getLastReceivedCategories(p1)
			
			if not next(LastReceivedCategories) then
				return (buildCategoryMap({ CatalogCategoriesModuleEntry }))
			end
			local t = {}
			
			for _, lastReceivedCategory in LastReceivedCategories do
				if lastReceivedCategory.subcategories then
					for _, subcategory in lastReceivedCategory.subcategories do
						t[subcategory] = true
					end
				end
			end
			local List = {}
			
			for i, lastReceivedCategory1 in LastReceivedCategories do
				if not t[i] then
					table.insert(List, MapMarketplaceCategoryToCatalogCategory.map(lastReceivedCategory1, LastReceivedCategories))
				end
			end
			local CategoryMap = buildCategoryMap(List)
			
			if not CategoryMap[CatalogCategoriesModuleEntry.Id] then
				CategoryMap[CatalogCategoriesModuleEntry.Id] = CatalogCategoriesModuleEntry
			end
			return CategoryMap
		end)
		
		local function GetCategories(_)
			-- upvalues: MutedErrorModule (upval)
			MutedErrorModule("createCatalogCategoriesStore.getCategories called under FFlagAXMigrateAllTabToSduiDev; use `getCategoriesMap` (or `getCategoryOrSubcategory`) instead -- categories are sourced from MarketplaceCatalogCategory hydration.")
			
			return {}
		end
		
		local Flag = false
		
		local function SetCategories(_)
			-- upvalues: Flag (ref), MutedErrorModule (upval)
			if not Flag then
				Flag = true
				MutedErrorModule("createCatalogCategoriesStore.setCategories called under FFlagAXMigrateAllTabToSduiDev; categories are sourced from MarketplaceCatalogCategory hydration and this write is ignored.")
			end
		end
		
		local v1 = true
		Callback3 = SignalsModule.createEffect(function(p2)
			-- upvalues: MarketplaceCatalogCategoryStore (copy), v1 (ref), MapMarketplaceCategoryToCatalogCategory (copy), Signal (copy), Signal2 (copy)
			local NoNextEntry = next((MarketplaceCatalogCategoryStore.getLastReceivedCategories(p2))) == nil
			
			if NoNextEntry and not v1 then
				MapMarketplaceCategoryToCatalogCategory.clear()
			end
			v1 = NoNextEntry
			
			if not NoNextEntry and not Signal(false) then
				Signal2(true)
			end
		end)
	else
		local Signal1, Signal2_1 = SignalsModule.createSignal(if FFlagAXCatalogCategoriesSDUI then { GetCatalogCategoriesModule()[1] } else GetCatalogCategoriesModule())
		local Signal3, Signal2_2 = SignalsModule.createSignal({})
		local GetCategories: (any) -> any = Signal1
		Computed = Signal3
		
		local function SetCategories(Tbl)
			-- upvalues: Signal2_1 (copy), Signal2_2 (copy), buildCategoryMap (copy)
			local Copy = table.clone(Tbl)
			Signal2_1(Copy)
			Signal2_2((buildCategoryMap(Copy)))
		end
		
		Signal2_2((buildCategoryMap(Signal1(false))))
	end
	local SetPendingDeepLinkAction: ((any) -> ())? = nil
	local Callback2: (() -> ())? = nil
	local v2: ((any) -> any)? = nil
	
	if FFlagAXCatalogCategoriesSDUILinks or FFlagAXMigrateAllTabToSduiDev then
		SetPendingDeepLinkAction = function(p2)
			-- upvalues: Callback (ref)
			if Callback then
				Callback(p2)
			end
		end
		
		Callback2 = function()
			-- upvalues: Callback (ref)
			if Callback then
				Callback(nil)
			end
		end
		
		v2 = function(p2)
			-- upvalues: Signal2 (copy), Callback1 (ref), Callback2 (ref)
			Signal2(p2)
			
			if p2 and Callback1 then
				local CallbackResult = Callback1(false)
				
				if CallbackResult then
					if Callback2 then
						Callback2()
					end
					return CallbackResult
				end
			end
			return nil
		end
	end
	return {
		getCategories = GetCategories,
		getCategoriesMap = Computed,
		getCategoryOrSubcategory = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then function(p2, p3)
			-- upvalues: Computed (ref)
			local ComputedResultEntry = Computed(false)[p2]
			
			return if p3 == nil then ComputedResultEntry elseif ComputedResultEntry == nil or ComputedResultEntry.SubcategoriesMap == nil then nil else ComputedResultEntry.SubcategoriesMap[p3]
		end else nil,
		getHasFetchedCategories = Signal,
		setCategories = SetCategories,
		setHasFetchedCategories = if FFlagAXCatalogCategoriesSDUILinks or FFlagAXMigrateAllTabToSduiDev then v2 else Signal2,
		getPendingDeepLinkAction = Callback1,
		setPendingDeepLinkAction = SetPendingDeepLinkAction,
		clearPendingDeepLinkAction = Callback2,
		dispose = function()
			-- upvalues: Callback3 (ref)
			if Callback3 then
				Callback3()
				Callback3 = nil
			end
		end
	}
end