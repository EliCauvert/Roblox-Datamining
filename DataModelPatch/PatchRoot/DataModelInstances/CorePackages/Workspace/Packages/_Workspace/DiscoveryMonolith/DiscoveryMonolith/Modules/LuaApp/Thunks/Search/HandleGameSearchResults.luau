local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local GameInfoModel = require(Parent.GameModels).GameInfoModel
local GameIconRoduxModule = require(Parent.GameIconRodux)
local ApiFetchBigGameIconsFunction = GameIconRoduxModule.BigGameIcons.ApiFetchBigGameIcons
local BigGameIconReducer = GameIconRoduxModule.BigGameIcons.BigGameIconReducer
local ParseAndAddGameInfosFunction = require(Parent.GameInfosRodux).parseAndAddGameInfos
local OmniFeedConstants = require(Parent.DiscoveryTypes).OmniFeedConstants
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local TopicInfosRoduxModule = require(Parent.TopicInfosRodux)
local AddTopicInfosFunction = TopicInfosRoduxModule.AddTopicInfos
local TopicInfoModel = TopicInfosRoduxModule.TopicInfoModel
local TopicContentsRoduxModule = require(Parent.TopicContentsRodux)
local AddTopicContentsFunction = TopicContentsRoduxModule.AddTopicContents
local TopicContentsModel = TopicContentsRoduxModule.TopicContentsModel
local Modules = DiscoveryMonolith.Modules
local SetSearchInGamesStatusModule = require(Modules.LuaApp.Actions.SetSearchInGamesStatus)
local SearchRetrievalStatusModule = require(Modules.LuaApp.Enum.SearchRetrievalStatus)
local SetSearchInGamesModule = require(Modules.LuaApp.Actions.SetSearchInGames)
local AppendSearchInGamesModule = require(Modules.LuaApp.Actions.AppendSearchInGames)
local GameSearchEntryModule = require(Modules.LuaApp.Models.GamesApi.GameSearchEntry)
local SearchInGamesModule = require(Modules.LuaApp.Models.SearchInGames)
local MapContentTypeToTreatmentTypeModule = require(Modules.Personalization.Search.mapContentTypeToTreatmentType)
local AddSearchResultsOmniFeedModule = require(Modules.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed)
local GetFormattedTextSearchEntryModule = require(Modules.LuaApp.Models.DiscoveryApi.getFormattedTextSearchEntry)
local AddTextSearchResultsModule = require(Modules.LuaApp.Actions.AddTextSearchResults)

