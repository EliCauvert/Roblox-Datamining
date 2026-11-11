local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local DashModule = require(CorePackages.Packages.Dash)
local AvatarExperienceSearchModule = require(CorePackages.Workspace.Packages.AvatarExperienceSearch)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SendAXStatFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXStat
local SearchLandingPageRecentlyViewedWidget = WidgetConstants.ContextWidgets.SearchLandingPageRecentlyViewedWidget
local ReceivedRecentlyViewedItemsDataModule = require(Modules.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData)
local AXRecentlyViewedSearchItemsIXPTest = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest
local GetFFlagAXRemoveAwaitUsageInThunksModule = require(Modules.AvatarExperience.Flags.GetFFlagAXRemoveAwaitUsageInThunks)
local GetFFlagAXRecentlyViewedCountersFunction = AvatarExperienceSearchModule.Flags.GetFFlagAXRecentlyViewedCounters

local function _(p1)
	return p1.AvatarExperience.Common
end

local _ = function(p1)
	-- upvalues: DashModule (copy), ConstantsModule (copy), WidgetConstants (copy)
	return DashModule.map(p1, function(p2)
		-- upvalues: ConstantsModule (upval), WidgetConstants (upval)
		return {
			id = p2.id,
			type = if p2.itemType == ConstantsModule.ItemType.Asset then WidgetConstants.ContentType.Asset else WidgetConstants.ContentType.Bundle
		}
	end)
end

local function createWidgetInfo(p1)
	-- upvalues: IxpUtilsModule (copy), AXRecentlyViewedSearchItemsIXPTest (copy), SearchLandingPageRecentlyViewedWidget (copy), DashModule (copy), ConstantsModule (copy), WidgetConstants (copy)
	return {
		[SearchLandingPageRecentlyViewedWidget.Context] = {
			content = DashModule.map(p1, function(p2)
				-- upvalues: ConstantsModule (upval), WidgetConstants (upval)
				return {
					id = p2.id,
					type = if p2.itemType == ConstantsModule.ItemType.Asset then WidgetConstants.ContentType.Asset else WidgetConstants.ContentType.Bundle
				}
			end),
			template = {
				title = if IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledSaveInCatalog) then "Feature.Avatar.Label.SearchLandingPage.Title.RecentlyViewedItems" else "Feature.Avatar.Label.SearchLandingPage.Title.RecentlyViewedSearchItems",
				type = WidgetConstants.Templates.ItemGroup
			},
			id = SearchLandingPageRecentlyViewedWidget.WidgetId,
			requestId = SearchLandingPageRecentlyViewedWidget.RequestId,
			type = WidgetConstants.Types.SearchLandingPageRecentlyViewedWidget
		}
	}
end

local function getValidItems(p1)
	-- upvalues: DashModule (copy)
	if #p1.items == #p1.existingItems + #p1.fetchedItems then
		return p1.items
	end
	local List = {}
	
	for _, item in p1.items do
		local FindResult = DashModule.find(p1.existingItems, function(p2): boolean
			-- upvalues: item (copy)
			return tostring(p2.id) == tostring(item.id) and p2.itemType == item.itemType
		end)
		
		if DashModule.find(p1.fetchedItems, function(p2): boolean
			-- upvalues: item (copy)
			return tostring(p2.id) == tostring(item.id) and p2.itemType == item.itemType
		end) or FindResult then
			table.insert(List, item)
		end
	end
	return List
end

