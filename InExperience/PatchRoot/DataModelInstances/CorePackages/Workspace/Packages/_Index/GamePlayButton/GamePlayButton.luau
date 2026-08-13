local _ = require(script.PlayButtonTypes)
local _ = require(script.usePlayButtonState)

return {
	Flags = require(script.Flags),
	FetchGamePlayButtonData = require(script.FetchGamePlayButtonData),
	delayedAmpWizardCompletionCallbackOverride = require(script.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride),
	LegacyPlayButtonContainer = require(script.LegacyPlayButtonContainer),
	PlayButton = require(script.PlayButton),
	PlayButtonView = require(script.PlayButtonView),
	PlayButtonReferralSource = require(script.PlayButtonReferralSource),
	PlayButtonStates = require(script.PlayButtonStates),
	PlayButtonUpsellDialog = require(script.PlayButtonUpsellDialog),
	useOnPlayButtonCallback = require(script.useOnPlayButtonCallback),
	useOnPlaySquadButtonCallback = require(script.useOnPlaySquadButtonCallback),
	usePlayButtonState = require(script.usePlayButtonState),
	usePlayButtonContextualMessage = require(script.usePlayButtonContextualMessage),
	PlayButtonContextualMessageImpressionsDetector = require(script.PlayButtonContextualMessageImpressionsDetector),
	usePlayButtonLaunchGame = if require(script.Parent.SharedFlags).FFlagEnablePlayWithRewardComponent then require(script.PlayButtonLaunchChecks.usePlayButtonLaunchGame) else nil,
	["jest.config"] = script["jest.config"]
}