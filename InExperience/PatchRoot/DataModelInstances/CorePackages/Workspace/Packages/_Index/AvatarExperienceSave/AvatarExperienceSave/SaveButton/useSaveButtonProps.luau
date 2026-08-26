local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local slotBasedEditorAnalytics = require(parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local saveStatusEnumModule = require(avatarExperienceSave.Enums.SaveStatusEnum)
local useAvatarSaveContextModule = require(avatarExperienceSave.Context.useAvatarSaveContext)
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute

return function()
	-- upvalues: useAvatarRoute (ref), useAvatarSaveContextModule (ref), signalsReactModule (ref), reactModule (ref), saveStatusEnumModule (ref), slotBasedEditorAnalytics (ref)
	local var1 = useAvatarRoute()
	local var2 = useAvatarSaveContextModule()
	local trySaveAvatar = var2.trySaveAvatar
	local var3 = signalsReactModule.useSignalState(var2.getSaveEligibilityStatusSignal)
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), saveStatusEnumModule (copy), var1 (ref)
		return if var3 == saveStatusEnumModule.Eligible then var1.isOverlayVisible else true
	end, { var3, var1.isOverlayVisible })
	
	return {
		disabled = var4,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var4 (ref), trySaveAvatar (ref), slotBasedEditorAnalytics (copy)
			if not var4 and trySaveAvatar then
				trySaveAvatar()
				slotBasedEditorAnalytics.trackSaveClick()
			end
		end, { var4, trySaveAvatar })
	}
end