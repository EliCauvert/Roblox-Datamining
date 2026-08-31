local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local computeProfileFramesGatingModule = require(avatarExperienceProfilePictureEditor.Utils.computeProfileFramesGating)
local getProfileFrameAmpAccessModule = require(avatarExperienceProfilePictureEditor.Utils.getProfileFrameAmpAccess)
local fFlagEditProfileFramesEnabled = sharedFlagsModule.FFlagEditProfileFramesEnabled

return function()
	-- upvalues: fFlagEditProfileFramesEnabled (ref), useAppPolicy (ref), reactModule (ref), getProfileFrameAmpAccessModule (ref), computeProfileFramesGatingModule (ref)
	local var1 = useAppPolicy(function(p1)
		return p1.getDisableBlackbirdEntrypoints()
	end)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useCallback(function()
		-- upvalues: fFlagEditProfileFramesEnabled (ref), var3 (ref), var5 (ref), getProfileFrameAmpAccessModule (copy)
		if fFlagEditProfileFramesEnabled then
			var5(true)
			var3(getProfileFrameAmpAccessModule())
			var5(false)
			
			return
		end
		var3(nil)
		var5(false)
	end, { fFlagEditProfileFramesEnabled })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		var6()
	end, { var6 })
	local var7 = if var2 then var2.access else nil
	local var8 = computeProfileFramesGatingModule(fFlagEditProfileFramesEnabled, var1, if var7 then var7.granted else false, if var7 then var7.canUpsell else false, if var2 then var2.hasError else false)
	
	return {
		shouldShowFrames = var8.shouldShowFrames,
		shouldShowUpsell = var8.shouldShowUpsell,
		canEquipFrame = var8.canEquipFrame,
		ampAccessError = var8.ampAccessError,
		plusPurchasingBlocked = var1,
		ampAccess = var7,
		isAmpLoading = var4,
		refetchAmpAccess = var6
	}
end