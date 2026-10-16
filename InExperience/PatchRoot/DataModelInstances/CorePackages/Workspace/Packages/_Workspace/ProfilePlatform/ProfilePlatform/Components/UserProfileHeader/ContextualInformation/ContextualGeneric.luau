local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local PlayerContext = UIBloxModule.App.Indicator.PlayerContext
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EnumsModule = require(ProfilePlatform.Common.Enums)

return function(p1) --[[ Line: 21 | Named "ContextualInformation" ]]
	-- upvalues: UseLocalizationFunction (copy), EnumsModule (copy), TextKeysModule (copy), Images (copy), ReactModule (copy), PlayerContext (copy)
	local ContextualType = p1.contextualType
	local UseLocalizationResultEntry = UseLocalizationFunction({
		[EnumsModule.ContextualTypes.AccountDeleted] = TextKeysModule.AccountDeleted,
		[EnumsModule.ContextualTypes.IsYourself] = TextKeysModule.ThisIsYou,
		[EnumsModule.ContextualTypes.PreviousUsername] = TextKeysModule.Previously,
		[EnumsModule.ContextualTypes.YouAreFollowing] = TextKeysModule.YouAreFollowing,
		[EnumsModule.ContextualTypes.FollowsYou] = TextKeysModule.FollowsYou,
		[EnumsModule.ContextualTypes.PlayedTogether] = TextKeysModule.PlayedTogether,
		[EnumsModule.ContextualTypes.OffNetworkFriendRequest] = TextKeysModule.FriendInvite,
		[EnumsModule.ContextualTypes.SentFromQrCode] = TextKeysModule.FromQRCode,
		[EnumsModule.ContextualTypes.SentFromExperience] = {
			TextKeysModule.SentFromWithContext,
			gameName = p1.experienceName
		}
	})[ContextualType]
	local IconsStatusPlayerFollowing = if ContextualType == EnumsModule.ContextualTypes.YouAreFollowing or ContextualType == EnumsModule.ContextualTypes.FollowsYou then Images["icons/status/player/following"] else nil
	
	return ReactModule.createElement(PlayerContext, {
		text = p1.textOverride or UseLocalizationResultEntry,
		icon = p1.iconOverride or IconsStatusPlayerFollowing
	})
end