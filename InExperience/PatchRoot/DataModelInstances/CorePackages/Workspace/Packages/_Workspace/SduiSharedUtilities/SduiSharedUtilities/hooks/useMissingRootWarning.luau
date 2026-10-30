local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local ReactModule = require(SduiSharedUtilities.Parent.React)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)
local SduiPageAnalyticsModule = require(SduiSharedUtilities.SduiPageAnalytics)
local SduiRetryPolicyModule = require(SduiSharedUtilities.SduiRetryPolicy)

return function(p1, Current)
	-- upvalues: ReactModule (copy), SduiRetryPolicyModule (copy), GetSduiApiStoreModule (copy), SduiPageAnalyticsModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local HasCurrent = Current ~= nil
	ReactModule.useEffect(function()
		-- upvalues: HasCurrent (copy), SduiRetryPolicyModule (upval), UseRefResult (copy), GetSduiApiStoreModule (upval), SduiPageAnalyticsModule (upval), p1 (copy)
		if HasCurrent then return end
		local DelayedThread = nil
		DelayedThread = task.delay(SduiRetryPolicyModule.getFetchTimeoutSec() + 2, function()
			-- upvalues: DelayedThread (ref), UseRefResult (upval), GetSduiApiStoreModule (upval), SduiPageAnalyticsModule (upval), p1 (upval)
			DelayedThread = nil
			
			if UseRefResult.current == nil then
				local SduiApiStoreModule = GetSduiApiStoreModule()
				SduiPageAnalyticsModule.sendMissingRoot(p1, SduiApiStoreModule.getData(p1).status(false), SduiApiStoreModule.isInFlight(p1))
			end
		end)
		
		return function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	end, { p1, HasCurrent })
end