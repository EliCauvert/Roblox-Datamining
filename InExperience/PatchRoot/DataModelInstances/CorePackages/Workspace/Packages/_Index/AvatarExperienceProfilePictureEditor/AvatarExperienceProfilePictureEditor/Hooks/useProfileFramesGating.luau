local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local ComputeProfileFramesGatingModule = require(AvatarExperienceProfilePictureEditor.Utils.computeProfileFramesGating)
local GetProfileFrameAmpAccessModule = require(AvatarExperienceProfilePictureEditor.Utils.getProfileFrameAmpAccess)
local FFlagEditProfileFramesEnabled = require(Parent.SharedFlags).FFlagEditProfileFramesEnabled

return function() --[[ Line: 23 | Named "useProfileFramesGating" ]]
	-- upvalues: FFlagEditProfileFramesEnabled (copy), UseAppPolicyFunction (copy), ReactModule (copy), GetProfileFrameAmpAccessModule (copy), ComputeProfileFramesGatingModule (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1) --[[ Line: 25 ]]
		return p1.getDisableBlackbirdEntrypoints()
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 32 ]]
		-- upvalues: FFlagEditProfileFramesEnabled (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), GetProfileFrameAmpAccessModule (upval)
		if FFlagEditProfileFramesEnabled then
			UseStateResult2_1(true)
			UseStateResult2(GetProfileFrameAmpAccessModule())
			UseStateResult2_1(false)
			
			return
		else
			UseStateResult2(nil)
			UseStateResult2_1(false)
		end
	end, { FFlagEditProfileFramesEnabled })
	ReactModule.useEffect(function() --[[ Line: 44 ]]
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	local Access = if UseStateResult then UseStateResult.access else nil
	local ProfileFramesGatingModule = ComputeProfileFramesGatingModule(FFlagEditProfileFramesEnabled, UseAppPolicyResult, if Access then Access.granted else false, if Access then Access.canUpsell else false, if UseStateResult then UseStateResult.hasError else false)
	
	return {
		shouldShowFrames = ProfileFramesGatingModule.shouldShowFrames,
		shouldShowUpsell = ProfileFramesGatingModule.shouldShowUpsell,
		canEquipFrame = ProfileFramesGatingModule.canEquipFrame,
		ampAccessError = ProfileFramesGatingModule.ampAccessError,
		plusPurchasingBlocked = UseAppPolicyResult,
		ampAccess = Access,
		isAmpLoading = UseStateResult1,
		refetchAmpAccess = UseResult
	}
end