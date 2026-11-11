local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local DEFAULTGAMEFETCHCOUNT = DiscoveryTypesModule.Constants.DEFAULT_GAME_FETCH_COUNT
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local Modules = DiscoveryMonolith.Modules
local FetchDataWithErrorToastsModule = require(Modules.LuaApp.Thunks.FetchDataWithErrorToasts)
local ApiFetchGamesInSortModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamesInSort)
local ApiFetchOmniRecommendationsMetadataModule = require(Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata)
local FFlagLuaAppLogOmniRecommendationsMetadata = require(Parent.SharedFlags).FFlagLuaAppLogOmniRecommendationsMetadata

return function(p1, p2, Fetching, p3, p4)
	-- upvalues: RetrievalStatus (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppLogging (copy), UseDispatchFunction (copy), ReactModule (copy), FetchDataWithErrorToastsModule (copy), ApiFetchOmniRecommendationsMetadataModule (copy), DEFAULTGAMEFETCHCOUNT (copy), FFlagLuaAppLogOmniRecommendationsMetadata (copy), DiscoveryTypesModule (copy), ApiFetchGamesInSortModule (copy), ReportWarningFunction (copy)
	local IsFetchingMatch = Fetching == RetrievalStatus.Fetching
	local NoIsFetchingMatch: boolean = (p1 and p1.hasMoreRows or false) and not IsFetchingMatch
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppLogging)
	local UseDispatchResult = UseDispatchFunction()
	
	return (ReactModule.useCallback(function()
		-- upvalues: NoIsFetchingMatch (copy), p1 (copy), p2 (copy), UseDispatchResult (copy), FetchDataWithErrorToastsModule (upval), ApiFetchOmniRecommendationsMetadataModule (upval), UseRoactServiceResult (copy), p3 (copy), p4 (copy), DEFAULTGAMEFETCHCOUNT (upval), UseRoactServiceResult1 (copy), FFlagLuaAppLogOmniRecommendationsMetadata (upval), DiscoveryTypesModule (upval), ApiFetchGamesInSortModule (upval), ReportWarningFunction (upval)
		if not NoIsFetchingMatch then return end
		if p1 == nil or p2 == nil then return end
		if p2:isOmni() then
			return UseDispatchResult((FetchDataWithErrorToastsModule((ApiFetchOmniRecommendationsMetadataModule(UseRoactServiceResult, p3, p4, DEFAULTGAMEFETCHCOUNT, UseRoactServiceResult1, if FFlagLuaAppLogOmniRecommendationsMetadata then "useLoadMoreGames" else nil)))))
		elseif p2.dataSource == DiscoveryTypesModule.DataSourceType.ExploreApi then
			return UseDispatchResult((FetchDataWithErrorToastsModule((ApiFetchGamesInSortModule(UseRoactServiceResult, p2, true, {
				startRows = p1.rowsRequested,
				maxRows = DEFAULTGAMEFETCHCOUNT,
				exclusiveStartId = p1.nextPageExclusiveStartId,
				pageToken = p1.nextPageToken
			})))))
		else
			ReportWarningFunction(UseRoactServiceResult1, "DataFetch", `Tried to fetch more games for unsupported API. sort: {p2.name}, API: {p2.dataSource}`)
		end
	end, {
		NoIsFetchingMatch, UseRoactServiceResult, UseDispatchResult, p3, p2, p1, p4,
		UseRoactServiceResult1
	}))
end