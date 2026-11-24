local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local _ = require(AvatarWorkshop.Stores.Creators.createOutfitSaverStore)
local _ = require(AvatarWorkshop.Stores.Creators.createSaveAvatarFlowStore)
local GetSaveAvatarFlowStoreModule = require(AvatarWorkshop.Stores.Getters.getSaveAvatarFlowStore)
local UseCanUseCustomOutfitNamesModule = require(AvatarWorkshop.Hooks.useCanUseCustomOutfitNames)
local UseDismissToastModule = require(AvatarWorkshop.Hooks.useDismissToast)
local UseShowToastModule = require(AvatarWorkshop.Hooks.useShowToast)
local SaveAvatarFlowStepEnumModule = require(AvatarWorkshop.Enums.SaveAvatarFlowStepEnum)
local _ = require(script.Parent.SaveAvatarFlowView)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local config = {
	OutfitLimitReached = "Feature.Avatar.Message.ReachedMaxOutfits",
	InvalidName = "Feature.Avatar.Message.InvalidName",
	PermissionDenied = "Feature.Avatar.Message.UnknownErrorCreatingOutfit",
	SaveInProgress = "Feature.Avatar.Message.UnknownErrorCreatingOutfit",
	Other = "Feature.Avatar.Message.UnknownErrorCreatingOutfit"
}

return function()
	-- upvalues: UseSignalStateFunction (copy), GetSaveAvatarFlowStoreModule (copy), UseCanUseCustomOutfitNamesModule (copy), ReactModule (copy), UseLocalizationFunction (copy), config (copy), UseShowToastModule (copy), UseDismissToastModule (copy), SaveAvatarFlowStepEnumModule (copy), ButtonVariant (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetSaveAvatarFlowStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(UseSignalStateResult.getStep)
	local UseSignalStateResult2 = UseSignalStateFunction(UseSignalStateResult.getDuplicateOutfitName)
	local UseSignalStateResult3 = UseSignalStateFunction(UseSignalStateResult.getDefaultName)
	local UseSignalStateResult4 = UseSignalStateFunction(UseSignalStateResult.getSaveFailure)
	local UseSignalStateResult5 = UseSignalStateFunction(UseSignalStateResult.getCanRetry)
	local UseCanUseCustomOutfitNamesModuleResult = UseCanUseCustomOutfitNamesModule()
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy)
		return UseSignalStateResult.cancel
	end, { UseSignalStateResult })
	local UseLocalizationResult = UseLocalizationFunction({
		tryAgain = "Feature.AvatarWorkshop.Action.TryAgain",
		message = if UseSignalStateResult4 then config[UseSignalStateResult4] else "Feature.Avatar.Message.UnknownErrorCreatingOutfit"
	})
	local UseShowToastModuleResult = UseShowToastModule()
	local UseDismissToastModuleResult = UseDismissToastModule()
	local Retry = if UseSignalStateResult5 then UseSignalStateResult.retry else nil
	local Cancel = UseSignalStateResult.cancel
	local DismissFailure = UseSignalStateResult.dismissFailure
	local Message = if UseSignalStateResult1 == SaveAvatarFlowStepEnumModule.SaveFailed and UseSignalStateResult4 then UseLocalizationResult.message else nil
	local TryAgain = UseLocalizationResult.tryAgain
	ReactModule.useEffect(function()
		-- upvalues: Message (copy), Retry (copy), TryAgain (copy), ButtonVariant (upval), UseShowToastModuleResult (copy), DismissFailure (copy), UseDismissToastModuleResult (copy)
		if Message == nil then
			return function() end
		else
			local UseShowToastModuleResultResult = UseShowToastModuleResult({
				testId = "avatar-workshop-save-avatar-failed-toast",
				title = Message,
				actions = if Retry then {
					{
						text = TryAgain,
						variant = ButtonVariant.Emphasis,
						onActivated = Retry
					}
				} else nil,
				onDismiss = DismissFailure
			})
			
			return function()
				-- upvalues: UseDismissToastModuleResult (upval), UseShowToastModuleResultResult (copy)
				UseDismissToastModuleResult(UseShowToastModuleResultResult)
			end
		end
	end, {
		UseShowToastModuleResult, UseDismissToastModuleResult, Message, TryAgain,
		Retry, DismissFailure
	})
	local ConfirmAvatarFunction = UseSignalStateResult.confirmAvatar
	
	return {
		step = UseSignalStateResult1,
		duplicateOutfitName = UseSignalStateResult2 or "",
		defaultName = UseSignalStateResult3,
		onConfirmDuplicate = UseSignalStateResult.confirmDuplicate,
		onConfirmAvatar = ReactModule.useCallback(function(p1)
			-- upvalues: ConfirmAvatarFunction (copy), UseCanUseCustomOutfitNamesModuleResult (copy)
			ConfirmAvatarFunction(p1, UseCanUseCustomOutfitNamesModuleResult)
		end, {
			ConfirmAvatarFunction,
			UseCanUseCustomOutfitNamesModuleResult
		}),
		onConfirmName = UseSignalStateResult.confirmName,
		onCancel = Cancel
	}
end