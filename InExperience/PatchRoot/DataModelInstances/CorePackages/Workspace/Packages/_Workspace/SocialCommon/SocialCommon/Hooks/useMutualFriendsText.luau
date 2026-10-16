local SocialCommon = script:FindFirstAncestor("SocialCommon")
local UseLocalizationFunction = require(SocialCommon.Parent.Localization).Hooks.useLocalization
local GetMutualFriendsTextModule = require(SocialCommon.Utils.getMutualFriendsText)

return function(MutualFriendsCount) --[[ Line: 12 ]]
	-- upvalues: UseLocalizationFunction (copy), GetMutualFriendsTextModule (copy)
	return GetMutualFriendsTextModule({
		mutualFriendsCount = MutualFriendsCount,
		localized = UseLocalizationFunction({
			singularMutualConnection = "Feature.Friends.Label.MutualFriendTitle",
			mutualConnections = {
				"Feature.Friends.Label.MutualFriendsTitle",
				numConnections = MutualFriendsCount
			}
		})
	})
end