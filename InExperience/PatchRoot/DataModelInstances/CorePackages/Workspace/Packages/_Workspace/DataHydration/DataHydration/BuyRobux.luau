local SignalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.BuyRobuxStoreTypes)
local CreateBuyRobuxStoreModule = require(script.createBuyRobuxStore)

return {
	createBuyRobuxStore = CreateBuyRobuxStoreModule,
	getOneTimeProductStore = SignalsModule.createComputed(function()
		-- upvalues: CreateBuyRobuxStoreModule (copy)
		return CreateBuyRobuxStoreModule()
	end),
	getSubscriptionProductStore = SignalsModule.createComputed(function()
		-- upvalues: CreateBuyRobuxStoreModule (copy)
		return CreateBuyRobuxStoreModule()
	end),
	getPendingTransferStore = SignalsModule.createComputed(function()
		-- upvalues: CreateBuyRobuxStoreModule (copy)
		return CreateBuyRobuxStoreModule()
	end),
	getBonusItemStore = SignalsModule.createComputed(function()
		-- upvalues: CreateBuyRobuxStoreModule (copy)
		return CreateBuyRobuxStoreModule()
	end)
}