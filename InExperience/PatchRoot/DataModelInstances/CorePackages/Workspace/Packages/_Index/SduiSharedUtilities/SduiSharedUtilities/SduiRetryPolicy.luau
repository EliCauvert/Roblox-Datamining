local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.HttpClient)
local SduiMaxRetryCount = game:DefineFastInt("SduiMaxRetryCount", 2)
local SduiRetryJitterMinMs = game:DefineFastInt("SduiRetryJitterMinMs", 100)
local SduiRetryJitterMaxMs = game:DefineFastInt("SduiRetryJitterMaxMs", 1000)
local SduiRetryBudgetSec = game:DefineFastInt("SduiRetryBudgetSec", 20)
local SduiFetchTimeoutHeadroomSec = game:DefineFastInt("SduiFetchTimeoutHeadroomSec", 10)

local function getDefaultRetryOptions() --[[ Line: 42 ]]
	-- upvalues: SduiMaxRetryCount (copy), SduiRetryJitterMinMs (copy), SduiRetryJitterMaxMs (copy), SduiRetryBudgetSec (copy)
	return {
		maxRetryCount = SduiMaxRetryCount,
		retryJitterMinMs = SduiRetryJitterMinMs,
		retryJitterMaxMs = SduiRetryJitterMaxMs,
		retryBudgetSec = SduiRetryBudgetSec,
		retryOnHttpErrors = {
			[Enum.HttpError.ConnectFail] = true,
			[Enum.HttpError.DnsResolve] = true,
			[Enum.HttpError.NetFail] = true
		}
	}
end

return {
	resolve = function(p1) --[[ Line: 57 ]]
		-- upvalues: getDefaultRetryOptions (copy), CryoModule (copy), SduiRetryBudgetSec (copy)
		if p1 == nil then
			return (getDefaultRetryOptions())
		elseif p1.mode == "none" then
			return nil
		else
			local JoinResult = CryoModule.Dictionary.join(getDefaultRetryOptions(), p1.overrides)
			local RetryBudgetSec: number = JoinResult.retryBudgetSec
			JoinResult.retryBudgetSec = if RetryBudgetSec == nil then SduiRetryBudgetSec else math.min(RetryBudgetSec, SduiRetryBudgetSec)
			
			return JoinResult
		end
	end,
	getRequestDeadlineSec = function() --[[ Line: 34 ]]
		-- upvalues: SduiRetryBudgetSec (copy), SduiFetchTimeoutHeadroomSec (copy)
		return SduiRetryBudgetSec + SduiFetchTimeoutHeadroomSec
	end,
	getFetchTimeoutSec = function(): number --[[ Line: 38 ]]
		-- upvalues: SduiRetryBudgetSec (copy), SduiFetchTimeoutHeadroomSec (copy)
		return SduiRetryBudgetSec + SduiFetchTimeoutHeadroomSec + 5
	end
}