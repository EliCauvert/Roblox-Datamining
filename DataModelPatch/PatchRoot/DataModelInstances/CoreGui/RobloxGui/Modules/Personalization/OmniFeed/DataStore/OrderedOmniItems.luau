local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local AddOmniRecommendations = Modules.LuaApp.Actions.Games.AddOmniRecommendations
local AddSearchResultsOmniFeed = Modules.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed
local FeedItemModel = Modules.Personalization.OmniFeed.DataStore.FeedItemModel
local AddExploreOmniItems = Modules.Personalization.OmniFeed.DataStore.AddExploreOmniItems
local SetOmniAutocompleteSorts = Modules.LuaApp.Actions.Games.SetOmniAutocompleteSorts
local SetFeedItemRenderedRows = Modules.Personalization.OmniFeed.DataStore.SetFeedItemRenderedRows
local ClearFeedItemRenderedRows = Modules.Personalization.OmniFeed.DataStore.ClearFeedItemRenderedRows
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local AddLocalOmniItemsModule = require(Modules1.Personalization.OmniFeed.DataStore.AddLocalOmniItems)
local AddSearchResultsOmniFeedSortsModule = require(Modules1.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeedSorts)
local OrderedOmniItemsUtilityModule = require(Modules1.Personalization.OmniFeed.DataStore.OrderedOmniItemsUtility)
local FFlagSearchOmniAutocompletePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage
local FFlagLuaAppAddRequestIdToRfySignalApportioning = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local FFlagLuaAppRfyRevealRows = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppRfyRevealRows
local FFlagLuaAppChartsStickyHeader = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppChartsStickyHeader

