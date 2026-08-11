local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local milestone = timeToInteractiveTracker.Milestone
local analyticsModule = require(momentsCommon.Analytics)
local eventNames = analyticsModule.EventNames
local fireAnalyticsEvent = analyticsModule.fireAnalyticsEvent
local fFlagMomentsRealtimeObservabilityModule = require(momentsCommon.Flags.FFlagMomentsRealtimeObservability)
local fIntMomentsSurfaceLoadTTISamplingRate = sharedFlagsModule.FIntMomentsSurfaceLoadTTISamplingRate
local var4 = 0
local var5 = nil

local function _(p0) --[[ line: 48 | named "scheduleCapTimeout" ]]
	-- upvalues: sharedFlagsModule (ref), var4 (write), timeToInteractiveTracker (ref), fFlagMomentsRealtimeObservabilityModule (ref), analyticsModule (ref), var5 (write)
	local fIntMomentsSurfaceLoadTTIMaxMs = sharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
	
	if fIntMomentsSurfaceLoadTTIMaxMs <= 0 then
		return
	end
	task.delay(fIntMomentsSurfaceLoadTTIMaxMs / 1000, function() --[[ line: 53 ]]
		-- upvalues: p0 (ref), var4 (copy), timeToInteractiveTracker (copy), fFlagMomentsRealtimeObservabilityModule (copy), analyticsModule (copy), var5 (copy)
		if p0 == var4 then
			local events = timeToInteractiveTracker.getEvents()
			
			if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
			local var7 = if fFlagMomentsRealtimeObservabilityModule then "capped" else nil
			local events = timeToInteractiveTracker.getEvents()
			
			if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
			if var7 ~= nil then
				analyticsModule.reportMomentsSurfaceLoadAbort(var7)
			end
			timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
			var5 = nil
			
			return
		end
	end)
end

return {
	EVENT_NAME = "Watch_MomentsFeed",
	start = function() --[[ line: 64 ]]
		-- upvalues: var4 (write), var5 (write), timeToInteractiveTracker (ref), sharedFlagsModule (ref), fFlagMomentsRealtimeObservabilityModule (ref), analyticsModule (ref)
		var4 += 1
		var5 = os.clock()
		timeToInteractiveTracker.trackStart("Watch_MomentsFeed", true)
		local var9 = var4
		local fIntMomentsSurfaceLoadTTIMaxMs = sharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
		
		if fIntMomentsSurfaceLoadTTIMaxMs <= 0 then
			return
		end
		task.delay(fIntMomentsSurfaceLoadTTIMaxMs / 1000, function() --[[ line: 53 ]]
			-- upvalues: var9 (ref), var4 (copy), timeToInteractiveTracker (copy), fFlagMomentsRealtimeObservabilityModule (copy), analyticsModule (copy), var5 (copy)
			if var9 == var4 then
				local events = timeToInteractiveTracker.getEvents()
				
				if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
				local var7 = if fFlagMomentsRealtimeObservabilityModule then "capped" else nil
				local events = timeToInteractiveTracker.getEvents()
				
				if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
				if var7 ~= nil then
					analyticsModule.reportMomentsSurfaceLoadAbort(var7)
				end
				timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
				var5 = nil
				
				return
			end
		end)
	end,
	isSessionActive = function() --[[ line: 25 ]]
		-- upvalues: timeToInteractiveTracker (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		return events ~= nil and events.Watch_MomentsFeed ~= nil
	end,
	getSessionGeneration = function() --[[ line: 73 ]]
		-- upvalues: var4 (write)
		return var4
	end,
	elapsedMs = function() --[[ line: 30 ]]
		-- upvalues: var5 (write)
		return if var5 == nil then 0 else (os.clock() - var5) * 1000
	end,
	renderStarted = function() --[[ line: 79 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.RenderStarted)
			
			return
		end
	end,
	surfaceMounted = function() --[[ line: 86 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.SurfaceMounted)
			
			return
		end
	end,
	primaryDataStarted = function() --[[ line: 93 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name)
			
			return
		end
	end,
	primaryDataNetworkFetch = function() --[[ line: 100 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackSubphase("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name, milestone.PrimaryDataStarted.Subphase.NetworkFetch)
			
			return
		end
	end,
	primaryDataResponseReceived = function() --[[ line: 111 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackSubphase("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name, milestone.PrimaryDataStarted.Subphase.ResponseReceived)
			
			return
		end
	end,
	primaryDataReady = function() --[[ line: 122 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.PrimaryDataReady.Name)
			
			return
		end
	end,
	markSurfaceReady = function() --[[ line: 129 ]]
		-- upvalues: timeToInteractiveTracker (ref), var5 (write), sharedFlagsModule (ref), fFlagMomentsRealtimeObservabilityModule (ref), analyticsModule (ref), milestone (ref), fIntMomentsSurfaceLoadTTISamplingRate (ref), fireAnalyticsEvent (ref), eventNames (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
		local var18 = if var5 == nil then 0 else (os.clock() - var5) * 1000
		local fIntMomentsSurfaceLoadTTIMaxMs = sharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
		
		if fIntMomentsSurfaceLoadTTIMaxMs <= 0 or fIntMomentsSurfaceLoadTTIMaxMs >= var18 then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.SurfaceReady)
			timeToInteractiveTracker.trackEnd("Watch_MomentsFeed", {
				samplingRateOverride = fIntMomentsSurfaceLoadTTISamplingRate
			})
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, { value = var18 })
			var5 = nil
			
			return
		end
		local var19 = if fFlagMomentsRealtimeObservabilityModule then "capped" else nil
		local events_1 = timeToInteractiveTracker.getEvents()
		
		if not (events_1 ~= nil and events_1.Watch_MomentsFeed ~= nil) then return end
		if var19 ~= nil then
			analyticsModule.reportMomentsSurfaceLoadAbort(var19)
		end
		timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
		var5 = nil
	end,
	abort = function(p1) --[[ line: 37 ]]
		-- upvalues: timeToInteractiveTracker (ref), analyticsModule (ref), var5 (write)
		local events = timeToInteractiveTracker.getEvents()
		
		if not (events ~= nil and events.Watch_MomentsFeed ~= nil) then return end
		if p1 ~= nil then
			analyticsModule.reportMomentsSurfaceLoadAbort(p1)
		end
		timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
		var5 = nil
	end
}