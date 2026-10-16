local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local PromiseModule = require(CurrencyTransfers.Parent.Promise)
local GetBalanceRequestModule = require(CurrencyTransfers.NetworkRequests.getBalanceRequest)

return function(p1, p2) --[[ Line: 17 | Named "getBalanceAfterPurchaseWebview" ]]
	-- upvalues: GetBalanceRequestModule (copy), PromiseModule (copy)
	local RefetchDelaySeconds = if p1 and p1.refetchDelaySeconds ~= nil then p1.refetchDelaySeconds else 0.45
	
	return GetBalanceRequestModule(nil, p2):andThen(function(Result) --[[ Line: 22 ]]
		-- upvalues: RefetchDelaySeconds (copy), PromiseModule (upval), GetBalanceRequestModule (upval), p2 (copy)
		return if RefetchDelaySeconds <= 0 then Result else PromiseModule.delay(RefetchDelaySeconds):andThen(function() --[[ Line: 26 ]]
			-- upvalues: GetBalanceRequestModule (upval), p2 (upval), Result (copy)
			return GetBalanceRequestModule(nil, p2):andThen(function(Result1: number): number --[[ Line: 28 ]]
				-- upvalues: Result (upval)
				return (math.max(Result, Result1))
			end):catch(function() --[[ Line: 31 ]]
				-- upvalues: Result (upval)
				return Result
			end)
		end)
	end)
end