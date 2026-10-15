local parent = script:FindFirstAncestor("GameDetail").Parent
local sduiSurfaceLoadTimeTracker = require(parent.SduiSharedUtilities).SduiSurfaceLoadTimeTracker
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local EDPTTIConstants = require(parent.GameDetailTelemetry).EDPTTIConstants
local EDP_TTI_EVENT_NAME = EDPTTIConstants.EDP_TTI_EVENT_NAME
local FIRST_MEDIA_RESOLVED = EDPTTIConstants.EDP_MILESTONE.FIRST_MEDIA_RESOLVED

return function(p1, p2)
	-- upvalues: sduiSurfaceLoadTimeTracker (ref), EDP_TTI_EVENT_NAME (ref), timeToInteractiveTracker (ref), FIRST_MEDIA_RESOLVED (ref)
	local var1 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(p1, {
		manualSurfaceReady = true,
		manualFunctionallyReady = true,
		startImmediately = true,
		eventName = EDP_TTI_EVENT_NAME,
		metadata = p2
	})
	local var2 = false
	local var3 = false
	local var4 = false
	local var5 = nil
	local trackSurfaceReady = var1.trackSurfaceReady
	
	local function _()
		-- upvalues: trackSurfaceReady (ref), var5 (write)
		trackSurfaceReady(var5)
	end
	
	local function markPlayButtonReady()
		-- upvalues: var4 (write), var3 (write), trackSurfaceReady (ref), var5 (write)
		if var4 then return end
		var4 = true
		
		if var3 then
			trackSurfaceReady(var5)
		end
	end
	
	function var1.trackSurfaceReady(p3)
		-- upvalues: var2 (write), timeToInteractiveTracker (copy), EDP_TTI_EVENT_NAME (copy), FIRST_MEDIA_RESOLVED (copy), var3 (write), var5 (write), var4 (write), trackSurfaceReady (ref)
		if not var2 then
			var2 = true
			local var6 = if p3 then p3.mediaFound else nil
			timeToInteractiveTracker.trackMilestone(EDP_TTI_EVENT_NAME, FIRST_MEDIA_RESOLVED, {
				id = if var6 == true then "success" elseif var6 == false then "failed" else "unknown"
			})
		end
		if var3 then return end
		var3 = true
		var5 = p3
		
		if var4 then
			trackSurfaceReady(var5)
		end
	end
	
	var1.markPlayButtonReady = markPlayButtonReady
	
	return var1
end