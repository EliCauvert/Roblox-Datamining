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
local fFlagEnablePressingCommunityOwnerInPeekViewModule = require(profilePlatform.Flags.FFlagEnablePressingCommunityOwnerInPeekView)
local communityProfileHeaderModule = require(profilePlatform.Components.CommunityProfileHeader.CommunityProfileHeader)

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), verifiedBadgesModule (ref), getDeepValueModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), fFlagEnablePressingCommunityOwnerInPeekViewModule (ref), reactModule (ref), communityProfileHeaderModule (ref)
	local var1 = useProfileJsonComponentModule(enumsModule.Components.CommunityProfileHeader)
	
	return reactModule.createElement(communityProfileHeaderModule, {
		layoutOrder = p1.layoutOrder,
		name = if var1.isVerified then `{var1.name}{verifiedBadgesModule.emoji.verified}` else var1.name,
		ownerName = if var1.ownerIsVerified then `{var1.ownerName}{verifiedBadgesModule.emoji.verified}` else var1.ownerName,
		membersCount = getDeepValueModule(var1, "counts.membersCount") or 0,
		hasSocialModules = var1.hasSocialModules,
		thumbnail = getRbxthumbWithTypeSizeAndOptions(useProfileWrapperContextModule().profileId, constants.RbxthumbTypes.GroupIcon, 150),
		ownerUserId = if fFlagEnablePressingCommunityOwnerInPeekViewModule then if fFlagEnablePressingCommunityOwnerInPeekViewModule then var1.ownerUserId else nil else nil
	})
end