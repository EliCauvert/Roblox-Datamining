local _ = require(script.types)

return {
	getCreatorCreditStore = require(script.getCreatorCreditStore),
	createCreatorCreditStore = require(script.createCreatorCreditStore),
	createMockStore = require(script.createMockStore),
	config = require(script.config)
}