local ProfileInsights = script:FindFirstAncestor("ProfileInsights")
local Parent = ProfileInsights.Parent
local ProfileInsightsStoreModule = require(ProfileInsights["data-hydration"].ProfileInsightsStore)
local SignalsReactModule = require(Parent.SignalsReact)
local ReactModule = require(Parent.React)
local FFlagAddFriendsPageTrustedFriendRequestSection = require(Parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection

return function(p1)
	-- upvalues: ReactModule (copy), ProfileInsightsStoreModule (copy), FFlagAddFriendsPageTrustedFriendRequestSection (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ProfileInsightsStoreModule (upval), p1 (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval)
		return ProfileInsightsStoreModule(false).getProfileInsightsByUserId({
			userIds = { p1.userId },
			rankingStrategy = p1.rankingStrategy,
			skipFetch = if FFlagAddFriendsPageTrustedFriendRequestSection then p1.skipFetch else nil,
			forceFetch = p1.forceFetch
		})
	end, {
		p1.userId,
		p1.rankingStrategy,
		p1.skipFetch,
		p1.forceFetch
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult(false).data.getProfileInsights)
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), p1 (copy)
		for _, value in UseSignalStateResult do
			if value.targetUserId == p1.userId then
				return value
			end
		end
		return {}
	end, { UseSignalStateResult }), UseMemoResult(false).status == "fetching"
end