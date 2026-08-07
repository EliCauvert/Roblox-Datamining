local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local milestone = timeToInteractiveTracker.Milestone
local analyticsModule = require(momentsCommon.Analytics)
local eventNames = analyticsModule.EventNames
local fireAnalyticsEvent = analyticsModule.fireAnalyticsEvent
local fIntMomentsSurfaceLoadTTISamplingRate = sharedFlagsModule.FIntMomentsSurfaceLoadTTISamplingRate
local var3 = 0
local var4 = nil

return {
	EVENT_NAME = "Watch_MomentsFeed",
	start = function() --[[ line: 39 ]]
		-- upvalues: var3 (write), var4 (write), timeToInteractiveTracker (ref)
		var3 += 1
		var4 = os.clock()
		timeToInteractiveTracker.trackStart("Watch_MomentsFeed", true)
	end,
	isSessionActive = function() --[[ line: 24 ]]
		-- upvalues: timeToInteractiveTracker (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		return events ~= nil and events.Watch_MomentsFeed ~= nil
	end,
	getSessionGeneration = function() --[[ line: 47 ]]
		-- upvalues: var3 (write)
		return var3
	end,
	elapsedMs = function() --[[ line: 29 ]]
		-- upvalues: var4 (write)
		return if var4 == nil then 0 else (os.clock() - var4) * 1000
	end,
	renderStarted = function() --[[ line: 53 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.RenderStarted)
			
			return
		end
	end,
	surfaceMounted = function() --[[ line: 60 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.SurfaceMounted)
			
			return
		end
	end,
	primaryDataStarted = function() --[[ line: 67 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name)
			
			return
		end
	end,
	primaryDataNetworkFetch = function() --[[ line: 74 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackSubphase("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name, milestone.PrimaryDataStarted.Subphase.NetworkFetch)
			
			return
		end
	end,
	primaryDataResponseReceived = function() --[[ line: 85 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackSubphase("Watch_MomentsFeed", milestone.PrimaryDataStarted.Name, milestone.PrimaryDataStarted.Subphase.ResponseReceived)
			
			return
		end
	end,
	primaryDataReady = function() --[[ line: 96 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.PrimaryDataReady.Name)
			
			return
		end
	end,
	markSurfaceReady = function() --[[ line: 103 ]]
		-- upvalues: timeToInteractiveTracker (ref), milestone (ref), fIntMomentsSurfaceLoadTTISamplingRate (ref), fireAnalyticsEvent (ref), eventNames (ref), var4 (write)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", milestone.SurfaceReady)
			timeToInteractiveTracker.trackEnd("Watch_MomentsFeed", {
				samplingRateOverride = fIntMomentsSurfaceLoadTTISamplingRate
			})
			fireAnalyticsEvent(eventNames.MomentsFirstContentLoadedTimestamp, {
				value = if var4 == nil then 0 else (os.clock() - var4) * 1000
			})
			var4 = nil
			
			return
		end
	end,
	abort = function() --[[ line: 119 ]]
		-- upvalues: timeToInteractiveTracker (ref), var4 (write)
		local events = timeToInteractiveTracker.getEvents()
		
		if events ~= nil and events.Watch_MomentsFeed ~= nil then
			timeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
			var4 = nil
			
			return
		end
	end
}