local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PromiseModule = require(PurchasePrompt.Promise)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local _ = require(PurchasePrompt.types)

local function _(p1, p2)
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return function(Result)
		-- upvalues: p1 (copy), p2 (copy), PromiseModule (upval), PurchaseErrorModule (upval)
		return if type(Result) == "table" and type(Result[p1]) == p2 then Result else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end
end

return function(p1, p2, p3)
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	local config = { friendsAllowed = p3.friendsAllowed }
	
	if #p3.usersToAdd > 0 then
		local UsersToAdd = {}
		
		for _, value in p3.usersToAdd do
			table.insert(UsersToAdd, (tostring(value)))
		end
		config.usersToAdd = UsersToAdd
	end
	local v1 = "friendsAllowed"
	local v2 = "boolean"
	local List = {
		p1.updateVIPServerPermissions(p2, config):andThen(function(Result)
			-- upvalues: v1 (copy), v2 (copy), PromiseModule (upval), PurchaseErrorModule (upval)
			return if type(Result) == "table" and type(Result[v1]) == v2 then Result else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		end)
	}
	
	if p3.name ~= nil then
		local v3 = "name"
		local ValueType = "string"
		table.insert(List, p1.updateVIPServer(p2, { name = p3.name }):andThen(function(Result)
			-- upvalues: v3 (copy), ValueType (copy), PromiseModule (upval), PurchaseErrorModule (upval)
			return if type(Result) == "table" and type(Result[v3]) == ValueType then Result else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		end))
	end
	return PromiseModule.all(List)
end