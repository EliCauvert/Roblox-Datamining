local parent = script:FindFirstAncestor("ProfileInsights").Parent
local array = require(parent.LuauPolyfill).Array
local apolloProfileInsightsModule = require(parent.ApolloProfileInsights)
local useProfileInsightsByUserIds = apolloProfileInsightsModule.Hooks.useProfileInsightsByUserIds
local getMutualFriendsByUserIdFromData = apolloProfileInsightsModule.Selectors.getMutualFriendsByUserIdFromData
local userProfilesModule = require(parent.UserProfiles)

local function _(p0, p1) --[[ line: 18 | named "getUserIdsWithLimit" ]]
	-- upvalues: array (ref)
	return array.map(array.slice(p0, 1, p1 + 1), function(p2) --[[ line: 21 ]]
		return p2.id
	end)
end

local _ = function(p3, p4) --[[ line: 26 | named "getUsersNamesFromData" ]]
	-- upvalues: array (ref), userProfilesModule (ref)
	return if p3 then array.map(p4, function(p5) --[[ line: 28 ]]
		-- upvalues: userProfilesModule (copy), p3 (ref)
		return userProfilesModule.Selectors.getCombinedNameFromId(p3, p5)
	end) else nil
end

return function(p6) --[[ line: 34 | named "useMutualFriendsNamesWithLimit" ]]
	-- upvalues: useProfileInsightsByUserIds (ref), getMutualFriendsByUserIdFromData (ref), array (ref), userProfilesModule (ref)
	local var2 = useProfileInsightsByUserIds({ userIds = { p6.userId } })
	local var3 = array.map(array.slice(getMutualFriendsByUserIdFromData(var2.data, p6.userId), 1, p6.limit + 1), function(p7) --[[ line: 21 ]]
		return p7.id
	end)
	local var4 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = var3,
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local data = var4.data
	
	return if data then array.map(var3, function(p8) --[[ line: 28 ]]
		-- upvalues: userProfilesModule (copy), data (ref)
		return userProfilesModule.Selectors.getCombinedNameFromId(data, p8)
	end) else nil, var2.loading or var4.loading
end