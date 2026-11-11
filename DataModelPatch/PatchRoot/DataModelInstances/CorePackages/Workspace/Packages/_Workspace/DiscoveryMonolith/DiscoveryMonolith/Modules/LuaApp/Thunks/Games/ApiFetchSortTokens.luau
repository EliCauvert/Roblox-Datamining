local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local GameSortGroups = require(Parent.DiscoveryTypes).GameSortGroups
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local TopicInfosRoduxModule = require(Parent.TopicInfosRodux)
local TopicInfoModel = TopicInfosRoduxModule.TopicInfoModel
local AddTopicInfosFunction = TopicInfosRoduxModule.AddTopicInfos
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local SetFetchStatusFunction = FetchStatusRoduxModule.SetFetchStatus
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local ExploreContentType = require(Parent.DiscoveryTypes).ExploreContentType
local UpdateGameFiltersDataFunction = require(Parent.GameFilters).DataStore.updateGameFiltersData
local GameFiltersReducer = require(Parent.GameFilters).DataStore.GameFiltersReducer
local GetSelectedGameFilterOptionsFunction = require(Parent.GameFilters).DataStore.getSelectedGameFilterOptions
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local OmniFeedPageSection = require(Parent.DiscoveryTypes).OmniFeedConstants.OmniFeedPageSection
local Modules = DiscoveryMonolith.Modules
local DiscoverPageSessionModule = require(Modules.Personalization.Sessions.DiscoverPageSession)
local UpdateGamesSortDataModule = require(Modules.LuaApp.Thunks.Games.updateGamesSortData)
local UpdateSongsSortDataModule = require(Modules.LuaApp.Thunks.Songs.updateSongsSortData)
local SetPageSessionTimestampModule = require(Modules.Personalization.Sessions.DataStore.SetPageSessionTimestamp)
local ExploreGetSortsModule = require(Modules.LuaApp.Http.Requests.ExploreApi.ExploreGetSorts)
local ExploreGetSortsMetadataModule = require(Modules.LuaApp.Http.Requests.ExploreApi.ExploreGetSortsMetadata)
local AppendGameSortsInGroupModule = require(Modules.LuaApp.Actions.Games.AppendGameSortsInGroup)
local SetGameSortsInGroupModule = require(Modules.LuaApp.Actions.Games.SetGameSortsInGroup)
local SetDiscoveryNextPageIdModule = require(Modules.Personalization.Games.Discovery.SetDiscoveryNextPageId)
local AddExploreOmniItemsModule = require(Modules.Personalization.OmniFeed.DataStore.AddExploreOmniItems)
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local FFlagLuaAppFixGamesListSortTokenExpiringTime = require(Parent.SharedFlags).FFlagLuaAppFixGamesListSortTokenExpiringTime
local FFlagLuaAppChartsStickyHeader = require(Parent.SharedFlags).FFlagLuaAppChartsStickyHeader
local FFlagLuaAppFixChartsRenderOnFail = require(Parent.SharedFlags).FFlagLuaAppFixChartsRenderOnFail
local LuaAppErrorOnBadSortGroup = game:DefineFastFlag("LuaAppErrorOnBadSortGroup", false)
local LuaAppGamesListSortTokenExpiryInSec = game:DefineFastInt("LuaAppGamesListSortTokenExpiryInSec", 600)

local function v34(Games, Done)
	-- upvalues: SetFetchStatusFunction (copy), FetchStatusNamespace (copy)
	return SetFetchStatusFunction(FetchStatusNamespace.GameSortToken, Games, Done)
end

