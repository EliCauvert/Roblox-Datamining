local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local computeProfileFramesGatingModule = require(avatarExperienceProfilePictureEditor.Utils.computeProfileFramesGating)
local getProfileFrameAmpAccessModule = require(avatarExperienceProfilePictureEditor.Utils.getProfileFrameAmpAccess)
local fFlagEditProfileFramesEnabled = sharedFlagsModule.FFlagEditProfileFramesEnabled

return function() --[[ line: 23 | named "useProfileFramesGating" ]]
	-- upvalues: fFlagEditProfileFramesEnabled (ref), useAppPolicy (ref), reactModule (ref), getProfileFrameAmpAccessModule (ref), computeProfileFramesGatingModule (ref)
	local var5 = useAppPolicy(function(p0) --[[ line: 25 ]]
		return p0.getDisableBlackbirdEntrypoints()
	end)
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useCallback(function() --[[ line: 32 ]]
		-- upvalues: fFlagEditProfileFramesEnabled (ref), var7 (ref), var9 (ref), getProfileFrameAmpAccessModule (copy)
		if fFlagEditProfileFramesEnabled then
			var9(true)
			var7(getProfileFrameAmpAccessModule())
			var9(false)
			
			return
		end
		var7(nil)
		var9(false)
	end, { fFlagEditProfileFramesEnabled })
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: var10 (ref)
		var10()
	end, { var10 })
	local var11 = if var6 then var6.access else nil
	local var12 = computeProfileFramesGatingModule(fFlagEditProfileFramesEnabled, var5, if var11 then var11.granted else false, if var11 then var11.canUpsell else false, if var6 then var6.hasError else false)
	
	return {
		shouldShowFrames = var12.shouldShowFrames,
		shouldShowUpsell = var12.shouldShowUpsell,
		canEquipFrame = var12.canEquipFrame,
		ampAccessError = var12.ampAccessError,
		plusPurchasingBlocked = var5,
		ampAccess = var11,
		isAmpLoading = var8,
		refetchAmpAccess = var10
	}
end