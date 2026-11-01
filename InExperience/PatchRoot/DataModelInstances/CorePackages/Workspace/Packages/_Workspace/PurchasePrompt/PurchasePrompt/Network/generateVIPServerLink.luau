local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PromiseModule = require(PurchasePrompt.Promise)

return function(p1, p2)
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.updateVIPServer(p2, { newJoinCode = true }):andThen(function(Result)
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return if type(Result) == "table" and type(Result.link) == "string" then Result.link else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end