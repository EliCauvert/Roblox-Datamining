local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local ReactModule = require(CurrencyTransfers.Parent.React)
local TransferRobuxContainerModule = require(CurrencyTransfers.Components.TransferRobuxContainer)
local TransferContextModule = require(CurrencyTransfers.Contexts.TransferContext)
local _ = require(CurrencyTransfers.Stores.createTransferStore)

return function(p1) --[[ Line: 17 | Named "TransferRobuxApp" ]]
	-- upvalues: ReactModule (copy), TransferContextModule (copy), TransferRobuxContainerModule (copy)
	return ReactModule.createElement(TransferContextModule.Provider, { value = p1.transferStore }, {
		TransferRobuxSheet = ReactModule.createElement(TransferRobuxContainerModule, {})
	})
end