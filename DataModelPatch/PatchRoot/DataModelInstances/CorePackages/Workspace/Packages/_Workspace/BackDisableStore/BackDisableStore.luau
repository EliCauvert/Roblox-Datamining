local BackDisableStoreModule = require(script.BackDisableStore)

return {
	getCount = BackDisableStoreModule.getCount,
	getIsDisabled = BackDisableStoreModule.getIsDisabled,
	setDisabled = BackDisableStoreModule.setDisabled,
	["jest.config"] = script["jest.config"]
}