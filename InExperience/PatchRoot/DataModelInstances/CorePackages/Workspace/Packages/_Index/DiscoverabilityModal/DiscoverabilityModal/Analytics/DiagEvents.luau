local eventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[eventNamesModule.DiscoverabilityModalLoad] = {
		name = game:DefineFastString("DiscoverabilityModalLoadCounter", "DiscoverabilityModalLoad")
	},
	[eventNamesModule.DiscoverabilityModalContinue] = {
		name = game:DefineFastString("DiscoverabilityModalContinueCounter", "DiscoverabilityModalContinue")
	},
	[eventNamesModule.DiscoverabilityModalClose] = {
		name = game:DefineFastString("DiscoverabilityModalCloseCounter", "DiscoverabilityModalClose")
	},
	[eventNamesModule.DiscoverabilityModalRadioButtonClick] = {
		name = game:DefineFastString("DiscoverabilityModalRadioButtonClickCounter", "DiscoverabilityModalRadioButtonClick")
	}
}