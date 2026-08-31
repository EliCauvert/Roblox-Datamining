local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local toastRoduxModule = require(avatarExperienceProfilePictureEditor.Parent.ToastRodux)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local t = {
	toastMessage = "Feature.Profile.Heading.ProfilePictureSaved",
	isLocalized = false,
	toastType = toastType.SuccessConfirmation
}
local t_1 = {
	isLocalized = false,
	toastMessage = textKeysModule.SaveFailed,
	toastType = toastType.NetworkingError
}

return {
	showSaveSuccessToast = function(p1)
		-- upvalues: setCurrentToastMessage (ref), t (ref)
		p1(setCurrentToastMessage(t))
	end,
	showSaveFailureToast = function(p1)
		-- upvalues: setCurrentToastMessage (ref), t_1 (ref)
		p1(setCurrentToastMessage(t_1))
	end
}