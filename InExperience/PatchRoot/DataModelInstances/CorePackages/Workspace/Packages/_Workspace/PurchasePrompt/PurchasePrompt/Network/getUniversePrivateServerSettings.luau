local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(value, p1)
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return value.getUniversePrivateServerSettings(p1):andThen(function(p2)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		local privateServerData = p2.privateServerData
		
		return if privateServerData == nil then promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName) elseif privateServerData.isAvailable == false then promiseModule.reject(purchaseErrorModule.VIPServerUnavailable) else promiseModule.resolve(p2)
	end, function()
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end)
end