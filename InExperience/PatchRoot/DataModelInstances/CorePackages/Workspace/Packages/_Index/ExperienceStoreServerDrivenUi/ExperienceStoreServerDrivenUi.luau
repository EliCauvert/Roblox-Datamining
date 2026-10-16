return {
	DevStoreSeeAllPage = function() --[[ Line: 9 ]]
		return require(script.Components.DevStoreSeeAllPage)
	end,
	SduiExperienceStoreRegister = require(script.System.SduiExperienceStoreRegister),
	SduiVirtualGameItemText = require(script.Components.SduiVirtualGameItemText),
	navigateToDevStoreSeeAll = function(...) --[[ Line: 14 ]]
		return require(script.Navigation.navigateToDevStoreSeeAll)(...)
	end,
	registerExperienceStoreActions = require(script.Actions.registerExperienceStoreActions),
	registerExperienceStoreComponents = require(script.System.registerExperienceStoreComponents),
	["jest.config"] = script["jest.config"]
}