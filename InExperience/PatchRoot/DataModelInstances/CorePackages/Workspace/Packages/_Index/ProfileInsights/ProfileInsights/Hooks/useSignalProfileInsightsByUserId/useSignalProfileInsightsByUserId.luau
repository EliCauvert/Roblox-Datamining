local profileInsights = script:FindFirstAncestor("ProfileInsights")
local parent = profileInsights.Parent
local profileInsightsStoreModule = require(profileInsights["data-hydration"].ProfileInsightsStore)
local signalsReactModule = require(parent.SignalsReact)
local reactModule = require(parent.React)
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local fFlagTFProfileInsightsBypassCache = require(parent.SharedFlags).FFlagTFProfileInsightsBypassCache

return function(value)
	-- upvalues: fFlagTFProfileInsightsBypassCache (ref), reactModule (ref), profileInsightsStoreModule (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), signalsReactModule (ref)
	local var1 = if fFlagTFProfileInsightsBypassCache then reactModule.useMemo(function()
		-- upvalues: profileInsightsStoreModule (copy), value (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy)
		return profileInsightsStoreModule(false).getProfileInsightsByUserId({
			userIds = { value.userId },
			rankingStrategy = value.rankingStrategy,
			skipFetch = if fFlagAddFriendsPageTrustedFriendRequestSection then value.skipFetch else nil,
			forceFetch = value.forceFetch
		})
	end, {
		value.userId,
		value.rankingStrategy,
		value.skipFetch,
		value.forceFetch
	}) else profileInsightsStoreModule(false).getProfileInsightsByUserId({
		userIds = { value.userId },
		rankingStrategy = value.rankingStrategy,
		skipFetch = if fFlagAddFriendsPageTrustedFriendRequestSection then value.skipFetch else nil
	})
	local var2 = signalsReactModule.useSignalState(var1(false).data.getProfileInsights)
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), value (ref)
		for i, v in var2 do
			if v.targetUserId == value.userId then
				return v
			end
		end
		return {}
	end, { var2 }), var1(false).status == "fetching"
end