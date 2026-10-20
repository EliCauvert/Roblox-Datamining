local EventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[EventNamesModule.DiscoverabilityModalLoad] = {
		name = game:DefineFastString("DiscoverabilityModalLoadCounter", "DiscoverabilityModalLoad")
	},
	[EventNamesModule.DiscoverabilityModalContinue] = {
		name = game:DefineFastString("DiscoverabilityModalContinueCounter", "DiscoverabilityModalContinue")
	},
	[EventNamesModule.DiscoverabilityModalClose] = {
		name = game:DefineFastString("DiscoverabilityModalCloseCounter", "DiscoverabilityModalClose")
	},
	[EventNamesModule.DiscoverabilityModalRadioButtonClick] = {
		name = game:DefineFastString("DiscoverabilityModalRadioButtonClickCounter", "DiscoverabilityModalRadioButtonClick")
	}
}