local function parseExploreSortDataIntoStore(p1, p2, Games, Sorts, p3, Header)
	-- upvalues: FFlagLuaAppFixChartsRenderOnFail (copy), PromiseModule (copy), FFlagLuaAppChartsStickyHeader (copy), AppPage (copy), OmniFeedPageSection (copy), TopicInfoModel (copy), ExploreContentType (copy), UpdateGameFiltersDataFunction (copy), UpdateGamesSortDataModule (copy), SetFetchStatusFunction (copy), FetchStatusNamespace (copy), RetrievalStatus (copy), FFlagEnableTopSongsSort (copy), UpdateSongsSortDataModule (copy), AddTopicInfosFunction (copy), AppendGameSortsInGroupModule (copy), SetGameSortsInGroupModule (copy), GameSortGroups (copy), AddExploreOmniItemsModule (copy)
	if FFlagLuaAppFixChartsRenderOnFail then
		if not Sorts then
			return PromiseModule.reject("No sort list found in response.")
		end
		if #Sorts == 0 then
			return PromiseModule.resolve()
		end
	elseif not Sorts or #Sorts == 0 then
		return PromiseModule.reject("No sort data found in response.")
	end
	if FFlagLuaAppChartsStickyHeader then
		local State = p2:getState()
		local OrderedOmniItem = State.Personalization.OrderedOmniItems and State.Personalization.OrderedOmniItems[AppPage.Games]
		local AllItems = if OrderedOmniItem then OrderedOmniItem.allItems or {} else {}
		
		if Header == OmniFeedPageSection.Header and #AllItems > 0 and AllItems[#AllItems].pageSection ~= OmniFeedPageSection.Header and p3 then
			return PromiseModule.reject("Header sorts should not be added when there is already body content, to avoid adding header items in the middle of the feed.")
		end
	end
	local FromExploreJsonDataResults = {}
	local Names = {}
	local TopicLayoutDatas = {}
	
	for i, sort in ipairs(Sorts) do
		local FromExploreJsonDataResult = TopicInfoModel.fromExploreJsonData(sort)
		FromExploreJsonDataResults[i] = FromExploreJsonDataResult
		Names[i] = FromExploreJsonDataResult.name
		TopicLayoutDatas[i] = FromExploreJsonDataResult.topicLayoutData
		
		if sort.contentType == ExploreContentType.Filters then
			UpdateGameFiltersDataFunction(p2, Games, sort.filters)
		elseif sort.contentType == ExploreContentType.Games then
			if sort.games then
				UpdateGamesSortDataModule(p1, p2, sort)
				p2:dispatch(SetFetchStatusFunction(FetchStatusNamespace.GameSorts, FromExploreJsonDataResult.name, RetrievalStatus.Done))
			end
		elseif not FFlagEnableTopSongsSort or sort.contentType ~= ExploreContentType.Songs then
			warn(`unsupported explore content type: {sort.contentType}`)
		elseif sort.songs then
			UpdateSongsSortDataModule(p2, sort, false, p1)
			p2:dispatch(SetFetchStatusFunction(FetchStatusNamespace.GameSorts, FromExploreJsonDataResult.name, RetrievalStatus.Done))
		end
	end
	p2:dispatch(AddTopicInfosFunction(FromExploreJsonDataResults))
	
	if p3 then
		p2:dispatch(AppendGameSortsInGroupModule(Games, Names, TopicLayoutDatas))
	else
		p2:dispatch(SetGameSortsInGroupModule(Games, Names, "", TopicLayoutDatas))
	end
	if Games == GameSortGroups.Games then
		p2:dispatch(AddExploreOmniItemsModule(AppPage.Games, FromExploreJsonDataResults, p3, if FFlagLuaAppChartsStickyHeader then Header else nil))
	end
	return PromiseModule.resolve()
end

