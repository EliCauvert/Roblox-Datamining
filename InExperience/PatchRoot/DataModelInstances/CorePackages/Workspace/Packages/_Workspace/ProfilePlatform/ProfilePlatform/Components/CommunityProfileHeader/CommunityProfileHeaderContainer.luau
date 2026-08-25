local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local verifiedBadgesModule = require(parent.VerifiedBadges)
local enumsModule = require(profilePlatform.Common.Enums)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(profilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local fFlagEnablePressingCommunityOwnerInPeekViewModule = require(profilePlatform.Flags.FFlagEnablePressingCommunityOwnerInPeekView)
local communityProfileHeaderModule = require(profilePlatform.Components.CommunityProfileHeader.CommunityProfileHeader)

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), verifiedBadgesModule (ref), getDeepValueModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), fFlagEnablePressingCommunityOwnerInPeekViewModule (ref), reactModule (ref), communityProfileHeaderModule (ref), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (ref)
	local var11 = useProfileJsonComponentModule(enumsModule.Components.CommunityProfileHeader)
	
	return reactModule.createElement(communityProfileHeaderModule, {
		layoutOrder = p0.layoutOrder,
		name = if var11.isVerified then `{var11.name}{verifiedBadgesModule.emoji.verified}` else var11.name,
		ownerName = if var11.ownerIsVerified then `{var11.ownerName}{verifiedBadgesModule.emoji.verified}` else var11.ownerName,
		membersCount = getDeepValueModule(var11, "counts.membersCount") or 0,
		hasSocialModules = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then var11.hasSocialModules else nil,
		thumbnail = getRbxthumbWithTypeSizeAndOptions(useProfileWrapperContextModule().profileId, constants.RbxthumbTypes.GroupIcon, 150),
		ownerUserId = if fFlagEnablePressingCommunityOwnerInPeekViewModule then if fFlagEnablePressingCommunityOwnerInPeekViewModule then var11.ownerUserId else nil else nil
	})
end