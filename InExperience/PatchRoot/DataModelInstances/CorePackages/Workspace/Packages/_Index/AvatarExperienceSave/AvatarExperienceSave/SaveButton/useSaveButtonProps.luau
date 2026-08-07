local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local slotBasedEditorAnalytics = require(parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local saveStatusEnumModule = require(avatarExperienceSave.Enums.SaveStatusEnum)
local useAvatarSaveContextModule = require(avatarExperienceSave.Context.useAvatarSaveContext)
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute

return function() --[[ line: 22 | named "useSaveButtonProps" ]]
	-- upvalues: useAvatarRoute (ref), useAvatarSaveContextModule (ref), signalsReactModule (ref), reactModule (ref), saveStatusEnumModule (ref), slotBasedEditorAnalytics (ref)
	local var6 = useAvatarRoute()
	local var7 = useAvatarSaveContextModule()
	local trySaveAvatar = var7.trySaveAvatar
	local var8 = signalsReactModule.useSignalState(var7.getSaveEligibilityStatusSignal)
	local var9 = reactModule.useMemo(function() --[[ line: 31 ]]
		-- upvalues: var8 (ref), saveStatusEnumModule (copy), var6 (ref)
		return if var8 == saveStatusEnumModule.Eligible then var6.isOverlayVisible else true
	end, { var8, var6.isOverlayVisible })
	
	return {
		disabled = var9,
		onActivated = reactModule.useCallback(function() --[[ line: 35 ]]
			-- upvalues: var9 (ref), trySaveAvatar (ref), slotBasedEditorAnalytics (copy)
			if not var9 and trySaveAvatar then
				trySaveAvatar()
				slotBasedEditorAnalytics.trackSaveClick()
			end
		end, { var9, trySaveAvatar })
	}
end