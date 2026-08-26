local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local promiseModule = require(currencyTransfers.Parent.Promise)
local getBalanceRequestModule = require(currencyTransfers.NetworkRequests.getBalanceRequest)

return function(p1, p2)
	-- upvalues: getBalanceRequestModule (ref), promiseModule (ref)
	local var1 = if p1 and p1.refetchDelaySeconds ~= nil then p1.refetchDelaySeconds else 0.45
	
	return getBalanceRequestModule(nil, p2):andThen(function(p3)
		-- upvalues: var1 (ref), promiseModule (copy), getBalanceRequestModule (copy), p2 (ref)
		return if var1 <= 0 then p3 else promiseModule.delay(var1):andThen(function()
			-- upvalues: getBalanceRequestModule (copy), p2 (copy), p3 (ref)
			return getBalanceRequestModule(nil, p2):andThen(function(p4)
				-- upvalues: p3 (copy)
				return math.max(p3, p4)
			end):catch(function()
				-- upvalues: p3 (copy)
				return p3
			end)
		end)
	end)
end