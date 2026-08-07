local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getMutualFriendsTextModule = require(socialCommon.Utils.getMutualFriendsText)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename

return function(p0) --[[ line: 14 ]]
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), getMutualFriendsTextModule (ref)
	return getMutualFriendsTextModule({
		mutualFriendsCount = p0,
		localized = useLocalization({
			singularMutualConnection = if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendTitle" else "Feature.Friends.Label.MutualConnection",
			mutualConnections = {
				if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendsTitle" else "Feature.Friends.Label.MutualConnections",
				numConnections = p0
			}
		})
	})
end