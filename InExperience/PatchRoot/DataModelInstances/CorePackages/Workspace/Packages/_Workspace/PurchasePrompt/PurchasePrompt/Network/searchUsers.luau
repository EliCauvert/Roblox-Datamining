local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PromiseModule = require(PurchasePrompt.Promise)
local _ = require(PurchasePrompt.types)

return function(p1, p2)
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.searchUsers(p2):andThen(function(Result)
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		if type(Result) ~= "table" or type(Result.data) ~= "table" then
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		end
		local List = {}
		
		for _, entry in Result.data do
			table.insert(List, {
				userId = entry.id,
				displayName = entry.displayName or entry.name
			})
		end
		return List
	end)
end