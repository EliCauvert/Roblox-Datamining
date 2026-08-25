local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local getTransferRequestByIdRequestModule = require(currencyTransfers.NetworkRequests.getTransferRequestByIdRequest)
local _ = require(currencyTransfers.Models.GetTransferByIdModel)
local _ = require(currencyTransfers.Models.ErrorTransferModel)
local handleGetErrorModule = require(currencyTransfers.Actions.handleGetError)

return function(p0)
	-- upvalues: handleGetErrorModule (ref), getTransferRequestByIdRequestModule (ref)
	local networkImpl = p0.getNetworkImpl()
	local setRobuxTransfer = p0.setRobuxTransfer
	local transferRequestId = p0.getTransferRequestId(false)
	
	if transferRequestId then
		return getTransferRequestByIdRequestModule({ transferRequestId = transferRequestId }, nil, networkImpl):andThen(function(p2)
			-- upvalues: setRobuxTransfer (ref), handleGetErrorModule (copy), p0 (ref)
			if p2 and p2.transfer then
				setRobuxTransfer(p2.transfer)
				
				return
			end
			handleGetErrorModule(p0, nil)
		end):catch(function(p1)
			-- upvalues: handleGetErrorModule (copy), p0 (ref)
			if typeof(p1) == "table" and p1.errorMessage then
				handleGetErrorModule(p0, p1)
				
				return
			end
			handleGetErrorModule(p0, nil)
		end)
	end
	handleGetErrorModule(p0, nil)
end