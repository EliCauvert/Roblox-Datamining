local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.HttpClient)
local sduiMaxRetryCount = game:DefineFastInt("SduiMaxRetryCount", 2)
local sduiRetryJitterMinMs = game:DefineFastInt("SduiRetryJitterMinMs", 100)
local sduiRetryJitterMaxMs = game:DefineFastInt("SduiRetryJitterMaxMs", 1000)
local sduiRetryBudgetSec = game:DefineFastInt("SduiRetryBudgetSec", 20)
local sduiFetchTimeoutHeadroomSec = game:DefineFastInt("SduiFetchTimeoutHeadroomSec", 10)

local function getDefaultRetryOptions()
	-- upvalues: sduiMaxRetryCount (ref), sduiRetryJitterMinMs (ref), sduiRetryJitterMaxMs (ref), sduiRetryBudgetSec (ref)
	return {
		maxRetryCount = sduiMaxRetryCount,
		retryJitterMinMs = sduiRetryJitterMinMs,
		retryJitterMaxMs = sduiRetryJitterMaxMs,
		retryBudgetSec = sduiRetryBudgetSec,
		retryOnHttpErrors = {
			[Enum.HttpError.ConnectFail] = true,
			[Enum.HttpError.DnsResolve] = true,
			[Enum.HttpError.NetFail] = true
		}
	}
end

return {
	resolve = function(p1)
		-- upvalues: getDefaultRetryOptions (ref), cryoModule (ref), sduiRetryBudgetSec (ref)
		if p1 == nil then
			return getDefaultRetryOptions()
		elseif p1.mode == "none" then
			return nil
		end
		local var1 = cryoModule.Dictionary.join(getDefaultRetryOptions(), p1.overrides)
		local retryBudgetSec = var1.retryBudgetSec
		var1.retryBudgetSec = if retryBudgetSec ~= nil then sduiRetryBudgetSec else math.min(retryBudgetSec, sduiRetryBudgetSec)
		
		return var1
	end,
	getRequestDeadlineSec = function()
		-- upvalues: sduiRetryBudgetSec (ref), sduiFetchTimeoutHeadroomSec (ref)
		return sduiRetryBudgetSec + sduiFetchTimeoutHeadroomSec
	end,
	getFetchTimeoutSec = function()
		-- upvalues: sduiRetryBudgetSec (ref), sduiFetchTimeoutHeadroomSec (ref)
		return sduiRetryBudgetSec + sduiFetchTimeoutHeadroomSec + 5
	end
}