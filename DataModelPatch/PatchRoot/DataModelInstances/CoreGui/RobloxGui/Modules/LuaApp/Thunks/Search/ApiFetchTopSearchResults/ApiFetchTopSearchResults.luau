local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CryoModule = require(CorePackages.Packages.Cryo)
local TopicInfosRoduxModule = require(CorePackages.Workspace.Packages.TopicInfosRodux)
local TopicInfoModel = TopicInfosRoduxModule.TopicInfoModel
local AddTopicInfosFunction = TopicInfosRoduxModule.AddTopicInfos
local OmniFeedConstants = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedConstants
local ParseAndAddGameInfosFunction = require(CorePackages.Workspace.Packages.GameInfosRodux).parseAndAddGameInfos
local GameInfoModel = require(CorePackages.Workspace.Packages.GameModels).GameInfoModel
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local GameIconRoduxModule = require(CorePackages.Workspace.Packages.GameIconRodux)
local BigGameIconReducer = GameIconRoduxModule.BigGameIcons.BigGameIconReducer
local ApiFetchBigGameIconsFunction = GameIconRoduxModule.BigGameIcons.ApiFetchBigGameIcons
local GetTopSearchResultsFetchNameFunction = require(CorePackages.Workspace.Packages.DiscoveryUtils).getTopSearchResultsFetchName
local TopicContentsRoduxModule = require(CorePackages.Workspace.Packages.TopicContentsRodux)
local AddTopicContentsFunction = TopicContentsRoduxModule.AddTopicContents
local TopicContentsModel = TopicContentsRoduxModule.TopicContentsModel
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SearchGetOmniSearchFunction = Modules.LuaApp.Http.Requests.SearchGetOmniSearch
local SetSearchInGamesFunction = Modules.LuaApp.Actions.SetSearchInGames
local GameSearchEntry = Modules.LuaApp.Models.GamesApi.GameSearchEntry
local SearchInGames = Modules.LuaApp.Models.SearchInGames
local MapContentTypeToTreatmentTypeFunction = Modules.Personalization.Search.mapContentTypeToTreatmentType
local AddTextSearchResultsFunction = Modules.LuaApp.Actions.AddTextSearchResults
local GetFormattedTextSearchEntryFunction = Modules.LuaApp.Models.DiscoveryApi.getFormattedTextSearchEntry
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local GetFormattedUserSearchEntriesModule = require(Modules1.LuaApp.Components.UserSearch.Models.getFormattedUserSearchEntries)
local AddUsersSearchResultsModule = require(Modules1.LuaApp.Components.UserSearch.Actions.AddUsersSearchResults)
local AddSearchResultsOmniFeedSortsModule = require(Modules1.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeedSorts)
local AddSduiRootConfigFunction = require(CorePackages.Workspace.Packages.ServerDrivenUi).AddSduiRootConfig
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local OmniFeedTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedTypes
local SduiErrors = require(CorePackages.Workspace.Packages.ServerDrivenUi).SduiErrors
local SduiLogger = require(CorePackages.Workspace.Packages.ServerDrivenUi).SduiLogger

local function v24(ResponseBody)
	-- upvalues: OmniFeedTypes (copy), SduiLogger (copy), SduiErrors (copy), AppPage (copy)
	local List = {}
	
	if ResponseBody and ResponseBody.sorts then
		for SortIndex, sort in ResponseBody.sorts do
			local IsTreatmentTypeMatch = sort.treatmentType == OmniFeedTypes.ServerDrivenUi
			local IsNotFeedItemKeyMatch: boolean = sort.feedItemKey ~= nil and sort.feedItemKey ~= ""
			
			if IsTreatmentTypeMatch and IsNotFeedItemKeyMatch then
				table.insert(List, {
					feedItemKey = sort.feedItemKey,
					topicId = sort.topicId,
					sortIndex = SortIndex
				})
			elseif IsTreatmentTypeMatch then
				SduiLogger.reportError(SduiErrors.SduiErrorType.NilFeedItemKeyForSduiSort, {
					name = `{sort.topicId}`,
					message = `Sdui treatmentType but no feedItemKey for topicId {sort.topicId} at index {SortIndex}`
				}, AppPage.SearchPage)
			elseif IsNotFeedItemKeyMatch then
				SduiLogger.reportError(SduiErrors.SduiErrorType.InvalidTreatmentTypeWithFeedItemKey, {
					name = `{sort.topicId}`,
					message = `Has sdui feedItemKey {sort.feedItemKey} but treatmentType {sort.treatmentType} for topicId {sort.topicId} at index {SortIndex}`
				}, AppPage.SearchPage)
			end
		end
	end
	return List
