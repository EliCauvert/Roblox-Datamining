local parent = script:FindFirstAncestor("GameCollections").Parent
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local tutilsModule = require(parent.tutils)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local appPage = require(parent.RobloxAppEnums).AppPage
local memoize = require(parent.AppCommonLib).memoize
local topicInfosRoduxModule = require(parent.TopicInfosRodux)
local topicInfosReducer = topicInfosRoduxModule.TopicInfosReducer
local topicInfoModel = topicInfosRoduxModule.TopicInfoModel
local gameSortGroups = require(parent.DiscoveryTypes).GameSortGroups
local fetchStatusRoduxModule = require(parent.FetchStatusRodux)
local fetchStatusReducer = fetchStatusRoduxModule.FetchStatusReducer
local fetchStatusNamespace = fetchStatusRoduxModule.FetchStatusNamespace
local topicContentsReducer = require(parent.TopicContentsRodux).TopicContentsReducer
local loggingProtocolModule = require(parent.LoggingProtocol)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local getTopSearchResultsFetchName = require(parent.DiscoveryUtils).getTopSearchResultsFetchName
local var4 = memoize(function(p0)
	local t = {}
	
	if p0 and p0.sorts then
		for i, v in ipairs(p0.sorts) do
			if v.topicId then
				t[tostring(v.topicId)] = i
			end
		end
	end
	return t
end)

return function(p1, p2, p3)
	-- upvalues: useSelector (ref), topicInfosReducer (ref), appPage (ref), var4 (ref), gameSortGroups (ref), topicContentsReducer (ref), topicInfoModel (ref), retrievalStatus (ref), getTopSearchResultsFetchName (ref), reportWarning (ref), loggingProtocolModule (ref), fetchStatusNamespace (ref), fetchStatusReducer (ref), tutilsModule (ref)
	return useSelector(function(p4)
		-- upvalues: topicInfosReducer (copy), p1 (ref), p2 (ref), appPage (copy), var4 (copy), gameSortGroups (copy), p3 (ref), topicContentsReducer (copy), topicInfoModel (copy), retrievalStatus (copy), getTopSearchResultsFetchName (copy), reportWarning (copy), loggingProtocolModule (copy), fetchStatusNamespace (copy), fetchStatusReducer (copy)
		local var6 = false
		local var7 = false
		local var8 = nil
		local var9 = nil
		local var10 = p4.Personalization[topicInfosReducer.key][p1]
		
		if var10 ~= nil then
			if not var10:isOmni() then
				var6 = true
				local homeGames = nil
				
				if p2 == appPage.Games then
					homeGames = gameSortGroups.Games
				elseif p2 == appPage.Home then
					homeGames = gameSortGroups.HomeGames
				end
				var9 = if homeGames then p4.GameSortGroups[homeGames].pageId else nil
			elseif p2 == appPage.Home then
				local var11 = var4(p4.OmniRecommendations[p2])[p1]
				
				if var11 then
					var6 = true
					var7 = true
					var8 = var11
				end
			end
		end
		local var12 = nil
		local var13 = nil
		local var14 = nil
		
		if p2 ~= appPage.SearchPage then
			local omniRecommendations, var16
			var12 = p4.Personalization[topicContentsReducer.key][p1]
			var13 = p4.Personalization[topicInfosReducer.key][p1]
			local _ = nil
			local _ = nil
			
			if var7 then
				omniRecommendations = fetchStatusNamespace.OmniRecommendations
				var16 = p2
			else
				omniRecommendations = fetchStatusNamespace.GameSorts
				var16 = p1
			end
			var14 = p4.Personalization[fetchStatusReducer.key][omniRecommendations][var16]
		elseif p3 then
			var12 = p4.Personalization[topicContentsReducer.key][p3]
			var13 = p4.Personalization[topicInfosReducer.key][topicInfoModel.makeSearchTopicKey(p3, p1)]
			var6 = true
			local var15 = p4.RequestsStatus.SearchesInGamesStatus[p3]
			
			if var15 == "Removed" then
				var15 = retrievalStatus.NotStarted
			end
			var14 = var15 or p4.FetchingStatus[getTopSearchResultsFetchName("blended", p3)]
		else
			reportWarning(loggingProtocolModule.default, "useGameSortData_MissingSearchUuid", "searchUuid is nil when pageContext is SearchPage")
			var6 = false
		end
		return {
			sortIndex = var8,
			isOmni = var7,
			gameSortDataFound = var6,
			gamesApiSortPageId = var9,
			sort = var13,
			gameSortContents = var12,
			gameSortFetchingStatus = var14 or retrievalStatus.NotStarted
		}
	end, tutilsModule.shallowEqual)
end