local function fetchToken(p4, p5, Games, p6, p7)
	-- upvalues: GameSortGroups (copy), ExploreGetSortsMetadataModule (copy), DiscoverPageSessionModule (copy), parseExploreSortDataIntoStore (copy), FFlagLuaAppFixGamesListSortTokenExpiringTime (copy), LuaAppGamesListSortTokenExpiryInSec (copy), SetNextDataExpirationTimeFunction (copy), ExpirationTimeNamespace (copy), v34 (copy), RetrievalStatus (copy), GameFiltersReducer (copy), GetSelectedGameFilterOptionsFunction (copy), CryoModule (copy), ExploreGetSortsModule (copy), PromiseModule (copy), FFlagLuaAppChartsStickyHeader (copy), SetDiscoveryNextPageIdModule (copy), SetPageSessionTimestampModule (copy), AppPage (copy), OmniFeedPageSection (copy), LuaAppErrorOnBadSortGroup (copy), FlaggedMutedErrorFunction (copy)
	local v1: boolean = p6 and p6 ~= ""
	
	if Games == GameSortGroups.GamesList then
		return ExploreGetSortsMetadataModule(p4, DiscoverPageSessionModule:Get()):andThen(function(Result)
			-- upvalues: parseExploreSortDataIntoStore (upval), p4 (copy), p5 (copy), Games (copy), FFlagLuaAppFixGamesListSortTokenExpiringTime (upval), LuaAppGamesListSortTokenExpiryInSec (upval), SetNextDataExpirationTimeFunction (upval), GameSortGroups (upval), ExpirationTimeNamespace (upval), v34 (upval), RetrievalStatus (upval)
			return parseExploreSortDataIntoStore(p4, p5, Games, Result and (Result.responseBody and Result.responseBody.sortMetadata)):andThen(function()
				-- upvalues: FFlagLuaAppFixGamesListSortTokenExpiringTime (upval), LuaAppGamesListSortTokenExpiryInSec (upval), p5 (upval), SetNextDataExpirationTimeFunction (upval), GameSortGroups (upval), ExpirationTimeNamespace (upval), v34 (upval), Games (upval), RetrievalStatus (upval)
				if FFlagLuaAppFixGamesListSortTokenExpiringTime then
					p5:dispatch(SetNextDataExpirationTimeFunction(GameSortGroups.GamesList, math.floor(tick() + LuaAppGamesListSortTokenExpiryInSec), ExpirationTimeNamespace.GameSortGroup))
				end
				p5:dispatch(v34(Games, RetrievalStatus.Done))
			end)
		end):catch(function()
			-- upvalues: p5 (copy), v34 (upval), Games (copy), RetrievalStatus (upval)
			p5:dispatch(v34(Games, RetrievalStatus.Failed))
		end)
	end
	if Games == GameSortGroups.Games then
		if not v1 then
			DiscoverPageSessionModule:Refresh()
		end
		local PersonalizationEntry = p5:getState().Personalization[GameFiltersReducer.key][Games]
		
		return ExploreGetSortsModule(p4, p6, CryoModule.Dictionary.join(GetSelectedGameFilterOptionsFunction(if PersonalizationEntry then PersonalizationEntry.allFilters else {}), p7 or {}), DiscoverPageSessionModule:Get()):andThen(function(Result)
			-- upvalues: PromiseModule (upval), FFlagLuaAppChartsStickyHeader (upval), p5 (copy), SetDiscoveryNextPageIdModule (upval), SetPageSessionTimestampModule (upval), AppPage (upval), parseExploreSortDataIntoStore (upval), p4 (copy), Games (copy), v1 (copy), OmniFeedPageSection (upval), v34 (upval), RetrievalStatus (upval)
			if Result and Result.responseBody and Result.responseBody.sorts then
				local Sorts = if FFlagLuaAppChartsStickyHeader and Result.responseBody.header then Result.responseBody.header.sorts else nil
				local Sorts1 = Result.responseBody.sorts
				p5:dispatch(SetDiscoveryNextPageIdModule(Result.responseBody.nextSortsPageToken or ""))
				p5:dispatch(SetPageSessionTimestampModule(AppPage.Games))
				
				return if FFlagLuaAppChartsStickyHeader and Sorts and #Sorts > 0 then parseExploreSortDataIntoStore(p4, p5, Games, Sorts, v1, OmniFeedPageSection.Header):andThen(function()
					-- upvalues: Sorts1 (copy), parseExploreSortDataIntoStore (upval), p4 (upval), p5 (upval), Games (upval), PromiseModule (upval)
					return if Sorts1 and #Sorts1 > 0 then parseExploreSortDataIntoStore(p4, p5, Games, Sorts1, true) else PromiseModule.resolve()
				end):andThen(function()
					-- upvalues: p5 (upval), v34 (upval), Games (upval), RetrievalStatus (upval)
					return p5:dispatch(v34(Games, RetrievalStatus.Done))
				end) else parseExploreSortDataIntoStore(p4, p5, Games, Sorts1, v1):andThen(function()
					-- upvalues: p5 (upval), v34 (upval), Games (upval), RetrievalStatus (upval)
					return p5:dispatch(v34(Games, RetrievalStatus.Done))
				end)
			else
				return PromiseModule.reject("Invalid response")
			end
		end):catch(function(Err)
			-- upvalues: p5 (copy), v34 (upval), Games (copy), RetrievalStatus (upval), PromiseModule (upval), FFlagLuaAppChartsStickyHeader (upval)
			p5:dispatch(v34(Games, RetrievalStatus.Failed))
			
			return PromiseModule.reject(FFlagLuaAppChartsStickyHeader and Err or "Update failed")
		end)
	else
		local Message: string = `Unsupported GameSortGroups {Games} called.`
		p5:dispatch(v34(Games, RetrievalStatus.Failed))
		
		if LuaAppErrorOnBadSortGroup then
			FlaggedMutedErrorFunction("BadGameSortGroups", Message)
		end
		return PromiseModule.reject(Message)
	end
end

return function(p4, p5, p6, p7)
	-- upvalues: FetchStatusReducer (copy), FetchStatusNamespace (copy), RetrievalStatus (copy), PromiseModule (copy), v34 (copy), fetchToken (copy)
	return function(p8)
		-- upvalues: FetchStatusReducer (upval), FetchStatusNamespace (upval), p5 (copy), RetrievalStatus (upval), PromiseModule (upval), v34 (upval), fetchToken (upval), p4 (copy), p6 (copy), p7 (copy)
		if p8:getState().Personalization[FetchStatusReducer.key][FetchStatusNamespace.GameSortToken][p5] == RetrievalStatus.Fetching then
			return PromiseModule.resolve("Data is fetching.")
		else
			p8:dispatch(v34(p5, RetrievalStatus.Fetching))
			
			return fetchToken(p4, p8, p5, p6, p7)
		end
	end
end