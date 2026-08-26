local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local milestone = timeToInteractiveTracker.Milestone
local analyticsModule = require(momentsCommon.Analytics)
local _ = require(momentsCommon.Enums.CaptureKind)
local eventNames = analyticsModule.EventNames
local fireAnalyticsEvent = analyticsModule.fireAnalyticsEvent
local fFlagMomentsRealtimeObservabilityModule = require(momentsCommon.Flags.FFlagMomentsRealtimeObservability)
local fIntMomentsSurfaceLoadTTISamplingRate = sharedFlagsModule.FIntMomentsSurfaceLoadTTISamplingRate
local var1 = 0
local var2 = nil

local function _(p1)
	-- upvalues: sharedFlagsModule (ref), var1 (write), timeToInteractiveTracker (ref), fFlagMomentsRealtimeObservabilityModule (ref), analyticsModule (ref), var2 (write)
	local fIntMomentsSurfaceLoadTTIMaxMs = sharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
	
	if fIntMomentsSurfaceLoadTTIMaxMs <= 0 then
		return
	end
	task.delay(fIntMomentsSurfaceLoadTTIMaxMs / 1000, function()
		-- upvalues: p1 (ref), var1 (copy), timeToInteractiveTracker (copy), fFlagMomentsRealtimeObservabilityModule (copy), analyticsModule (copy), var2 (copy)
		if p1 == var1 then
			local events = timeToInteractiveTracker.getEvents()
			
			if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
			local var3 = if fFlagMomentsRealtimeObservabilityModule then "capped" else nil
			local events = timeToInteractiveTracker.getEvents()
			
			if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
			if var3 ~= nil then
				analyticsModule.reportMomentsSurfaceLoadAbort(var3)
			end
			timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
			var2 = nil
			
			return
		end
	end)
end

return {
	EVENT_NAME = "Watch_MomentsFeed",
	start = function()
		-- upvalues: var1 (write), var2 (write), timeToInteractiveTracker (ref), sharedFlagsModule (ref), fFlagMomentsRealtimeObservabilityModule (ref), analyticsModule (ref)
		var1 += 1
		var2 = os.clock()
		timeToInteractiveTracker.trackStart("Watch_MomentsFeed", true)
		local var3 = var1
		local fIntMomentsSurfaceLoadTTIMaxMs = sharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
		
		if fIntMomentsSurfaceLoadTTIMaxMs <= 0 then
			return
		end
		task.delay(fIntMomentsSurfaceLoadTTIMaxMs / 1000, function()
			-- upvalues: var3 (ref), var1 (copy), timeToInteractiveTracker (copy), fFlagMomentsRealtimeObservabilityModule (copy), analyticsModule (copy), var2 (copy)
			if var3 == var1 then
				local events = timeToInteractiveTracker.getEvents()
				
				if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
				local var4 = if fFlagMomentsRealtimeObservabilityModule then "capped" else nil
				local events = timeToInteractiveTracker.getEvents()
				
				if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
				if var4 ~= nil then
					analyticsModule.reportMomentsSurfaceLoadAbort(var4)
				end
				timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
				var2 = nil
				
				return
			end
		end)
	end,
	isSessionActive = function()
		-- upvalues: timeToInteractiveTracker (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		return events ~= nil and events.Watch_MomentsFeed ~= nil
	end,
	getSessionGeneration = function()
		-- upvalues: var1 (write)
		return var1
	end,
	elapsedMs = function()
		-- upvalues: var2 (write)
		return if var2 == nil then 0 else (os.clock() - var2) * 1000
	end,
	renderStarted = function()
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.RenderStarted)
			
			return
		end
	end,
	surfaceMounted = function()
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.SurfaceMounted)
			
			return
		end
	end,
	primaryDataStarted = function()
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name)
			
			return
		end
	end,
	primaryDataNetworkFetch = function()
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackSubphase("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name, milestone.PrimaryDataStarted.Subphase.NetworkFetch)
			
			return
		end
	end,
	primaryDataResponseReceived = function()
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackSubphase("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name, milestone.PrimaryDataStarted.Subphase.ResponseReceived)
			
			return
		end
	end,
	primaryDataReady = function()
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.PrimaryDataReady.Name)
			
			return
		end
	end,
	markSurfaceReady = function(p1)
		-- upvalues: timeToInteractiveTracker (ref), var2 (write), sharedFlagsModule (ref), fFlagMomentsRealtimeObservabilityModule (ref), analyticsModule (ref), milestone (ref), fIntMomentsSurfaceLoadTTISamplingRate (ref), fireAnalyticsEvent (ref), eventNames (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
		local var3 = if var2 == nil then 0 else (os.clock() - var2) * 1000
		local fIntMomentsSurfaceLoadTTIMaxMs = sharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
		
		if fIntMomentsSurfaceLoadTTIMaxMs > 0 and fIntMomentsSurfaceLoadTTIMaxMs < var3 then
			local var4 = if fFlagMomentsRealtimeObservabilityModule then "capped" else nil
			local events_1 = timeToInteractiveTracker.getEvents()
			
			if not (events_1 ~= nil and events_1.Watch_MomentsFeed ~= nil) then return end
			if var4 ~= nil then
				analyticsModule.reportMomentsSurfaceLoadAbort(var4)
			end
			timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
			var2 = nil
			
			return
		elseif p1 ~= nil then
			timeToInteractiveTracker.updateMetadata("Watch_MomentsFeed", { subcategory = p1 })
		end
		timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.SurfaceReady)
		timeToInteractiveTracker.trackEnd("Watch_MomentsFeed", {
			samplingRateOverride = fIntMomentsSurfaceLoadTTISamplingRate
		})
		fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = var3 })
		var2 = nil
	end,
	abort = function(p1)
		-- upvalues: timeToInteractiveTracker (ref), analyticsModule (ref), var2 (write)
		local events = timeToInteractiveTracker.getEvents()
		
		if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
		if p1 ~= nil then
			analyticsModule.reportMomentsSurfaceLoadAbort(p1)
		end
		timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
		var2 = nil
	end
}