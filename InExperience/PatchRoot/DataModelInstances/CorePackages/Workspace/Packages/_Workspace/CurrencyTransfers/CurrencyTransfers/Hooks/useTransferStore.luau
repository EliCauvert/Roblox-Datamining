local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local ReactModule = require(CurrencyTransfers.Parent.React)
local TransferContextModule = require(CurrencyTransfers.Contexts.TransferContext)
local _ = require(CurrencyTransfers.Stores.createTransferStore)

return function() --[[ Line: 9 | Named "useTransferStore" ]]
	-- upvalues: ReactModule (copy), TransferContextModule (copy)
	local UseContextResult = ReactModule.useContext(TransferContextModule)
	
	if UseContextResult == nil then
		error("useTransferStore must be used within a TransferContext")
	end
	return UseContextResult
end