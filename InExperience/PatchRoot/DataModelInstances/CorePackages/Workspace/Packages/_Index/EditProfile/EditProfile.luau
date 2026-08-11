return {
	Analytics = require(script.Analytics),
	EditDisplayNameErrorModal = require(script.Components.ErrorModals.EditDisplayNameErrorModal),
	EditSocialNetworksErrorModal = require(script.Components.ErrorModals.EditSocialNetworksErrorModal),
	UsernameInsufficientFundsModal = require(script.Components.ErrorModals.UsernameInsufficientFundsModal),
	EditSocialLinksModal = require(script.Components.EditSocialLinksModal),
	Flags = require(script.Flags),
	Constants = require(script.Common.Constants),
	["jest.config"] = script["jest.config"],
	installReducer = require(script.installReducer),
	RoduxKey = require(script.Common.Constants).RODUX_KEY,
	EditUsernameWrapper = require(script.EditUsernameWrapper),
	useDisplayNameText = require(script.Hooks.useDisplayNameText),
	Enums = require(script.Common.Enums),
	EditProfileScreenViewAdapter = require(script.Components.EditProfileScreenViewAdapter),
	EditProfileLanding = require(script.Components.EditProfileLanding),
	EditProfileToastScreen = require(script.Components.EditProfileToast)
}