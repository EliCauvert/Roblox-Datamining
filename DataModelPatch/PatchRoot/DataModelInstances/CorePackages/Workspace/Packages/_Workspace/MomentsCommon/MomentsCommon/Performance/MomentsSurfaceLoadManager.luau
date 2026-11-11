local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local AnalyticsModule = require(MomentsCommon.Analytics)
local EventNames = AnalyticsModule.EventNames
local FireAnalyticsEventFunction = AnalyticsModule.fireAnalyticsEvent
local FIntMomentsSurfaceLoadTTISamplingRate = require(Parent.SharedFlags).FIntMomentsSurfaceLoadTTISamplingRate
local Count = 0
local ClockTime = nil

return {
	EVENT_NAME = "Watch_MomentsFeed",
	start = function()
		-- upvalues: Count (ref), ClockTime (ref), TimeToInteractiveTracker (copy)
		Count += 1
		ClockTime = os.clock()
		TimeToInteractiveTracker.trackStart("Watch_MomentsFeed", true)
	end,
	isSessionActive = function(): boolean
		-- upvalues: TimeToInteractiveTracker (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		return Events ~= nil and Events.Watch_MomentsFeed ~= nil
	end,
	getSessionGeneration = function()
		-- upvalues: Count (ref)
		return Count
	end,
	elapsedMs = function(): number
		-- upvalues: ClockTime (ref)
		return if ClockTime == nil then 0 else (os.clock() - ClockTime) * 1000
	end,
	renderStarted = function()
		-- upvalues: TimeToInteractiveTracker (copy), Milestone (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
			TimeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", Milestone.RenderStarted)
			
			return
		end
	end,
	surfaceMounted = function()
		-- upvalues: TimeToInteractiveTracker (copy), Milestone (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
			TimeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", Milestone.SurfaceMounted)
			
			return
		end
	end,
	primaryDataStarted = function()
		-- upvalues: TimeToInteractiveTracker (copy), Milestone (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
			TimeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", Milestone.PrimaryDataStarted.Name)
			
			return
		end
	end,
	primaryDataNetworkFetch = function()
		-- upvalues: TimeToInteractiveTracker (copy), Milestone (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
			TimeToInteractiveTracker.trackSubphase("Watch_MomentsFeed", Milestone.PrimaryDataStarted.Name, Milestone.PrimaryDataStarted.Subphase.NetworkFetch)
			
			return
		end
	end,
	primaryDataResponseReceived = function()
		-- upvalues: TimeToInteractiveTracker (copy), Milestone (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
			TimeToInteractiveTracker.trackSubphase("Watch_MomentsFeed", Milestone.PrimaryDataStarted.Name, Milestone.PrimaryDataStarted.Subphase.ResponseReceived)
			
			return
		end
	end,
	primaryDataReady = function()
		-- upvalues: TimeToInteractiveTracker (copy), Milestone (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
			TimeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", Milestone.PrimaryDataReady.Name)
			
			return
		end
	end,
	markSurfaceReady = function()
		-- upvalues: TimeToInteractiveTracker (copy), Milestone (copy), FIntMomentsSurfaceLoadTTISamplingRate (copy), FireAnalyticsEventFunction (copy), EventNames (copy), ClockTime (ref)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
			TimeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", Milestone.SurfaceReady)
			TimeToInteractiveTracker.trackEnd("Watch_MomentsFeed", {
				samplingRateOverride = FIntMomentsSurfaceLoadTTISamplingRate
			})
			FireAnalyticsEventFunction(EventNames.MomentsFirstContentLoadedTimestamp, {
				value = if ClockTime == nil then 0 else (os.clock() - ClockTime) * 1000
			})
			ClockTime = nil
			
			return
		end
	end,
	abort = function()
		-- upvalues: TimeToInteractiveTracker (copy), ClockTime (ref)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
			TimeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
			ClockTime = nil
			
			return
		end
	end
}