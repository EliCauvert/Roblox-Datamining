local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local promiseModule = require(currencyTransfers.Parent.Promise)
local getBalanceRequestModule = require(currencyTransfers.NetworkRequests.getBalanceRequest)

return function(p0) --[[ line: 15 | named "getBalanceAfterPurchaseWebview" ]]
	-- upvalues: getBalanceRequestModule (ref), promiseModule (ref)
	local var3 = if p0 and p0.refetchDelaySeconds ~= nil then p0.refetchDelaySeconds else 0.45
	
	return getBalanceRequestModule():andThen(function(p1) --[[ line: 20 ]]
		-- upvalues: var3 (ref), promiseModule (copy), getBalanceRequestModule (copy)
		return if var3 <= 0 then p1 else promiseModule.delay(var3):andThen(function() --[[ line: 24 ]]
			-- upvalues: getBalanceRequestModule (copy), p1 (ref)
			return getBalanceRequestModule():andThen(function(p2) --[[ line: 26 ]]
				-- upvalues: p1 (copy)
				return math.max(p1, p2)
			end):catch(function() --[[ line: 29 ]]
				-- upvalues: p1 (copy)
				return p1
			end)
		end)
	end)
end