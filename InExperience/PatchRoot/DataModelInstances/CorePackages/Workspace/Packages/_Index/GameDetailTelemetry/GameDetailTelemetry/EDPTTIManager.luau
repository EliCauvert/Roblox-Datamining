local parent = script:FindFirstAncestor("GameDetailTelemetry").Parent
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local milestone = timeToInteractiveTracker.Milestone
local pageGateModule = require(parent.PageGate)
local fFlagEnablePLTPrefetchCallbacks = pageGateModule.FFlagEnablePLTPrefetchCallbacks
local enableEDPTTIManagerColdWarmDetection = game:DefineFastFlag("EnableEDPTTIManagerColdWarmDetection", false)
local EDP_TTI_EVENT_NAME = require(script.Parent.EDPTTIConstants).EDP_TTI_EVENT_NAME
local var1 = false
local var2 = false

return {
	startTracking = function(p1)
		-- upvalues: var1 (write), var2 (write), timeToInteractiveTracker (ref), EDP_TTI_EVENT_NAME (ref), enableEDPTTIManagerColdWarmDetection (ref)
		var1 = false
		var2 = false
		local var3 = timeToInteractiveTracker.getEvents(false)[EDP_TTI_EVENT_NAME]
		
		if not var3 or not var3.startTime then
			timeToInteractiveTracker.trackStart(EDP_TTI_EVENT_NAME, if enableEDPTTIManagerColdWarmDetection then true else nil)
			timeToInteractiveTracker.updateMetadata(EDP_TTI_EVENT_NAME, { page = p1 })
		end
	end,
	setImplementation = function(value)
		-- upvalues: timeToInteractiveTracker (ref), EDP_TTI_EVENT_NAME (ref)
		timeToInteractiveTracker.updateMetadata(EDP_TTI_EVENT_NAME, { category = value })
	end,
	trackFunctionallyReady = function()
		-- upvalues: var1 (write), timeToInteractiveTracker (ref), EDP_TTI_EVENT_NAME (ref), milestone (ref), fFlagEnablePLTPrefetchCallbacks (ref), pageGateModule (ref)
		if var1 then return end
		var1 = true
		
		if timeToInteractiveTracker.trackMilestone then
			timeToInteractiveTracker.trackMilestone(EDP_TTI_EVENT_NAME, milestone.FunctionallyReady)
		end
		if fFlagEnablePLTPrefetchCallbacks then
			pageGateModule.signal(pageGateModule.Page.ExperienceDetail, pageGateModule.Milestone.FunctionallyReady)
		end
	end,
	trackSurfaceReady = function(p1)
		-- upvalues: var2 (write), timeToInteractiveTracker (ref), EDP_TTI_EVENT_NAME (ref), milestone (ref)
		if var2 then return end
		var2 = true
		
		if p1 then
			timeToInteractiveTracker.updateMetadata(EDP_TTI_EVENT_NAME, p1)
		end
		if timeToInteractiveTracker.trackMilestone then
			timeToInteractiveTracker.trackMilestone(EDP_TTI_EVENT_NAME, milestone.SurfaceReady)
		end
		timeToInteractiveTracker.trackEnd(EDP_TTI_EVENT_NAME)
	end
}