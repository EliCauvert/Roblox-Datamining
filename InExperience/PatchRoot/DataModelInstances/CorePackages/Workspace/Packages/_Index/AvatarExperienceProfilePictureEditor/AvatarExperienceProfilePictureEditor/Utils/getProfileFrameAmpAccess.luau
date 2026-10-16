local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local ProfileFrameAmpConstantsModule = require(AvatarExperienceProfilePictureEditor.Common.ProfileFrameAmpConstants)

return function() --[[ Line: 26 | Named "getProfileFrameAmpAccess" ]]
	-- upvalues: AmpApiProvider (copy), ProfileFrameAmpConstantsModule (copy), AccessResponseEnum (copy)
	local Access = AmpApiProvider.upsellFeatureAccess(ProfileFrameAmpConstantsModule.FEATURE_NAME, {}, ProfileFrameAmpConstantsModule.NAME_SPACE).access
	
	return if Access == AccessResponseEnum.Error then {
		hasError = true,
		access = { granted = false, canUpsell = false }
	} elseif Access == AccessResponseEnum.Pending then {
		hasError = false,
		access = { granted = false, canUpsell = false }
	} else {
		hasError = false,
		access = {
			granted = Access == AccessResponseEnum.Granted,
			canUpsell = Access == AccessResponseEnum.Actionable
		}
	}
end