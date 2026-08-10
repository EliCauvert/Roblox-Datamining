local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local promiseModule = require(currencyTransfers.Parent.Promise)
local getBalanceRequestModule = require(currencyTransfers.NetworkRequests.getBalanceRequest)

return function(p0, p1) --[[ line: 17 | named "getBalanceAfterPurchaseWebview" ]]
	-- upvalues: getBalanceRequestModule (ref), promiseModule (ref)
	local var3 = if p0 and p0.refetchDelaySeconds ~= nil then p0.refetchDelaySeconds else 0.45
	
	return getBalanceRequestModule(nil, p1):andThen(function(p2) --[[ line: 22 ]]
		-- upvalues: var3 (ref), promiseModule (copy), getBalanceRequestModule (copy), p1 (ref)
		return if var3 <= 0 then p2 else promiseModule.delay(var3):andThen(function() --[[ line: 26 ]]
			-- upvalues: getBalanceRequestModule (copy), p1 (copy), p2 (ref)
			return getBalanceRequestModule(nil, p1):andThen(function(p3) --[[ line: 28 ]]
				-- upvalues: p2 (copy)
				return math.max(p2, p3)
			end):catch(function() --[[ line: 31 ]]
				-- upvalues: p2 (copy)
				return p2
			end)
		end)
	end)
end