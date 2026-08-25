local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local transferContextModule = require(currencyTransfers.Contexts.TransferContext)
local _ = require(currencyTransfers.Stores.createTransferStore)

return function()
	-- upvalues: reactModule (ref), transferContextModule (ref)
	local var3 = reactModule.useContext(transferContextModule)
	
	if var3 == nil then
		error("useTransferStore must be used within a TransferContext")
	end
	return var3
end