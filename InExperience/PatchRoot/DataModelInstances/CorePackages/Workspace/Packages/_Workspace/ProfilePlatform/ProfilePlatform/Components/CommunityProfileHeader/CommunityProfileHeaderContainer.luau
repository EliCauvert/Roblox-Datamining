local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagEnablePressingCommunityOwnerInPeekViewModule = require(ProfilePlatform.Flags.FFlagEnablePressingCommunityOwnerInPeekView)
local CommunityProfileHeaderModule = require(ProfilePlatform.Components.CommunityProfileHeader.CommunityProfileHeader)

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), VerifiedBadgesModule (copy), GetDeepValueModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), FFlagEnablePressingCommunityOwnerInPeekViewModule (copy), ReactModule (copy), CommunityProfileHeaderModule (copy)
	local ProfileId = UseProfileWrapperContextModule().profileId
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.CommunityProfileHeader)
	local OwnerUserId = if FFlagEnablePressingCommunityOwnerInPeekViewModule then UseProfileJsonComponentModuleResult.ownerUserId else nil
	
	return ReactModule.createElement(CommunityProfileHeaderModule, {
		layoutOrder = p1.layoutOrder,
		name = if UseProfileJsonComponentModuleResult.isVerified then `{UseProfileJsonComponentModuleResult.name}{VerifiedBadgesModule.emoji.verified}` else UseProfileJsonComponentModuleResult.name,
		ownerName = if UseProfileJsonComponentModuleResult.ownerIsVerified then `{UseProfileJsonComponentModuleResult.ownerName}{VerifiedBadgesModule.emoji.verified}` else UseProfileJsonComponentModuleResult.ownerName,
		membersCount = GetDeepValueModule(UseProfileJsonComponentModuleResult, "counts.membersCount") or 0,
		hasSocialModules = UseProfileJsonComponentModuleResult.hasSocialModules,
		thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(ProfileId, Constants.RbxthumbTypes.GroupIcon, 150),
		ownerUserId = if FFlagEnablePressingCommunityOwnerInPeekViewModule then OwnerUserId else nil
	})
end