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
local var1 = memoize(function(p1)
	local t = {}
	
	if p1 and p1.sorts then
		for i, v in ipairs(p1.sorts) do
			if v.topicId then
				t[tostring(v.topicId)] = i
			end
		end
	end
	return t
end)

return function(p2, p3, p4)
	-- upvalues: useSelector (ref), topicInfosReducer (ref), appPage (ref), var1 (ref), gameSortGroups (ref), topicContentsReducer (ref), topicInfoModel (ref), retrievalStatus (ref), getTopSearchResultsFetchName (ref), reportWarning (ref), loggingProtocolModule (ref), fetchStatusNamespace (ref), fetchStatusReducer (ref), tutilsModule (ref)
	return useSelector(function(p5)
		-- upvalues: topicInfosReducer (copy), p2 (ref), p3 (ref), appPage (copy), var1 (copy), gameSortGroups (copy), p4 (ref), topicContentsReducer (copy), topicInfoModel (copy), retrievalStatus (copy), getTopSearchResultsFetchName (copy), reportWarning (copy), loggingProtocolModule (copy), fetchStatusNamespace (copy), fetchStatusReducer (copy)
		local var2 = false
		local var3 = false
		local var4 = nil
		local var5 = nil
		local var6 = p5.Personalization[topicInfosReducer.key][p2]
		
		if var6 ~= nil then
			if not var6:isOmni() then
				var2 = true
				local homeGames = nil
				
				if p3 == appPage.Games then
					homeGames = gameSortGroups.Games
				elseif p3 == appPage.Home then
					homeGames = gameSortGroups.HomeGames
				end
				var5 = if homeGames then p5.GameSortGroups[homeGames].pageId else nil
			elseif p3 == appPage.Home then
				local var7 = var1(p5.OmniRecommendations[p3])[p2]
				
				if var7 then
					var2 = true
					var3 = true
					var4 = var7
				end
			end
		end
		local var8 = nil
		local var9 = nil
		local var10 = nil
		
		if p3 ~= appPage.SearchPage then
			local omniRecommendations, var11
			var8 = p5.Personalization[topicContentsReducer.key][p2]
			var9 = p5.Personalization[topicInfosReducer.key][p2]
			local _ = nil
			local _ = nil
			
			if var3 then
				omniRecommendations = fetchStatusNamespace.OmniRecommendations
				var11 = p3
			else
				omniRecommendations = fetchStatusNamespace.GameSorts
				var11 = p2
			end
			var10 = p5.Personalization[fetchStatusReducer.key][omniRecommendations][var11]
		elseif p4 then
			var8 = p5.Personalization[topicContentsReducer.key][p4]
			var9 = p5.Personalization[topicInfosReducer.key][topicInfoModel.makeSearchTopicKey(p4, p2)]
			var2 = true
			local var12 = p5.RequestsStatus.SearchesInGamesStatus[p4]
			
			if var12 == "Removed" then
				var12 = retrievalStatus.NotStarted
			end
			var10 = var12 or p5.FetchingStatus[getTopSearchResultsFetchName("blended", p4)]
		else
			reportWarning(loggingProtocolModule.default, "useGameSortData_MissingSearchUuid", "searchUuid is nil when pageContext is SearchPage")
			var2 = false
		end
		return {
			sortIndex = var4,
			isOmni = var3,
			gameSortDataFound = var2,
			gamesApiSortPageId = var5,
			sort = var9,
			gameSortContents = var8,
			gameSortFetchingStatus = var10 or retrievalStatus.NotStarted
		}
	end, tutilsModule.shallowEqual)
end