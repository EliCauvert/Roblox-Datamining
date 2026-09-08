local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local ampApiProvider = require(parent.AmpUpsell).AmpApiProvider
local accessResponseEnum = require(parent.AmpUpsell).AmpEnums.AccessResponseEnum
local profileFrameAmpConstantsModule = require(avatarExperienceProfilePictureEditor.Common.ProfileFrameAmpConstants)

return function()
	-- upvalues: ampApiProvider (ref), profileFrameAmpConstantsModule (ref), accessResponseEnum (ref)
	local access = ampApiProvider.upsellFeatureAccess(profileFrameAmpConstantsModule.FEATURE_NAME, {}, profileFrameAmpConstantsModule.NAME_SPACE).access
	
	return if access == accessResponseEnum.Error then {
		hasError = true,
		access = { granted = false, canUpsell = false }
	} elseif access == accessResponseEnum.Pending then {
		hasError = false,
		access = { granted = false, canUpsell = false }
	} else {
		hasError = false,
		access = {
			granted = access == accessResponseEnum.Granted,
			canUpsell = access == accessResponseEnum.Actionable
		}
	}
end