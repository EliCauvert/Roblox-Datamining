local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local transferRobuxContainerModule = require(currencyTransfers.Components.TransferRobuxContainer)
local transferContextModule = require(currencyTransfers.Contexts.TransferContext)
local _ = require(currencyTransfers.Stores.createTransferStore)

return function(p1)
	-- upvalues: reactModule (ref), transferContextModule (ref), transferRobuxContainerModule (ref)
	return reactModule.createElement(transferContextModule.Provider, { value = p1.transferStore }, {
		TransferRobuxSheet = reactModule.createElement(transferRobuxContainerModule, {})
	})
end