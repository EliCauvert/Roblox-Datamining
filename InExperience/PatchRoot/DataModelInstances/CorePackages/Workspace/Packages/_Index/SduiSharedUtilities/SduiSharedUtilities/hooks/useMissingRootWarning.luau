local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local reactModule = require(sduiSharedUtilities.Parent.React)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)
local sduiPageAnalyticsModule = require(sduiSharedUtilities.SduiPageAnalytics)
local sduiRetryPolicyModule = require(sduiSharedUtilities.SduiRetryPolicy)

return function(p1, p2)
	-- upvalues: reactModule (ref), sduiRetryPolicyModule (ref), getSduiApiStoreModule (ref), sduiPageAnalyticsModule (ref)
	local var1 = reactModule.useRef(p2)
	var1.current = p2
	local var2 = p2 ~= nil
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), sduiRetryPolicyModule (copy), var1 (ref), getSduiApiStoreModule (copy), sduiPageAnalyticsModule (copy), p1 (ref)
		if var2 then
			return
		end
		local delayedThread = nil
		delayedThread = task.delay(sduiRetryPolicyModule.getFetchTimeoutSec() + 2, function()
			-- upvalues: delayedThread (write), var1 (copy), getSduiApiStoreModule (copy), sduiPageAnalyticsModule (copy), p1 (copy)
			delayedThread = nil
			
			if var1.current == nil then
				local var3 = getSduiApiStoreModule()
				sduiPageAnalyticsModule.sendMissingRoot(p1, var3.getData(p1).status(false), var3.isInFlight(p1))
			end
		end)
		
		return function()
			-- upvalues: delayedThread (write)
			if delayedThread then
				task.cancel(delayedThread)
				delayedThread = nil
			end
		end
	end, { p1, var2 })
end