local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local getTransferRequestByIdRequestModule = require(currencyTransfers.NetworkRequests.getTransferRequestByIdRequest)
local _ = require(currencyTransfers.Models.GetTransferByIdModel)
local _ = require(currencyTransfers.Models.ErrorTransferModel)
local handleGetErrorModule = require(currencyTransfers.Actions.handleGetError)

return function(p1)
	-- upvalues: handleGetErrorModule (ref), getTransferRequestByIdRequestModule (ref)
	local networkImpl = p1.getNetworkImpl()
	local setRobuxTransfer = p1.setRobuxTransfer
	local transferRequestId = p1.getTransferRequestId(false)
	
	if transferRequestId then
		return getTransferRequestByIdRequestModule({ transferRequestId = transferRequestId }, nil, networkImpl):andThen(function(p2)
			-- upvalues: setRobuxTransfer (ref), handleGetErrorModule (copy), p1 (ref)
			if p2 and p2.transfer then
				setRobuxTransfer(p2.transfer)
				
				return
			end
			handleGetErrorModule(p1, nil)
		end):catch(function(p2)
			-- upvalues: handleGetErrorModule (copy), p1 (ref)
			if typeof(p2) == "table" and p2.errorMessage then
				handleGetErrorModule(p1, p2)
				
				return
			end
			handleGetErrorModule(p1, nil)
		end)
	end
	handleGetErrorModule(p1, nil)
end