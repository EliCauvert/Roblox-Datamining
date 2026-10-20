local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local SocialCountEnableKeys = require(ProfilePlatform.Common.Enums).SocialCountEnableKeys
local AvatarGroupType = require(Parent.Foundation).Enums.AvatarGroupType
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagEnableSocialTabsPage = require(Parent.SharedFlags).FFlagEnableSocialTabsPage

return {
	RowConfig = {
		mutualFriendsCount = {
			layoutOrder = 1,
			textKey = TextKeysModule.MutualsText,
			singleTextKey = TextKeysModule.MutualText,
			enabledKey = SocialCountEnableKeys.IsMutualFriendsCountEnabled,
			getIsDisabled = function(_, _, p1): boolean
				return not p1
			end,
			getLeading = function(p1)
				-- upvalues: AvatarGroupType (copy)
				local Avatars = {
					table.unpack(p1.mutualFriendIds, 1, (math.min(2, #p1.mutualFriendIds)))
				}
				
				return if Avatars and #Avatars > 0 then {
					type = "AvatarGroup",
					props = {
						max = 2,
						avatars = Avatars,
						type = AvatarGroupType.Stacked
					}
				} else nil
			end
		},
		friendsCount = {
			layoutOrder = 2,
			textKey = if FFlagConnectionsToFriendsRename then TextKeysModule.Friends else TextKeysModule.Connections,
			singleTextKey = if FFlagConnectionsToFriendsRename then TextKeysModule.Friend else TextKeysModule.Connection,
			enabledKey = SocialCountEnableKeys.IsFriendsCountEnabled,
			getIsDisabled = function(p1, p2, p3): boolean
				-- upvalues: FFlagEnableSocialTabsPage (copy)
				return not p3 or not FFlagEnableSocialTabsPage and (not p2 and not p1)
			end
		},
		followersCount = {
			layoutOrder = 3,
			textKey = TextKeysModule.Followers,
			singleTextKey = TextKeysModule.Follower,
			enabledKey = SocialCountEnableKeys.IsFollowersCountEnabled,
			getIsDisabled = function(p1, _, p2): boolean
				return not p2 or not p1
			end
		},
		followingsCount = {
			layoutOrder = 4,
			textKey = TextKeysModule.Following,
			singleTextKey = TextKeysModule.Following,
			enabledKey = SocialCountEnableKeys.IsFollowingsCountEnabled,
			getIsDisabled = function(p1, _, p2): boolean
				return not p2 or not p1
			end
		}
	}
}