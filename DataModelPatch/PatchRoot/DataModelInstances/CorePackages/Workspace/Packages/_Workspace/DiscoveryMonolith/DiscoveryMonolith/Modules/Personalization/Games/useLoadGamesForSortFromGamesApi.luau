local HttpService = game:GetService("HttpService")
local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local TutilsModule = require(Parent.tutils)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local TopicInfosReducer = require(Parent.TopicInfosRodux).TopicInfosReducer
local GameSortGroups = require(Parent.DiscoveryTypes).GameSortGroups
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local SetFetchStatusFunction = FetchStatusRoduxModule.SetFetchStatus
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local ApiFetchGamesInSortModule = require(DiscoveryMonolith.Modules.LuaApp.Thunks.Games.ApiFetchGamesInSort)

return function(p1)
	-- upvalues: ReactModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), TopicInfosReducer (copy), FetchStatusReducer (copy), FetchStatusNamespace (copy), RetrievalStatus (copy), TutilsModule (copy), ApiFetchGamesInSortModule (copy), HttpService (copy), SetFetchStatusFunction (copy), SetNextDataExpirationTimeFunction (copy), GameSortGroups (copy), ExpirationTimeNamespace (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: TopicInfosReducer (upval), p1 (copy), FetchStatusReducer (upval), FetchStatusNamespace (upval), RetrievalStatus (upval)
		local PersonalizationEntry = p2.Personalization[TopicInfosReducer.key][p1]
		
		if PersonalizationEntry and PersonalizationEntry:isOmni() then
			PersonalizationEntry = nil
		end
		return {
			gamesApiGameSort = PersonalizationEntry,
			gameSortFetchingStatus = p2.Personalization[FetchStatusReducer.key][FetchStatusNamespace.GameSorts][p1] or RetrievalStatus.NotStarted
		}
	end, TutilsModule.shallowEqual)
	local GamesApiGameSort = UseSelectorResult.gamesApiGameSort
	local GameSortFetchingStatus = UseSelectorResult.gameSortFetchingStatus
	
	return (ReactModule.useCallback(function()
		-- upvalues: GamesApiGameSort (copy), GameSortFetchingStatus (copy), RetrievalStatus (upval), UseDispatchResult (copy), ApiFetchGamesInSortModule (upval), UseRoactServiceResult (copy), UseStateResult (copy), HttpService (upval), SetFetchStatusFunction (upval), FetchStatusNamespace (upval), SetNextDataExpirationTimeFunction (upval), GameSortGroups (upval), ExpirationTimeNamespace (upval), UseStateResult2 (copy)
		if GamesApiGameSort ~= nil and GameSortFetchingStatus == RetrievalStatus.NotStarted then
			assert(GamesApiGameSort, "gamesApiGameSort can never be nil")
			UseDispatchResult(ApiFetchGamesInSortModule(UseRoactServiceResult, GamesApiGameSort, false, nil)):catch(function(Err)
				-- upvalues: UseStateResult (upval), HttpService (upval), UseDispatchResult (upval), SetFetchStatusFunction (upval), FetchStatusNamespace (upval), GamesApiGameSort (upval), RetrievalStatus (upval), SetNextDataExpirationTimeFunction (upval), GameSortGroups (upval), ExpirationTimeNamespace (upval), UseStateResult2 (upval)
				if UseStateResult > 2 then return end
				if Err and Err.Body then
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Err (copy)
						return HttpService:JSONDecode(Err.Body)
					end)
					
					if Success and Result and Result.errors then
						for _, _error in ipairs(Result.errors) do
							if _error.code == 400 and _error.field == "sortToken" then
								UseDispatchResult(SetFetchStatusFunction(FetchStatusNamespace.GameSorts, GamesApiGameSort.name, RetrievalStatus.NotStarted))
								UseDispatchResult(SetNextDataExpirationTimeFunction(GameSortGroups.Games, 0, ExpirationTimeNamespace.GameSortGroup))
								UseStateResult2(UseStateResult + 1)
							end
						end
					end
				end
			end)
			
			return
		end
	end, {
		GamesApiGameSort,
		GameSortFetchingStatus,
		UseStateResult,
		UseRoactServiceResult,
		UseDispatchResult
	}))
end