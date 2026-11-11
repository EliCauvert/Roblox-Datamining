local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseMatchSearchPaginationModule = require(UserSearch.Utils.useMatchSearchPagination)
local UsePaginatedProfileInsightsFetchModule = require(script.Parent.Parent.ProfileInsightsContextFetchWrapper.usePaginatedProfileInsightsFetch)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NetworkingPresenceModule = require(UserSearch.Networking.NetworkingPresence)
local _ = require(UserSearch.Common.LocalTypes)
local HydrateFriendStatusesModule = require(UserSearch.Thunks.HydrateFriendStatuses)
local HydrateFollowingStatusesModule = require(UserSearch.Thunks.HydrateFollowingStatuses)
local FFlagPlayerSearchEnableOnlineFrequents = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local FFlagPlayerSearchEnableOnlineFrequentsForAll = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll
local FFlagUserSearchPresenceStoreMigrationModule = require(UserSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local _ = require(Parent.GraphQLServer)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseMatchSearchPaginationModule (copy), UsePaginatedProfileInsightsFetchModule (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagPlayerSearchEnableOnlineFrequentsForAll (copy), ReactModule (copy), CryoModule (copy), FFlagUserSearchPresenceStoreMigrationModule (copy), NetworkingPresenceModule (copy), HydrateFollowingStatusesModule (copy), HydrateFriendStatusesModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseMatchSearchPaginationModuleResult = UseMatchSearchPaginationModule({ users = p1.users })
	local UsePaginatedProfileInsightsFetchModuleResult = UsePaginatedProfileInsightsFetchModule({
		users = p1.users or {},
		searchKeyword = p1.searchParameters.searchKeyword,
		rankingStrategy = if FFlagPlayerSearchEnableOnlineFrequents and p1.enableOnlineFrequents then "profile_info_boost" elseif FFlagPlayerSearchEnableOnlineFrequentsForAll then "profile_info_boost" else nil
	}) or {}
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseMatchSearchPaginationModuleResult (copy)
		return CryoModule.List.map(UseMatchSearchPaginationModuleResult, function(p2)
			return p2.id
		end)
	end, { p1.users })
	ReactModule.useEffect(function()
		-- upvalues: FFlagUserSearchPresenceStoreMigrationModule (upval), UseDispatchResult (copy), NetworkingPresenceModule (upval), UseMemoResult (copy), HydrateFollowingStatusesModule (upval), HydrateFriendStatusesModule (upval)
		if not FFlagUserSearchPresenceStoreMigrationModule then
			UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API(UseMemoResult))
		end
		UseDispatchResult(HydrateFollowingStatusesModule(UseMemoResult))
		UseDispatchResult(HydrateFriendStatusesModule(UseMemoResult))
	end, { UseMemoResult })
	
	return p1.renderComponent({
		mappedProfilesInsights = UsePaginatedProfileInsightsFetchModuleResult
	})
end