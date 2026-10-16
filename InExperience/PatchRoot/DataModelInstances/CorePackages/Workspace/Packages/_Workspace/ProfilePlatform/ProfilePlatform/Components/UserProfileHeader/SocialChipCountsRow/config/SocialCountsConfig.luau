local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local SocialCountEnableKeys = require(ProfilePlatform.Common.Enums).SocialCountEnableKeys
local AvatarGroupType = require(Parent.Foundation).Enums.AvatarGroupType
local FFlagEnableSocialTabsPage = require(Parent.SharedFlags).FFlagEnableSocialTabsPage

return {
	RowConfig = {
		mutualFriendsCount = {
			layoutOrder = 1,
			textKey = TextKeysModule.MutualsText,
			singleTextKey = TextKeysModule.MutualText,
			enabledKey = SocialCountEnableKeys.IsMutualFriendsCountEnabled,
			getIsDisabled = function(_, _, p1): boolean --[[ Line: 29 ]]
				return not p1
			end,
			getLeading = function(p1) --[[ Line: 35 ]]
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
			textKey = TextKeysModule.Friends,
			singleTextKey = TextKeysModule.Friend,
			enabledKey = SocialCountEnableKeys.IsFriendsCountEnabled,
			getIsDisabled = function(p1, p2, p3): boolean --[[ Line: 56 ]]
				-- upvalues: FFlagEnableSocialTabsPage (copy)
				return not p3 or not FFlagEnableSocialTabsPage and (not p2 and not p1)
			end
		},
		followersCount = {
			layoutOrder = 3,
			textKey = TextKeysModule.Followers,
			singleTextKey = TextKeysModule.Follower,
			enabledKey = SocialCountEnableKeys.IsFollowersCountEnabled,
			getIsDisabled = function(p1, _, p2): boolean --[[ Line: 75 ]]
				return not p2 or not p1
			end
		},
		followingsCount = {
			layoutOrder = 4,
			textKey = TextKeysModule.Following,
			singleTextKey = TextKeysModule.Following,
			enabledKey = SocialCountEnableKeys.IsFollowingsCountEnabled,
			getIsDisabled = function(p1, _, p2): boolean --[[ Line: 87 ]]
				return not p2 or not p1
			end
		}
	}
}