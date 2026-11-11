local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local TopicInfosRoduxModule = require(Parent.TopicInfosRodux)
local ParseAndAddGameInfosFunction = require(Parent.GameInfosRodux).parseAndAddGameInfos
local AddTopicInfosFunction = TopicInfosRoduxModule.AddTopicInfos
local TopicContentsRoduxModule = require(Parent.TopicContentsRodux)
local TopicContentsEntryModel = TopicContentsRoduxModule.TopicContentsEntryModel
local TopicContentsModel = TopicContentsRoduxModule.TopicContentsModel
local AddTopicContentsFunction = TopicContentsRoduxModule.AddTopicContents
local GameInfoModel = require(Parent.GameModels).GameInfoModel
local TopicInfoModel = TopicInfosRoduxModule.TopicInfoModel
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local SetFetchStatusFunction = FetchStatusRoduxModule.SetFetchStatus
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local Modules = DiscoveryMonolith.Modules
local GetSearchLandingPageSuggestionModule = require(Modules.LuaApp.Http.Requests.GamesApi.GetSearchLandingPageSuggestion)
local SetOmniAutocompleteSortsModule = require(Modules.LuaApp.Actions.Games.SetOmniAutocompleteSorts)

local function v19(SessionId, Done)
	-- upvalues: SetFetchStatusFunction (copy), FetchStatusNamespace (copy)
	return SetFetchStatusFunction(FetchStatusNamespace.SearchLandingPage, SessionId, Done)
end

function ApiFetchSearchLandingPage(p1, SessionId, Surface)
	-- upvalues: FetchStatusReducer (copy), FetchStatusNamespace (copy), AppPage (copy), RetrievalStatus (copy), PromiseModule (copy), v19 (copy), GetSearchLandingPageSuggestionModule (copy), OmniRecommendationsContentType (copy), TopicContentsEntryModel (copy), CryoModule (copy), ParseAndAddGameInfosFunction (copy), GameInfoModel (copy), TopicInfoModel (copy), TopicContentsModel (copy), AddTopicContentsFunction (copy), AddTopicInfosFunction (copy), SetOmniAutocompleteSortsModule (copy)
	return function(p2)
		-- upvalues: FetchStatusReducer (upval), FetchStatusNamespace (upval), AppPage (upval), RetrievalStatus (upval), PromiseModule (upval), v19 (upval), SessionId (copy), Surface (copy), GetSearchLandingPageSuggestionModule (upval), p1 (copy), OmniRecommendationsContentType (upval), TopicContentsEntryModel (upval), CryoModule (upval), ParseAndAddGameInfosFunction (upval), GameInfoModel (upval), TopicInfoModel (upval), TopicContentsModel (upval), AddTopicContentsFunction (upval), AddTopicInfosFunction (upval), SetOmniAutocompleteSortsModule (upval)
		if p2:getState().Personalization[FetchStatusReducer.key][FetchStatusNamespace.OmniRecommendations][AppPage.SearchLandingPage] == RetrievalStatus.Fetching then
			return PromiseModule.resolve("Data is fetching")
		end
		p2:dispatch(v19(SessionId, RetrievalStatus.Fetching))
		local config = { sessionId = SessionId }
		
		if Surface then
			config.surface = Surface
		end
		return GetSearchLandingPageSuggestionModule(p1, config):andThen(function(Result)
			-- upvalues: PromiseModule (upval), OmniRecommendationsContentType (upval), TopicContentsEntryModel (upval), CryoModule (upval), ParseAndAddGameInfosFunction (upval), p1 (upval), p2 (copy), GameInfoModel (upval), TopicInfoModel (upval), TopicContentsModel (upval), AddTopicContentsFunction (upval), AddTopicInfosFunction (upval), SetOmniAutocompleteSortsModule (upval), v19 (upval), SessionId (upval), RetrievalStatus (upval)
			local ResponseBody = Result.responseBody
			
			if not ResponseBody.sorts then
				return PromiseModule.reject("No sorts found")
			end
			local FromOmniAutocompleteApiResults = {}
			local List = {}
			
			for _, sort in pairs(ResponseBody.sorts) do
				if sort.contentType ~= OmniRecommendationsContentType.Game then
					if sort.contentType == OmniRecommendationsContentType.TrendingSearches then
						local FromOmniAutocompleteApiResult = TopicInfoModel.fromOmniAutocompleteApi(sort)
						p2:dispatch(AddTopicContentsFunction(sort.sortId, TopicContentsModel.fromData({
							hasMoreRows = false,
							nextPageToken = "",
							nextPageExclusiveStartId = 0,
							rowsRequested = 1,
							entries = sort.queries,
							updatedTimestamp = tick()
						}), false))
						table.insert(List, sort)
						table.insert(FromOmniAutocompleteApiResults, FromOmniAutocompleteApiResult)
						continue
					end
					continue
				end
				local Entries = {}
				
				if sort.games == nil then
					warn(`Sort with {sort.contentType} contentType found with no games table! {sort.sortDisplayName}`)
				elseif #sort.games == 0 then
					warn(`Found no games in this sort: {sort.sortDisplayName}`)
				else
					ParseAndAddGameInfosFunction(p1, p2, sort.games, GameInfoModel.fromOmniAutocompleteApi, function(p3, p4)
						-- upvalues: TopicContentsEntryModel (upval), CryoModule (upval), Entries (copy)
						TopicContentsEntryModel.fromOmniAutocompleteApi(p3):match(function(p5)
							-- upvalues: CryoModule (upval), p4 (copy), Entries (upval)
							table.insert(Entries, (CryoModule.Dictionary.join(p4, p5)))
						end):matchError(function(p5)
							warn(p5)
						end)
					end)
					local FromOmniAutocompleteApiResult = TopicInfoModel.fromOmniAutocompleteApi(sort)
					p2:dispatch(AddTopicContentsFunction(sort.sortId, TopicContentsModel.fromData({
						hasMoreRows = false,
						nextPageToken = "",
						nextPageExclusiveStartId = 0,
						rowsRequested = 1,
						entries = Entries,
						updatedTimestamp = tick()
					}), false))
					table.insert(List, sort)
					table.insert(FromOmniAutocompleteApiResults, FromOmniAutocompleteApiResult)
				end
			end
			p2:dispatch(AddTopicInfosFunction(FromOmniAutocompleteApiResults))
			p2:dispatch(SetOmniAutocompleteSortsModule(List))
			p2:dispatch(v19(SessionId, RetrievalStatus.Done))
			
			return PromiseModule.resolve(Result)
		end):catch(function(Err)
			-- upvalues: p2 (copy), v19 (upval), SessionId (upval), RetrievalStatus (upval), PromiseModule (upval)
			p2:dispatch(v19(SessionId, RetrievalStatus.Failed))
			warn(Err)
			
			return PromiseModule.reject(Err)
		end)
	end
end

return ApiFetchSearchLandingPage