return function(p1, p2)
	-- upvalues: AddOmniRecommendations (copy), AppPage (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy), FFlagLuaAppRfyRevealRows (copy), FeedItemModel (copy), CryoModule (copy), OrderedOmniItemsUtilityModule (copy), FFlagSearchOmniAutocompletePage (copy), SetOmniAutocompleteSorts (copy), AddExploreOmniItems (copy), FFlagLuaAppChartsStickyHeader (copy), AddLocalOmniItemsModule (copy), AddSearchResultsOmniFeed (copy), AddSearchResultsOmniFeedSortsModule (copy), SetFeedItemRenderedRows (copy), ClearFeedItemRenderedRows (copy)
	local P0 = p1 or {}
	
	if p2.type == AddOmniRecommendations.name then
		for i, recommendation in pairs(p2.recommendations) do
			if i == AppPage.Home then
				assert(i == recommendation.pageType)
				local Home = AppPage.Home
				local Entry = P0[Home] or {}
				local Sorts = recommendation.sorts
				local RecommendationsId = if FFlagLuaAppAddRequestIdToRfySignalApportioning or FFlagLuaAppRfyRevealRows then recommendation.recommendationsId else nil
				local JoinResult = {}
				local CountSorts = #Sorts
				local OmniRecommendationsSortsCount = Entry.omniRecommendationsSortsCount or 0
				
				for i1, sort in ipairs(Sorts) do
					if p2.isAppend then
						i1 += OmniRecommendationsSortsCount
					end
					table.insert(JoinResult, (FeedItemModel.fromDiscoveryApi(i1, sort, if FFlagLuaAppAddRequestIdToRfySignalApportioning or FFlagLuaAppRfyRevealRows then RecommendationsId else nil)))
				end
				local NewOmniRecommendationsSortsCount = nil
				if p2.isAppend then
					JoinResult = CryoModule.List.join(Entry.allItems or {}, JoinResult)
					NewOmniRecommendationsSortsCount = OmniRecommendationsSortsCount + CountSorts
				else
					NewOmniRecommendationsSortsCount = CountSorts
				end
				P0 = CryoModule.Dictionary.join(P0, {
					[Home] = CryoModule.Dictionary.join(Entry, {
						allItems = OrderedOmniItemsUtilityModule.combineOmniFeedItems(Entry.localItems or {}, JoinResult),
						omniRecommendationsSortsCount = NewOmniRecommendationsSortsCount
					})
				})
			end
		end
		return P0
	elseif FFlagSearchOmniAutocompletePage and p2.type == SetOmniAutocompleteSorts.name then
		local SearchLandingPage = AppPage.SearchLandingPage
		local FromOmniAutocompleteApiResults = {}
		
		for i2, value in ipairs(p2.sortsTable) do
			table.insert(FromOmniAutocompleteApiResults, (FeedItemModel.fromOmniAutocompleteApi(i2, value)))
		end
		local Entry = P0[SearchLandingPage] or {}
		P0 = CryoModule.Dictionary.join(P0, {
			[SearchLandingPage] = CryoModule.Dictionary.join(Entry, {
				allItems = OrderedOmniItemsUtilityModule.combineOmniFeedItems(Entry.localItems or {}, FromOmniAutocompleteApiResults)
			})
		})
		
		return P0
	elseif p2.type == AddExploreOmniItems.name then
		local Entry = P0[p2.appPage] or {}
		local AllItems = Entry.allItems or {}
		local JoinResult = {}
		local CountAllItems: number = if p2.isAppend then #AllItems else 0
		for i3, topicInfo in p2.topicInfos do
			table.insert(JoinResult, (FeedItemModel.fromExploreTopicInfo(CountAllItems + i3, topicInfo, if FFlagLuaAppChartsStickyHeader then p2.omniFeedPageSection else nil)))
		end
		if p2.isAppend then
			JoinResult = CryoModule.List.join(AllItems, JoinResult)
		end
		P0 = CryoModule.Dictionary.join(P0, {
			[p2.appPage] = CryoModule.Dictionary.join(Entry, {
				allItems = OrderedOmniItemsUtilityModule.combineOmniFeedItems(Entry.localItems or {}, JoinResult)
			})
		})
		
		return P0
	elseif p2.type == AddLocalOmniItemsModule.name then
		local List = {}
		
		if p2.localItems then
			for _, localItem in ipairs(p2.localItems) do
				table.insert(List, (FeedItemModel.fromLocalData(localItem.orderIndex, localItem.treatmentType, localItem.treatmentProps, localItem.numberOfRows)))
			end
		end
		table.sort(List, function(A, B): boolean
			return if A.orderHint == nil or B.orderHint == nil then A.orderHint ~= nil else A.orderHint < B.orderHint
		end)
		local Entry = P0[p2.appPage] or {}
		P0 = CryoModule.Dictionary.join(P0, {
			[p2.appPage] = CryoModule.Dictionary.join(Entry, {
				hasLocalItems = true,
				localItems = List,
				allItems = OrderedOmniItemsUtilityModule.combineOmniFeedItems(List, Entry.allItems)
			})
		})
		
		return P0
	elseif p2.type == AddSearchResultsOmniFeed.name then
		local config = { allItems = {}, localItems = {} }
		
		if P0[AppPage.SearchPage] then
			if P0[AppPage.SearchPage][p2.searchUuid] then
				for _, allItem in ipairs(P0[AppPage.SearchPage][p2.searchUuid].allItems) do
					if p2.topicId == allItem.treatmentProps.topicId then
						return P0
					end
				end
			else
				P0[AppPage.SearchPage][p2.searchUuid] = config
			end
		else
			P0 = CryoModule.Dictionary.join(P0, { [AppPage.SearchPage] = { [p2.searchUuid] = config } })
		end
		P0 = CryoModule.Dictionary.join(P0, {
			[AppPage.SearchPage] = CryoModule.Dictionary.join(P0[AppPage.SearchPage], {
				[p2.searchUuid] = {
					allItems = CryoModule.List.join(P0[AppPage.SearchPage][p2.searchUuid].allItems, {
						(FeedItemModel.fromSearchApi(p2.searchUuid, p2.topicId, p2.treatmentType, p2.sortIndex, p2.topicLayoutData))
					}),
					localItems = {}
				}
			})
		})
		
		return P0
	elseif p2.type == AddSearchResultsOmniFeedSortsModule.name then
		local SearchUuid = p2.searchUuid
		local SearchPage = AppPage.SearchPage
		local AllItems = {}
		
		for i4, sort1 in ipairs(p2.sorts) do
			table.insert(AllItems, (FeedItemModel.fromSearchApi(SearchUuid, sort1.topicId, sort1.treatmentType, i4, sort1.topicLayoutData)))
		end
		P0 = CryoModule.Dictionary.join(P0, {
			[SearchPage] = CryoModule.Dictionary.join(P0[SearchPage] or {}, { [SearchUuid] = { allItems = AllItems, localItems = {} } })
		})
		
		return P0
	else
		if p2.type == SetFeedItemRenderedRows.name then
			local Entry = P0[p2.appPage]
			
			if p2.secondaryKey and Entry then
				Entry = Entry[p2.secondaryKey]
			end
			if Entry then
				local SetFeedItemRenderedRowsResult = OrderedOmniItemsUtilityModule.setFeedItemRenderedRows(Entry.allItems, p2.feedItemPosition, p2.feedItem, p2.actualNumberOfRows)
				
				if SetFeedItemRenderedRowsResult then
					local JoinResult1 = CryoModule.Dictionary.join(Entry, { allItems = SetFeedItemRenderedRowsResult })
					
					if p2.secondaryKey then
						JoinResult1 = CryoModule.Dictionary.join(P0[p2.appPage], { [p2.secondaryKey] = JoinResult1 })
					end
					P0 = CryoModule.Dictionary.join(P0, { [p2.appPage] = JoinResult1 })
					
					return P0
				end
			end
		elseif p2.type == ClearFeedItemRenderedRows.name then
			local v1 = P0[p2.appPage]
			
			if p2.secondaryKey and v1 then
				v1 = v1[p2.secondaryKey]
			end
			if v1 then
				local SetFeedItemRenderedRowsResult = OrderedOmniItemsUtilityModule.setFeedItemRenderedRows(v1.allItems, p2.feedItemPosition, p2.feedItem, nil)
				
				if SetFeedItemRenderedRowsResult then
					local JoinResult = CryoModule.Dictionary.join(v1, { allItems = SetFeedItemRenderedRowsResult })
					
					if p2.secondaryKey then
						JoinResult = CryoModule.Dictionary.join(P0[p2.appPage], { [p2.secondaryKey] = JoinResult })
					end
					P0 = CryoModule.Dictionary.join(P0, { [p2.appPage] = JoinResult })
				end
			end
		end
		return P0
	end
end