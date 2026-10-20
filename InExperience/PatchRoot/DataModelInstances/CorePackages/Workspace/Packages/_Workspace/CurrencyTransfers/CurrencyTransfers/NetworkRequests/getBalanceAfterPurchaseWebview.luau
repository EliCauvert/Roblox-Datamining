local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local PromiseModule = require(CurrencyTransfers.Parent.Promise)
local GetBalanceRequestModule = require(CurrencyTransfers.NetworkRequests.getBalanceRequest)

return function(p1, p2)
	-- upvalues: GetBalanceRequestModule (copy), PromiseModule (copy)
	local RefetchDelaySeconds = if p1 and p1.refetchDelaySeconds ~= nil then p1.refetchDelaySeconds else 0.45
	
	return GetBalanceRequestModule(nil, p2):andThen(function(Result)
		-- upvalues: RefetchDelaySeconds (copy), PromiseModule (upval), GetBalanceRequestModule (upval), p2 (copy)
		return if RefetchDelaySeconds <= 0 then Result else PromiseModule.delay(RefetchDelaySeconds):andThen(function()
			-- upvalues: GetBalanceRequestModule (upval), p2 (upval), Result (copy)
			return GetBalanceRequestModule(nil, p2):andThen(function(Result1: number): number
				-- upvalues: Result (upval)
				return (math.max(Result, Result1))
			end):catch(function()
				-- upvalues: Result (upval)
				return Result
			end)
		end)
	end)
end