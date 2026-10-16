local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)

return function(p1, p2) --[[ Line: 5 | Named "getUniversePrivateServerSettings" ]]
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.getUniversePrivateServerSettings(p2):andThen(function(Result) --[[ Line: 6 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		local PrivateServerData = Result.privateServerData
		
		return if PrivateServerData == nil then PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName) elseif PrivateServerData.isAvailable == false then PromiseModule.reject(PurchaseErrorModule.VIPServerUnavailable) else PromiseModule.resolve(Result)
	end, function() --[[ Line: 14 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
	end)
end