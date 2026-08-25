local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local foundationModule = require(parent.Foundation)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local socialCountEnableKeys = require(profilePlatform.Common.Enums).SocialCountEnableKeys
local avatarGroupType = foundationModule.Enums.AvatarGroupType
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagEnableSocialTabsPage = require(parent.SharedFlags).FFlagEnableSocialTabsPage

return {
	RowConfig = {
		mutualFriendsCount = {
			layoutOrder = 1,
			textKey = textKeysModule.MutualsText,
			singleTextKey = textKeysModule.MutualText,
			enabledKey = socialCountEnableKeys.IsMutualFriendsCountEnabled,
			getIsDisabled = function(_, _, p0)
				return p0
			end,
			getLeading = function(p1)
				-- upvalues: avatarGroupType (ref)
				local list = {
					table.unpack(p1.mutualFriendIds, 1, math.min(2, #p1.mutualFriendIds))
				}
				
				return if list and #list > 0 then {
					type = "AvatarGroup",
					props = { max = 2, avatars = list, type = avatarGroupType.Stacked }
				} else nil
			end
		},
		friendsCount = {
			layoutOrder = 2,
			textKey = if fFlagConnectionsToFriendsRename then textKeysModule.Friends else textKeysModule.Connections,
			singleTextKey = if fFlagConnectionsToFriendsRename then textKeysModule.Friend else textKeysModule.Connection,
			enabledKey = socialCountEnableKeys.IsFriendsCountEnabled,
			getIsDisabled = function(p2, p3, p4)
				-- upvalues: fFlagEnableSocialTabsPage (ref)
				return if p4 then if fFlagEnableSocialTabsPage then false elseif p3 then false else not p2 else true
			end
		},
		followersCount = {
			layoutOrder = 3,
			textKey = textKeysModule.Followers,
			singleTextKey = textKeysModule.Follower,
			enabledKey = socialCountEnableKeys.IsFollowersCountEnabled,
			getIsDisabled = function(p5, _, p6)
				return if p6 then not p5 else true
			end
		},
		followingsCount = {
			layoutOrder = 4,
			textKey = textKeysModule.Following,
			singleTextKey = textKeysModule.Following,
			enabledKey = socialCountEnableKeys.IsFollowingsCountEnabled,
			getIsDisabled = function(p7, _, p8)
				return if p8 then not p7 else true
			end
		}
	}
}