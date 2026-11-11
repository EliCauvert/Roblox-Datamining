local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SlotBasedEditorAnalytics = require(Parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local SaveStatusEnumModule = require(AvatarExperienceSave.Enums.SaveStatusEnum)
local UseAvatarSaveContextModule = require(AvatarExperienceSave.Context.useAvatarSaveContext)
local UseAvatarRouteFunction = require(Parent.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute

return function()
	-- upvalues: UseAvatarRouteFunction (copy), UseAvatarSaveContextModule (copy), SignalsReactModule (copy), ReactModule (copy), SaveStatusEnumModule (copy), SlotBasedEditorAnalytics (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseAvatarSaveContextModuleResult = UseAvatarSaveContextModule()
	local TrySaveAvatarFunction = UseAvatarSaveContextModuleResult.trySaveAvatar
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseAvatarSaveContextModuleResult.getSaveEligibilityStatusSignal)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), SaveStatusEnumModule (upval), UseAvatarRouteResult (copy)
		return UseSignalStateResult ~= SaveStatusEnumModule.Eligible or UseAvatarRouteResult.isOverlayVisible
	end, {
		UseSignalStateResult,
		UseAvatarRouteResult.isOverlayVisible
	})
	
	return {
		disabled = UseMemoResult,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult (copy), TrySaveAvatarFunction (copy), SlotBasedEditorAnalytics (upval)
			if not UseMemoResult and TrySaveAvatarFunction then
				TrySaveAvatarFunction()
				SlotBasedEditorAnalytics.trackSaveClick()
			end
		end, { UseMemoResult, TrySaveAvatarFunction })
	}
end