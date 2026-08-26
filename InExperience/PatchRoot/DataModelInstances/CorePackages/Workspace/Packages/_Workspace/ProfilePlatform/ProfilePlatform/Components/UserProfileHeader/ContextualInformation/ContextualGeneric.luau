local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local playerContext = UIBloxModule.App.Indicator.PlayerContext
local textKeysModule = require(profilePlatform.Common.TextKeys)
local enumsModule = require(profilePlatform.Common.Enums)

return function(p1)
	-- upvalues: useLocalization (ref), enumsModule (ref), textKeysModule (ref), images (ref), reactModule (ref), playerContext (ref)
	local contextualType = p1.contextualType
	
	return reactModule.createElement(playerContext, {
		text = p1.textOverride or useLocalization({
			[enumsModule.ContextualTypes.AccountDeleted] = textKeysModule.AccountDeleted,
			[enumsModule.ContextualTypes.IsYourself] = textKeysModule.ThisIsYou,
			[enumsModule.ContextualTypes.PreviousUsername] = textKeysModule.Previously,
			[enumsModule.ContextualTypes.YouAreFollowing] = textKeysModule.YouAreFollowing,
			[enumsModule.ContextualTypes.FollowsYou] = textKeysModule.FollowsYou,
			[enumsModule.ContextualTypes.PlayedTogether] = textKeysModule.PlayedTogether,
			[enumsModule.ContextualTypes.OffNetworkFriendRequest] = textKeysModule.FriendInvite,
			[enumsModule.ContextualTypes.SentFromQrCode] = textKeysModule.FromQRCode,
			[enumsModule.ContextualTypes.SentFromExperience] = {
				textKeysModule.SentFromWithContext,
				gameName = p1.experienceName
			}
		})[contextualType],
		icon = p1.iconOverride or (if contextualType == enumsModule.ContextualTypes.YouAreFollowing or contextualType == enumsModule.ContextualTypes.FollowsYou then images["icons/status/player/following"] else nil)
	})
end