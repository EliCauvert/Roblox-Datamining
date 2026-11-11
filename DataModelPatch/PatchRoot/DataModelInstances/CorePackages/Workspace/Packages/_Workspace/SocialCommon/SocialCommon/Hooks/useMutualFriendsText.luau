local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetMutualFriendsTextModule = require(SocialCommon.Utils.getMutualFriendsText)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename

return function(MutualFriendsCount)
	-- upvalues: UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), GetMutualFriendsTextModule (copy)
	return GetMutualFriendsTextModule({
		mutualFriendsCount = MutualFriendsCount,
		localized = UseLocalizationFunction({
			singularMutualConnection = if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendTitle" else "Feature.Friends.Label.MutualConnection",
			mutualConnections = {
				if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendsTitle" else "Feature.Friends.Label.MutualConnections",
				numConnections = MutualFriendsCount
			}
		})
	})
end