local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local ToastRoduxModule = require(AvatarExperienceProfilePictureEditor.Parent.ToastRodux)
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local config = {
	toastMessage = "Feature.Profile.Heading.ProfilePictureSaved",
	isLocalized = false,
	toastType = ToastType.SuccessConfirmation
}
local config1 = {
	isLocalized = false,
	toastMessage = require(AvatarExperienceProfilePictureEditor.Common.TextKeys).SaveFailed,
	toastType = ToastType.NetworkingError
}

return {
	showSaveSuccessToast = function(Callback: (any) -> ()) --[[ Line: 22 ]]
		-- upvalues: SetCurrentToastMessageFunction (copy), config (copy)
		Callback(SetCurrentToastMessageFunction(config))
	end,
	showSaveFailureToast = function(Callback: (any) -> ()) --[[ Line: 26 ]]
		-- upvalues: SetCurrentToastMessageFunction (copy), config1 (copy)
		Callback(SetCurrentToastMessageFunction(config1))
	end
}