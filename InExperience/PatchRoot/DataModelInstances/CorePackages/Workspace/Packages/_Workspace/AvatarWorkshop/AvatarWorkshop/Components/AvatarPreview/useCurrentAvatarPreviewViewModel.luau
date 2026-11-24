local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local LocalizationModule = require(Parent.Localization)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.CurrentAvatarPreviewView)
local GetAvatarStateStoreModule = require(AvatarWorkshop.Stores.Getters.getAvatarStateStore)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseSignalStateFunction = SignalsReactModule.useSignalState

return function()
	-- upvalues: UseSignalStateFunction (copy), GetAvatarStateStoreModule (copy), UseLocalizationFunction (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetAvatarStateStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(UseSignalStateResult.getAvatarState)
	local UseSignalStateResult2 = UseSignalStateFunction(UseSignalStateResult.getLoadCurrentAvatarFailed)
	local UseLocalizationResult = UseLocalizationFunction({
		loadAvatarError = "Feature.Avatar.Message.FailedToLoadAvatar",
		tryAgain = "Feature.AvatarWorkshop.Action.TryAgain"
	})
	
	return {
		avatarState = UseSignalStateResult1,
		loadFailed = UseSignalStateResult2,
		loadErrorText = UseLocalizationResult.loadAvatarError,
		tryAgainText = UseLocalizationResult.tryAgain,
		onTryAgain = UseSignalStateResult.loadCurrentAvatar
	}
end