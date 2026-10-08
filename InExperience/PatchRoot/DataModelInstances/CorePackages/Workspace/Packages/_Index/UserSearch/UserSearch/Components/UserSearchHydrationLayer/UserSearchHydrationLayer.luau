local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useMatchSearchPaginationModule = require(userSearch.Utils.useMatchSearchPagination)
local usePaginatedProfileInsightsFetchModule = require(script.Parent.Parent.ProfileInsightsContextFetchWrapper.usePaginatedProfileInsightsFetch)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local networkingPresenceModule = require(userSearch.Networking.NetworkingPresence)
local _ = require(userSearch.Common.LocalTypes)
local hydrateFriendStatusesModule = require(userSearch.Thunks.HydrateFriendStatuses)
local hydrateFollowingStatusesModule = require(userSearch.Thunks.HydrateFollowingStatuses)
local fFlagPlayerSearchEnableOnlineFrequents = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local fFlagPlayerSearchEnableOnlineFrequentsForAll = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll
local fFlagUserSearchClassmatesInsight = require(parent.SharedFlags).FFlagUserSearchClassmatesInsight
local fFlagUserSearchPresenceStoreMigrationModule = require(userSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local fFlagMigrateFriendshipStatusesUserSearchModule = require(userSearch.Flags.FFlagMigrateFriendshipStatusesUserSearch)
local fFlagSduiUserSearchTile = require(parent.SharedFlags).FFlagSduiUserSearchTile
local var1 = if fFlagMigrateFriendshipStatusesUserSearchModule or fFlagSduiUserSearchTile then require(parent.DataHydration).Friends.FriendsStore.get() else nil
local var2 = if fFlagSduiUserSearchTile then require(parent.DataHydration.Following).FollowingStore.get() else nil
local var3 = if fFlagSduiUserSearchTile then require(parent.DataHydration.ProfileInsights).ProfileInsightsStore.get() else nil
local _ = require(parent.GraphQLServer)

return function(p1)
	-- upvalues: useDispatch (ref), useMatchSearchPaginationModule (ref), fFlagSduiUserSearchTile (ref), usePaginatedProfileInsightsFetchModule (ref), fFlagPlayerSearchEnableOnlineFrequents (ref), fFlagPlayerSearchEnableOnlineFrequentsForAll (ref), reactModule (ref), cryoModule (ref), fFlagUserSearchPresenceStoreMigrationModule (ref), networkingPresenceModule (ref), fFlagUserSearchClassmatesInsight (ref), var2 (ref), var3 (ref), hydrateFollowingStatusesModule (ref), fFlagMigrateFriendshipStatusesUserSearchModule (ref), var1 (ref), hydrateFriendStatusesModule (ref)
	local var4 = useDispatch()
	local var5 = useMatchSearchPaginationModule({ users = p1.users })
	local t = {}
	
	if not fFlagSduiUserSearchTile then
		local t_1 = {
			users = p1.users or {},
			searchKeyword = p1.searchParameters.searchKeyword,
			rankingStrategy = if fFlagPlayerSearchEnableOnlineFrequents and p1.enableOnlineFrequents or fFlagPlayerSearchEnableOnlineFrequentsForAll then "profile_info_boost" else nil
		}
		t = usePaginatedProfileInsightsFetchModule(t_1) or {}
	end
	local var6 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var5 (ref)
		return cryoModule.List.map(var5, function(p2)
			return p2.id
		end)
	end, { p1.users })
	reactModule.useEffect(function()
		-- upvalues: fFlagUserSearchPresenceStoreMigrationModule (copy), var4 (ref), networkingPresenceModule (copy), var6 (ref), fFlagSduiUserSearchTile (copy), fFlagPlayerSearchEnableOnlineFrequentsForAll (copy), fFlagUserSearchClassmatesInsight (copy), var2 (copy), var3 (copy), hydrateFollowingStatusesModule (copy), fFlagMigrateFriendshipStatusesUserSearchModule (copy), var1 (copy), hydrateFriendStatusesModule (copy)
		if not fFlagUserSearchPresenceStoreMigrationModule then
			var4(networkingPresenceModule.GetPresencesFromUserIds.API(var6))
		end
		if fFlagSduiUserSearchTile then
			local var7 = if fFlagPlayerSearchEnableOnlineFrequentsForAll then "profile_info_boost" else nil
			local t = {
				rankingStrategy = var7,
				count = if fFlagUserSearchClassmatesInsight and var7 then 3 else nil
			}
			
			for i, v in var6 do
				var2.GetIsFollowing(v)
				var3.GetProfileInsight(v, t)
			end
		else
			var4(hydrateFollowingStatusesModule(var6))
		end
		if not fFlagMigrateFriendshipStatusesUserSearchModule and not fFlagSduiUserSearchTile then
			var4(hydrateFriendStatusesModule(var6))
			
			return
		end
		for i, v in var6 do
			var1.GetFriendshipStatus(v)
		end
	end, { var6 })
	
	return p1.renderComponent({ mappedProfilesInsights = t })
end