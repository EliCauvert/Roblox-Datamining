local profileInsights = script:FindFirstAncestor("ProfileInsights")
local parent = profileInsights.Parent
local profileInsightsStoreModule = require(profileInsights["data-hydration"].ProfileInsightsStore)
local signalsReactModule = require(parent.SignalsReact)
local reactModule = require(parent.React)
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection

return function(value) --[[ line: 18 | named "useSignalProfileInsightsByUserId" ]]
	-- upvalues: profileInsightsStoreModule (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), signalsReactModule (ref), reactModule (ref)
	local profileInsightsByUserId = profileInsightsStoreModule(false).getProfileInsightsByUserId({
		userIds = { value.userId },
		rankingStrategy = value.rankingStrategy,
		skipFetch = if fFlagAddFriendsPageTrustedFriendRequestSection then value.skipFetch else nil
	})
	local var5 = signalsReactModule.useSignalState(profileInsightsByUserId(false).data.getProfileInsights)
	
	return reactModule.useMemo(function() --[[ line: 26 ]]
		-- upvalues: var5 (ref), value (ref)
		for i, v in var5 do
			if v.targetUserId == value.userId then
				return v
			end
		end
		return {}
	end, { var5 }), profileInsightsByUserId(false).status == "fetching"
end