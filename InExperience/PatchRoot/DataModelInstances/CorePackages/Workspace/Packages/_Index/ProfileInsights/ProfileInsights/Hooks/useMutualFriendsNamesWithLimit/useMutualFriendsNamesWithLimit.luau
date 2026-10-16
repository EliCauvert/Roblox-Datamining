local Parent = script:FindFirstAncestor("ProfileInsights").Parent
local Array = require(Parent.LuauPolyfill).Array
local ApolloProfileInsightsModule = require(Parent.ApolloProfileInsights)
local UseProfileInsightsByUserIdsFunction = ApolloProfileInsightsModule.Hooks.useProfileInsightsByUserIds
local GetMutualFriendsByUserIdFromDataFunction = ApolloProfileInsightsModule.Selectors.getMutualFriendsByUserIdFromData
local UserProfilesModule = require(Parent.UserProfiles)

local function _(p1, p2: number) --[[ Line: 18 | Named "getUserIdsWithLimit" ]]
	-- upvalues: Array (copy)
	return Array.map(Array.slice(p1, 1, p2 + 1), function(p3) --[[ Line: 21 ]]
		return p3.id
	end)
end

local _ = function(p1, p2) --[[ Line: 26 | Named "getUsersNamesFromData" ]]
	-- upvalues: Array (copy), UserProfilesModule (copy)
	return if p1 then Array.map(p2, function(p3) --[[ Line: 28 ]]
		-- upvalues: UserProfilesModule (upval), p1 (copy)
		return UserProfilesModule.Selectors.getCombinedNameFromId(p1, p3)
	end) else nil
end

return function(p1) --[[ Line: 34 | Named "useMutualFriendsNamesWithLimit" ]]
	-- upvalues: UseProfileInsightsByUserIdsFunction (copy), GetMutualFriendsByUserIdFromDataFunction (copy), Array (copy), UserProfilesModule (copy)
	local UseProfileInsightsByUserIdsResult = UseProfileInsightsByUserIdsFunction({ userIds = { p1.userId } })
	local MapResult = Array.map(Array.slice(GetMutualFriendsByUserIdFromDataFunction(UseProfileInsightsByUserIdsResult.data, p1.userId), 1, p1.limit + 1), function(p2) --[[ Line: 21 ]]
		return p2.id
	end)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = MapResult,
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local Data = UseUserProfilesFetchResult.data
	
	return if Data then Array.map(MapResult, function(p2) --[[ Line: 28 ]]
		-- upvalues: UserProfilesModule (upval), Data (copy)
		return UserProfilesModule.Selectors.getCombinedNameFromId(Data, p2)
	end) else nil, UseProfileInsightsByUserIdsResult.loading or UseUserProfilesFetchResult.loading
end