end

return function(p1, p2)
	-- upvalues: PerformFetch (copy), GetTopSearchResultsFetchNameFunction (copy), SearchGetOmniSearchFunction (copy), PromiseModule (copy), MutedErrorFunction (copy), ArgCheckModule (copy), OmniFeedConstants (copy), GetFormattedUserSearchEntriesModule (copy), AddUsersSearchResultsModule (copy), GameSearchEntry (copy), ParseAndAddGameInfosFunction (copy), GameInfoModel (copy), SearchInGames (copy), SetSearchInGamesFunction (copy), AddTopicContentsFunction (copy), TopicContentsModel (copy), BigGameIconReducer (copy), ApiFetchBigGameIconsFunction (copy), GetFormattedTextSearchEntryFunction (copy), AddTextSearchResultsFunction (copy), MapContentTypeToTreatmentTypeFunction (copy), TopicInfoModel (copy), CryoModule (copy), AddTopicInfosFunction (copy), AddSearchResultsOmniFeedSortsModule (copy), v24 (copy), AddSduiRootConfigFunction (copy), AppPage (copy), SduiLogger (copy), SduiErrors (copy)
	local SearchUuid = p2.searchUuid
	
	return PerformFetch.Single(GetTopSearchResultsFetchNameFunction(p2.searchVertical, SearchUuid), function(p3)
		-- upvalues: SearchGetOmniSearchFunction (upval), p1 (copy), p2 (copy), SearchUuid (copy), PromiseModule (upval), MutedErrorFunction (upval), ArgCheckModule (upval), OmniFeedConstants (upval), GetFormattedUserSearchEntriesModule (upval), AddUsersSearchResultsModule (upval), GameSearchEntry (upval), ParseAndAddGameInfosFunction (upval), GameInfoModel (upval), SearchInGames (upval), SetSearchInGamesFunction (upval), AddTopicContentsFunction (upval), TopicContentsModel (upval), BigGameIconReducer (upval), ApiFetchBigGameIconsFunction (upval), GetFormattedTextSearchEntryFunction (upval), AddTextSearchResultsFunction (upval), MapContentTypeToTreatmentTypeFunction (upval), TopicInfoModel (upval), CryoModule (upval), AddTopicInfosFunction (upval), AddSearchResultsOmniFeedSortsModule (upval), v24 (upval), AddSduiRootConfigFunction (upval), AppPage (upval), SduiLogger (upval), SduiErrors (upval)
		return SearchGetOmniSearchFunction(p1, {
			searchQuery = p2.keyword,
			sessionId = SearchUuid,
			globalSessionId = p2.omniSearchUuid,
			verticalType = p2.searchVertical
		}):andThen(function(Result)
			-- upvalues: PromiseModule (upval), MutedErrorFunction (upval), ArgCheckModule (upval), OmniFeedConstants (upval), GetFormattedUserSearchEntriesModule (upval), p3 (copy), AddUsersSearchResultsModule (upval), SearchUuid (upval), p2 (upval), GameSearchEntry (upval), ParseAndAddGameInfosFunction (upval), p1 (upval), GameInfoModel (upval), SearchInGames (upval), SetSearchInGamesFunction (upval), AddTopicContentsFunction (upval), TopicContentsModel (upval), BigGameIconReducer (upval), ApiFetchBigGameIconsFunction (upval), GetFormattedTextSearchEntryFunction (upval), AddTextSearchResultsFunction (upval), MapContentTypeToTreatmentTypeFunction (upval), TopicInfoModel (upval), CryoModule (upval), AddTopicInfosFunction (upval), AddSearchResultsOmniFeedSortsModule (upval), v24 (upval), AddSduiRootConfigFunction (upval), AppPage (upval), SduiLogger (upval), SduiErrors (upval)
			if not Result or not Result.responseBody then
				return PromiseModule.reject("No response body")
			end
			local ResponseBody = Result.responseBody
			local t = {}
			local ContentGroupTypes = {}
			local SearchResults = ResponseBody.searchResults or {}
			for _, searchResult in SearchResults do
				local ContentGroupType = searchResult.contentGroupType
				local TopicId = searchResult.topicId
				
				if ContentGroupType == nil or t[ContentGroupType] then
					MutedErrorFunction(`Duplicate content group type received in ApiFetchTopSearchResults: {ContentGroupType}. Search results may be wonky.`)
				end
				t[ContentGroupType] = true
				ArgCheckModule.assert(not ContentGroupTypes[TopicId], `Already have contentGroupType for topicId {TopicId}! Overwriting existing "{ContentGroupTypes[TopicId]}" with "{ContentGroupType}"`)
				ContentGroupTypes[TopicId] = ContentGroupType
				
				if ContentGroupType == OmniFeedConstants.ContentGroupType.User then
					p3:dispatch(AddUsersSearchResultsModule({
						searchUuid = SearchUuid,
						keyword = p2.keyword,
						entries = GetFormattedUserSearchEntriesModule(searchResult.contents)
					}))
				elseif ContentGroupType == OmniFeedConstants.ContentGroupType.Game then
					local List = {}
					local UniverseId = nil
					ParseAndAddGameInfosFunction(p1, p3, searchResult.contents, GameInfoModel.fromSearchApi, function(p4, p5)
						-- upvalues: TopicId (copy), List (copy), UniverseId (ref), GameSearchEntry (upval)
						if not p4.placeId then
							p4.placeId = p4.rootPlaceId
						end
						if not p4.topicId then
							p4.topicId = TopicId
						end
						if p4.emphasis and #List == 0 then
							UniverseId = p5.universeId
						end
						GameSearchEntry.fromJsonData(p4, true):match(function(p6)
							-- upvalues: List (upval)
							table.insert(List, p6)
						end):matchError(function(p6)
							warn(p6)
						end)
					end)
					local FromOmniSearchResult = SearchInGames.fromOmniSearch(p2.keyword, List, UniverseId ~= nil, nil)
					p3:dispatch(SetSearchInGamesFunction(SearchUuid, FromOmniSearchResult))
					p3:dispatch(AddTopicContentsFunction(p2.searchUuid, TopicContentsModel.fromData(FromOmniSearchResult), false))
					local StateEntry = p3:getState()[BigGameIconReducer.key]
					
					if UniverseId and StateEntry[UniverseId] == nil then
						p3:dispatch(ApiFetchBigGameIconsFunction(p1, { UniverseId }))
					end
				elseif ContentGroupType == OmniFeedConstants.ContentGroupType.Text then
					local UniverseId = searchResult.contents
					local FormattedTextSearchEntry = GetFormattedTextSearchEntryFunction(UniverseId)
					
					if FormattedTextSearchEntry then
						UniverseId = p3
						UniverseId:dispatch(AddTextSearchResultsFunction({
							searchUuid = p2.searchUuid,
							topicId = TopicId,
							entry = FormattedTextSearchEntry
						}))
					end
				end
			end
			local FromTopSearchApiResults = {}
			
			for _, value in ResponseBody.sorts or {} do
				if not value.treatmentType then
					value.treatmentType = MapContentTypeToTreatmentTypeFunction(ContentGroupTypes[value.topicId])
				end
				local FromTopSearchApiResult = TopicInfoModel.fromTopSearchApi(value, SearchUuid)
				FromTopSearchApiResult.topicLayoutData = CryoModule.Dictionary.join(FromTopSearchApiResult.topicLayoutData, {
					showHeader = FromTopSearchApiResult.topicLayoutData.showHeader == nil or FromTopSearchApiResult.topicLayoutData.showHeader
				})
				table.insert(FromTopSearchApiResults, FromTopSearchApiResult)
			end
			p3:dispatch(AddTopicInfosFunction(FromTopSearchApiResults))
			p3:dispatch(AddSearchResultsOmniFeedSortsModule(SearchUuid, FromTopSearchApiResults))
			
			if ResponseBody.sdui then
				local v1 = nil
				v1 = v24(ResponseBody)
				local Success, Result1 = pcall(function()
					-- upvalues: p3 (upval), AddSduiRootConfigFunction (upval), AppPage (upval), ResponseBody (copy), v1 (ref), SearchUuid (upval)
					p3:dispatch(AddSduiRootConfigFunction(AppPage.SearchPage, ResponseBody.sdui, tick(), v1, `{AppPage.SearchPage}_{SearchUuid}`))
				end)
				
				if not Success then
					local Text = ""
					
					if v1 and #v1 > 0 then
						for _, value1 in v1 do
							Text = `{Text} {value1.topicId}`
						end
					end
					SduiLogger.reportError(SduiErrors.SduiErrorType.ErrorStoringTopSearchData, {
						name = "search-api/omni-search",
						message = `Error storing top search response: {Result1} topicIds: {Text}`
					}, AppPage.SearchPage)
				end
			end
			return PromiseModule.resolve()
		end, function(p4)
			-- upvalues: PromiseModule (upval)
			warn(`Promise rejection for ApiFetchTopSearchResults: {p4}`)
			
			return PromiseModule.reject()
		end)
	end)
end