local parent = script:FindFirstAncestor("ProfileInsights").Parent
local array = require(parent.LuauPolyfill).Array
local apolloProfileInsightsModule = require(parent.ApolloProfileInsights)
local useProfileInsightsByUserIds = apolloProfileInsightsModule.Hooks.useProfileInsightsByUserIds
local getMutualFriendsByUserIdFromData = apolloProfileInsightsModule.Selectors.getMutualFriendsByUserIdFromData
local userProfilesModule = require(parent.UserProfiles)

local function _(p1, p2)
	-- upvalues: array (ref)
	return array.map(array.slice(p1, 1, p2 + 1), function(p3)
		return p3.id
	end)
end

local _ = function(p1, p2)
	-- upvalues: array (ref), userProfilesModule (ref)
	return if p1 then array.map(p2, function(p3)
		-- upvalues: userProfilesModule (copy), p1 (ref)
		return userProfilesModule.Selectors.getCombinedNameFromId(p1, p3)
	end) else nil
end

return function(p1)
	-- upvalues: useProfileInsightsByUserIds (ref), getMutualFriendsByUserIdFromData (ref), array (ref), userProfilesModule (ref)
	local var1 = useProfileInsightsByUserIds({ userIds = { p1.userId } })
	local var2 = array.map(array.slice(getMutualFriendsByUserIdFromData(var1.data, p1.userId), 1, p1.limit + 1), function(p2)
		return p2.id
	end)
	local var3 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = var2,
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local data = var3.data
	
	return if data then array.map(var2, function(p2)
		-- upvalues: userProfilesModule (copy), data (ref)
		return userProfilesModule.Selectors.getCombinedNameFromId(data, p2)
	end) else nil, var1.loading or var3.loading
end