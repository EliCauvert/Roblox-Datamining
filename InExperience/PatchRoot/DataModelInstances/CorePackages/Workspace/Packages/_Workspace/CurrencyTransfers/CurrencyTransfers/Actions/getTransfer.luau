local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local GetTransferRequestByIdRequestModule = require(CurrencyTransfers.NetworkRequests.getTransferRequestByIdRequest)
local _ = require(CurrencyTransfers.Models.GetTransferByIdModel)
local _ = require(CurrencyTransfers.Models.ErrorTransferModel)
local HandleGetErrorModule = require(CurrencyTransfers.Actions.handleGetError)

return function(p1)
	-- upvalues: HandleGetErrorModule (copy), GetTransferRequestByIdRequestModule (copy)
	local NetworkImpl = p1.getNetworkImpl()
	local SetRobuxTransferFunction = p1.setRobuxTransfer
	local TransferRequestId = p1.getTransferRequestId(false)
	
	if TransferRequestId then
		return GetTransferRequestByIdRequestModule({ transferRequestId = TransferRequestId }, nil, NetworkImpl):andThen(function(Result)
			-- upvalues: SetRobuxTransferFunction (copy), HandleGetErrorModule (upval), p1 (copy)
			if Result and Result.transfer then
				SetRobuxTransferFunction(Result.transfer)
				
				return
			else
				HandleGetErrorModule(p1, nil)
			end
		end):catch(function(Err)
			-- upvalues: HandleGetErrorModule (upval), p1 (copy)
			if typeof(Err) == "table" and Err.errorMessage then
				HandleGetErrorModule(p1, Err)
				
				return
			else
				HandleGetErrorModule(p1, nil)
			end
		end)
	else
		HandleGetErrorModule(p1, nil)
	end
end