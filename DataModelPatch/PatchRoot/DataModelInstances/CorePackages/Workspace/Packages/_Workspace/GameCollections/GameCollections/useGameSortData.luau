local Parent = script:FindFirstAncestor("GameCollections").Parent
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local TutilsModule = require(Parent.tutils)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local AppPage = require(Parent.RobloxAppEnums).AppPage
local TopicInfosRoduxModule = require(Parent.TopicInfosRodux)
local TopicInfosReducer = TopicInfosRoduxModule.TopicInfosReducer
local TopicInfoModel = TopicInfosRoduxModule.TopicInfoModel
local GameSortGroups = require(Parent.DiscoveryTypes).GameSortGroups
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local TopicContentsReducer = require(Parent.TopicContentsRodux).TopicContentsReducer
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local GetTopSearchResultsFetchNameFunction = require(Parent.DiscoveryUtils).getTopSearchResultsFetchName
local MemoizeResult = require(Parent.AppCommonLib).memoize(function(p1)
	local t = {}
	
	if p1 and p1.sorts then
		for i, sort in ipairs(p1.sorts) do
			if sort.topicId then
				t[tostring(sort.topicId)] = i
			end
		end
	end
	return t
end)

return function(p2, Home, p3)
	-- upvalues: UseSelectorFunction (copy), TopicInfosReducer (copy), AppPage (copy), MemoizeResult (copy), GameSortGroups (copy), TopicContentsReducer (copy), TopicInfoModel (copy), RetrievalStatus (copy), GetTopSearchResultsFetchNameFunction (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy), FetchStatusNamespace (copy), FetchStatusReducer (copy), TutilsModule (copy)
	return UseSelectorFunction(function(p4)
		-- upvalues: TopicInfosReducer (upval), p2 (copy), Home (copy), AppPage (upval), MemoizeResult (upval), GameSortGroups (upval), p3 (copy), TopicContentsReducer (upval), TopicInfoModel (upval), RetrievalStatus (upval), GetTopSearchResultsFetchNameFunction (upval), ReportWarningFunction (upval), LoggingProtocolModule (upval), FetchStatusNamespace (upval), FetchStatusReducer (upval)
		local Flag = false
		local IsOmni = false
		local SortIndex = nil
		local PageId = nil
		local PersonalizationEntry = p4.Personalization[TopicInfosReducer.key][p2]
		
		if PersonalizationEntry ~= nil then
			if PersonalizationEntry:isOmni() then
				if Home == AppPage.Home then
					local MemoizeResultResultEntry = MemoizeResult(p4.OmniRecommendations[Home])[p2]
					
					if MemoizeResultResultEntry then
						Flag = true
						IsOmni = true
						SortIndex = MemoizeResultResultEntry
					end
				end
			else
				Flag = true
				local Games = if Home == AppPage.Games then GameSortGroups.Games elseif Home == AppPage.Home then GameSortGroups.HomeGames else nil
				PageId = if Games then p4.GameSortGroups[Games].pageId else nil
			end
		end
		local PersonalizationEntry1 = nil
		local PersonalizationEntry11 = nil
		local PersonalizationEntry2 = nil
		
		if Home == AppPage.SearchPage then
			if p3 then
				PersonalizationEntry1 = p4.Personalization[TopicContentsReducer.key][p3]
				PersonalizationEntry11 = p4.Personalization[TopicInfosReducer.key][TopicInfoModel.makeSearchTopicKey(p3, p2)]
				Flag = true
				local SearchesInGamesStatusEntry = p4.RequestsStatus.SearchesInGamesStatus[p3]
				
				if SearchesInGamesStatusEntry == "Removed" then
					SearchesInGamesStatusEntry = RetrievalStatus.NotStarted
				end
				local FetchingStatusEntry = p4.FetchingStatus[GetTopSearchResultsFetchNameFunction("blended", p3)]
				PersonalizationEntry2 = SearchesInGamesStatusEntry or FetchingStatusEntry
			else
				ReportWarningFunction(LoggingProtocolModule.default, "useGameSortData_MissingSearchUuid", "searchUuid is nil when pageContext is SearchPage")
				Flag = false
			end
		else
			PersonalizationEntry1 = p4.Personalization[TopicContentsReducer.key][p2]
			PersonalizationEntry11 = p4.Personalization[TopicInfosReducer.key][p2]
			local OmniRecommendations = nil
			local Home1 = nil
			
			if IsOmni then
				OmniRecommendations = FetchStatusNamespace.OmniRecommendations
				Home1 = Home
			else
				OmniRecommendations = FetchStatusNamespace.GameSorts
				Home1 = p2
			end
			PersonalizationEntry2 = p4.Personalization[FetchStatusReducer.key][OmniRecommendations][Home1]
		end
		return {
			sortIndex = SortIndex,
			isOmni = IsOmni,
			gameSortDataFound = Flag,
			gamesApiSortPageId = PageId,
			sort = PersonalizationEntry11,
			gameSortContents = PersonalizationEntry1,
			gameSortFetchingStatus = PersonalizationEntry2 or RetrievalStatus.NotStarted
		}
	end, TutilsModule.shallowEqual)
end