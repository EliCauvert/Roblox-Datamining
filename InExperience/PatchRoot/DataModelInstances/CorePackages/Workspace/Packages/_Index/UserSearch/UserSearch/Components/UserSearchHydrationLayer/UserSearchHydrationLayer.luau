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
local FFlagUserSearchClassmatesInsight = require(Parent.SharedFlags).FFlagUserSearchClassmatesInsight
local FFlagUserSearchPresenceStoreMigrationModule = require(UserSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local FFlagMigrateFriendshipStatusesUserSearchModule = require(UserSearch.Flags.FFlagMigrateFriendshipStatusesUserSearch)
local FFlagSduiUserSearchTile = require(Parent.SharedFlags).FFlagSduiUserSearchTile
local GetResult = if FFlagMigrateFriendshipStatusesUserSearchModule or FFlagSduiUserSearchTile then require(Parent.DataHydration).Friends.FriendsStore.get() else nil
local GetResult1 = if FFlagSduiUserSearchTile then require(Parent.DataHydration.Following).FollowingStore.get() else nil
local GetResult2 = if FFlagSduiUserSearchTile then require(Parent.DataHydration.ProfileInsights).ProfileInsightsStore.get() else nil
local _ = require(Parent.GraphQLServer)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseMatchSearchPaginationModule (copy), FFlagSduiUserSearchTile (copy), UsePaginatedProfileInsightsFetchModule (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagPlayerSearchEnableOnlineFrequentsForAll (copy), ReactModule (copy), CryoModule (copy), FFlagUserSearchPresenceStoreMigrationModule (copy), NetworkingPresenceModule (copy), FFlagUserSearchClassmatesInsight (copy), GetResult1 (copy), GetResult2 (copy), HydrateFollowingStatusesModule (copy), FFlagMigrateFriendshipStatusesUserSearchModule (copy), GetResult (copy), HydrateFriendStatusesModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseMatchSearchPaginationModuleResult = UseMatchSearchPaginationModule({ users = p1.users })
	local T = if FFlagSduiUserSearchTile then {} else UsePaginatedProfileInsightsFetchModule({
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
		-- upvalues: FFlagUserSearchPresenceStoreMigrationModule (upval), UseDispatchResult (copy), NetworkingPresenceModule (upval), UseMemoResult (copy), FFlagSduiUserSearchTile (upval), FFlagPlayerSearchEnableOnlineFrequentsForAll (upval), FFlagUserSearchClassmatesInsight (upval), GetResult1 (upval), GetResult2 (upval), HydrateFollowingStatusesModule (upval), FFlagMigrateFriendshipStatusesUserSearchModule (upval), GetResult (upval), HydrateFriendStatusesModule (upval)
		if not FFlagUserSearchPresenceStoreMigrationModule then
			UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API(UseMemoResult))
		end
		if FFlagSduiUserSearchTile then
			local ProfileInfoBoost = if FFlagPlayerSearchEnableOnlineFrequentsForAll then "profile_info_boost" else nil
			local config = {
				rankingStrategy = ProfileInfoBoost,
				count = if FFlagUserSearchClassmatesInsight and ProfileInfoBoost then 3 else nil
			}
			
			for _, value in UseMemoResult do
				GetResult1.GetIsFollowing(value)
				GetResult2.GetProfileInsight(value, config)
			end
		else
			UseDispatchResult(HydrateFollowingStatusesModule(UseMemoResult))
		end
		if not FFlagMigrateFriendshipStatusesUserSearchModule and not FFlagSduiUserSearchTile then
			UseDispatchResult(HydrateFriendStatusesModule(UseMemoResult))
			
			return
		end
		for _, value1 in UseMemoResult do
			GetResult.GetFriendshipStatus(value1)
		end
	end, { UseMemoResult })
	
	return p1.renderComponent({ mappedProfilesInsights = T })
end