return function(p1, p2, p3)
	-- upvalues: BigGameIconReducer (copy), SearchRetrievalStatusModule (copy), PromiseModule (copy), MapContentTypeToTreatmentTypeModule (copy), OmniFeedConstants (copy), CryoModule (copy), GameSearchEntryModule (copy), AddSearchResultsOmniFeedModule (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy), GetFormattedTextSearchEntryModule (copy), AddTextSearchResultsModule (copy), TopicInfoModel (copy), AddTopicInfosFunction (copy), ParseAndAddGameInfosFunction (copy), GameInfoModel (copy), SearchInGamesModule (copy), AppendSearchInGamesModule (copy), SetSearchInGamesModule (copy), AddTopicContentsFunction (copy), TopicContentsModel (copy), SetSearchInGamesStatusModule (copy), ApiFetchBigGameIconsFunction (copy)
	return function(p4)
		-- upvalues: BigGameIconReducer (upval), p3 (copy), p2 (copy), SearchRetrievalStatusModule (upval), PromiseModule (upval), MapContentTypeToTreatmentTypeModule (upval), OmniFeedConstants (upval), CryoModule (upval), GameSearchEntryModule (upval), AddSearchResultsOmniFeedModule (upval), ReportWarningFunction (upval), LoggingProtocolModule (upval), GetFormattedTextSearchEntryModule (upval), AddTextSearchResultsModule (upval), TopicInfoModel (upval), AddTopicInfosFunction (upval), ParseAndAddGameInfosFunction (upval), p1 (copy), GameInfoModel (upval), SearchInGamesModule (upval), AppendSearchInGamesModule (upval), SetSearchInGamesModule (upval), AddTopicContentsFunction (upval), TopicContentsModel (upval), SetSearchInGamesStatusModule (upval), ApiFetchBigGameIconsFunction (upval)
		local t = {}
		local StateEntry = p4:getState()[BigGameIconReducer.key]
		local ResponseBody = p3.responseBody
		
		if p4:getState().RequestsStatus.SearchesInGamesStatus[p2.searchUuid] == SearchRetrievalStatusModule.Removed then
			return PromiseModule.resolve("Search with Uuid " .. p2.searchUuid .. " has been terminated")
		end
		local UniverseId = nil
		local Flag = false
		local Contents = {}
		local Count = 1
		local TopicLayoutDatas = {}
		
		if ResponseBody.sorts then
			for _, sort in ResponseBody.sorts do
				if sort.topicId and sort.topicLayoutData then
					TopicLayoutDatas[sort.topicId] = sort.topicLayoutData
				end
			end
		end
		local FromSearchApiResults = {}
		local t1 = {}
		
		for i, searchResult in pairs(ResponseBody.searchResults) do
			local Content = searchResult.contents[1]
			local TopicId = searchResult.topicId
			local TopicLayoutData = TopicLayoutDatas[TopicId] or {}
			local ContentGroupType = searchResult.contentGroupType
			local MapContentTypeToTreatmentTypeModuleResult = MapContentTypeToTreatmentTypeModule(searchResult.contentGroupType)
			
			if ContentGroupType == OmniFeedConstants.ContentGroupType.Game then
				local Text = tostring(Content.rootPlaceId)
				table.insert(Contents, Content)
				GameSearchEntryModule.fromJsonData(CryoModule.Dictionary.join(Content, { topicId = TopicId, placeId = Text }), true):match(function(p5)
					-- upvalues: t (copy), Count (ref), p4 (copy), AddSearchResultsOmniFeedModule (upval), p2 (upval), TopicId (copy), MapContentTypeToTreatmentTypeModuleResult (copy), TopicLayoutData (copy), Content (copy), UniverseId (ref), Flag (ref)
					t[Count] = p5
					p4:dispatch(AddSearchResultsOmniFeedModule(p2.searchUuid, TopicId, MapContentTypeToTreatmentTypeModuleResult, Count, TopicLayoutData))
					
					if Count == 1 and Content.emphasis then
						UniverseId = Content.universeId
						Flag = true
					end
					Count += 1
				end):matchError(function(p5)
					-- upvalues: ReportWarningFunction (upval), LoggingProtocolModule (upval)
					ReportWarningFunction(LoggingProtocolModule.default, "GameSearchEntryParseError", p5)
				end)
			elseif ContentGroupType == OmniFeedConstants.ContentGroupType.Text then
				local FormattedTextSearchEntryModule = GetFormattedTextSearchEntryModule(searchResult.contents)
				
				if FormattedTextSearchEntryModule then
					p4:dispatch(AddSearchResultsOmniFeedModule(p2.searchUuid, TopicId, MapContentTypeToTreatmentTypeModuleResult, i, TopicLayoutData))
					p4:dispatch(AddTextSearchResultsModule({
						searchUuid = p2.searchUuid,
						topicId = TopicId,
						entry = FormattedTextSearchEntryModule
					}))
				end
			end
			if not t1[TopicId] then
				t1[TopicId] = true
				table.insert(FromSearchApiResults, (TopicInfoModel.fromSearchApi({
					topicId = TopicId,
					treatmentType = MapContentTypeToTreatmentTypeModule(searchResult.contentGroupType),
					topicLayoutData = TopicLayoutData
				}, p2.searchUuid)))
			end
		end
		p4:dispatch(AddTopicInfosFunction(FromSearchApiResults))
		ParseAndAddGameInfosFunction(p1, p4, Contents, GameInfoModel.fromSearchApi, nil)
		local FromOmniSearchResult = SearchInGamesModule.fromOmniSearch(p2.searchKeyword, t, Flag, ResponseBody.nextPageToken, ResponseBody.paginationMethod)
		
		if p2.isAppend then
			p4:dispatch(AppendSearchInGamesModule(p2.searchUuid, FromOmniSearchResult))
		else
			p4:dispatch(SetSearchInGamesModule(p2.searchUuid, FromOmniSearchResult))
		end
		p4:dispatch(AddTopicContentsFunction(p2.searchUuid, TopicContentsModel.fromData(FromOmniSearchResult), p2.isAppend))
		p4:dispatch(SetSearchInGamesStatusModule(p2.searchUuid, SearchRetrievalStatusModule.Done))
		
		if UniverseId and StateEntry[UniverseId] == nil then
			p4:dispatch(ApiFetchBigGameIconsFunction(p1, { UniverseId }))
		end
		return PromiseModule.resolve()
	end
end