return function(p2, p3, Items)
	-- upvalues: PerformFetch (copy), ItemDataModule (copy), GetFFlagAXRemoveAwaitUsageInThunksModule (copy), DashModule (copy), GetFFlagAXRecentlyViewedCountersFunction (copy), WebApiModule (copy), ConstantsModule (copy), SendAXStatFunction (copy), AvatarExperienceSearchModule (copy), ReceivedRecentlyViewedItemsDataModule (copy), createWidgetInfo (copy), getValidItems (copy), SearchLandingPageRecentlyViewedWidget (copy), PromiseModule (copy)
	return PerformFetch.Single(p3, function(p4)
		-- upvalues: Items (copy), ItemDataModule (upval), GetFFlagAXRemoveAwaitUsageInThunksModule (upval), DashModule (upval), GetFFlagAXRecentlyViewedCountersFunction (upval), WebApiModule (upval), p2 (copy), ConstantsModule (upval), SendAXStatFunction (upval), AvatarExperienceSearchModule (upval), ReceivedRecentlyViewedItemsDataModule (upval), createWidgetInfo (upval), getValidItems (upval), SearchLandingPageRecentlyViewedWidget (upval), PromiseModule (upval)
		local ExistingItems = {}
		local ItemsToFetch = {}
		local Common = p4:getState().AvatarExperience.Common
		
		for _, item in Items do
			if ItemDataModule(Common, item.id, item.itemType) then
				table.insert(ExistingItems, item)
			else
				table.insert(ItemsToFetch, item)
			end
		end
		if GetFFlagAXRemoveAwaitUsageInThunksModule() then
			local FetchedItems = {}
			local AssetData = {}
			local BundleData = {}
			
			if #ItemsToFetch > 0 then
				local ClockTime = if GetFFlagAXRecentlyViewedCountersFunction() then os.clock() else nil
				
				return WebApiModule.FetchItemDetails(p2, (DashModule.map(ItemsToFetch, function(p5)
					return { id = tonumber(p5.id), itemType = p5.itemType }
				end))):andThen(function(Result)
					-- upvalues: FetchedItems (ref), ConstantsModule (upval), AssetData (copy), BundleData (copy), GetFFlagAXRecentlyViewedCountersFunction (upval), ClockTime (copy), SendAXStatFunction (upval), AvatarExperienceSearchModule (upval), ItemsToFetch (copy), p4 (copy), ReceivedRecentlyViewedItemsDataModule (upval), createWidgetInfo (upval), getValidItems (upval), Items (upval), ExistingItems (copy), SearchLandingPageRecentlyViewedWidget (upval)
					FetchedItems = if Result.responseBody and Result.responseBody.data then Result.responseBody.data else {}
					
					for _, fetchedItem in FetchedItems do
						if fetchedItem.itemType == ConstantsModule.ItemType.Asset then
							table.insert(AssetData, fetchedItem)
						elseif fetchedItem.itemType == ConstantsModule.ItemType.Bundle then
							table.insert(BundleData, fetchedItem)
						end
					end
					if GetFFlagAXRecentlyViewedCountersFunction() and typeof(ClockTime) == "number" then
						SendAXStatFunction({
							excludeTelemetry = true,
							statName = AvatarExperienceSearchModule.Enums.Stat.FetchRecentlyViewedItemsMs,
							metaData = { count = tostring(#ItemsToFetch) },
							deltaMs = (os.clock() - ClockTime) * 1000
						})
					end
					p4:dispatch(ReceivedRecentlyViewedItemsDataModule({
						assetData = AssetData,
						bundleData = BundleData,
						widget = {
							widgetInfo = createWidgetInfo((getValidItems({
								items = Items,
								existingItems = ExistingItems,
								itemsToFetch = ItemsToFetch,
								fetchedItems = FetchedItems
							}))),
							requestId = SearchLandingPageRecentlyViewedWidget.RequestId,
							context = SearchLandingPageRecentlyViewedWidget.Context
						}
					}))
				end)
			else
				p4:dispatch(ReceivedRecentlyViewedItemsDataModule({
					assetData = AssetData,
					bundleData = BundleData,
					widget = {
						widgetInfo = createWidgetInfo((getValidItems({
							items = Items,
							existingItems = ExistingItems,
							itemsToFetch = ItemsToFetch,
							fetchedItems = FetchedItems
						}))),
						requestId = SearchLandingPageRecentlyViewedWidget.RequestId,
						context = SearchLandingPageRecentlyViewedWidget.Context
					}
				}))
				
				return PromiseModule.resolve()
			end
		else
			local FetchedItems = {}
			local AssetData1 = {}
			local BundleData1 = {}
			
			if #ItemsToFetch > 0 then
				local ClockTime1 = if GetFFlagAXRecentlyViewedCountersFunction() then os.clock() else nil
				local v1, v2 = WebApiModule.FetchItemDetails(p2, (DashModule.map(ItemsToFetch, function(p5)
					return { id = tonumber(p5.id), itemType = p5.itemType }
				end))):await()
				
				if GetFFlagAXRecentlyViewedCountersFunction() and typeof(ClockTime1) == "number" then
					SendAXStatFunction({
						excludeTelemetry = true,
						statName = AvatarExperienceSearchModule.Enums.Stat.FetchRecentlyViewedItemsMs,
						metaData = { count = tostring(#ItemsToFetch) },
						deltaMs = (os.clock() - ClockTime1) * 1000
					})
				end
				if not v1 then
					return PromiseModule.reject(v2)
				end
				FetchedItems = if v2.responseBody and v2.responseBody.data then v2.responseBody.data else {}
				for _, fetchedItem in FetchedItems do
					if fetchedItem.itemType == ConstantsModule.ItemType.Asset then
						table.insert(AssetData1, fetchedItem)
					elseif fetchedItem.itemType == ConstantsModule.ItemType.Bundle then
						table.insert(BundleData1, fetchedItem)
					end
				end
			end
			p4:dispatch(ReceivedRecentlyViewedItemsDataModule({
				assetData = AssetData1,
				bundleData = BundleData1,
				widget = {
					widgetInfo = createWidgetInfo((getValidItems({
						items = Items,
						existingItems = ExistingItems,
						itemsToFetch = ItemsToFetch,
						fetchedItems = FetchedItems
					}))),
					requestId = SearchLandingPageRecentlyViewedWidget.RequestId,
					context = SearchLandingPageRecentlyViewedWidget.Context
				}
			}))
			
			return PromiseModule.resolve()
		end
	end)
end