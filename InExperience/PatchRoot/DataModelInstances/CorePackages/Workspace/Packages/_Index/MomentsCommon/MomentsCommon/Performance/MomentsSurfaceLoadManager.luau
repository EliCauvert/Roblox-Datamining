local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local AnalyticsModule = require(MomentsCommon.Analytics)
local _ = require(MomentsCommon.Enums.CaptureKind)
local EventNames = AnalyticsModule.EventNames
local FireAnalyticsEventFunction = AnalyticsModule.fireAnalyticsEvent
local FIntMomentsSurfaceLoadTTISamplingRate = SharedFlagsModule.FIntMomentsSurfaceLoadTTISamplingRate
local Count = 0
local ClockTime = nil

local function _(Count1)
	-- upvalues: SharedFlagsModule (copy), Count (ref), TimeToInteractiveTracker (copy), AnalyticsModule (copy), ClockTime (ref)
	local FIntMomentsSurfaceLoadTTIMaxMs: number = SharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
	
	if FIntMomentsSurfaceLoadTTIMaxMs > 0 then
		task.delay(FIntMomentsSurfaceLoadTTIMaxMs / 1000, function()
			-- upvalues: Count1 (copy), Count (upval), TimeToInteractiveTracker (upval), AnalyticsModule (upval), ClockTime (upval)
			if Count1 == Count then
				local Events = TimeToInteractiveTracker.getEvents()
				
				if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
					local Events1 = TimeToInteractiveTracker.getEvents()
					
					if Events1 ~= nil and Events1.Watch_MomentsFeed ~= nil then
						AnalyticsModule.reportMomentsSurfaceLoadAbort("capped")
						TimeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
						ClockTime = nil
						
						return
					end
					return
				end
			end
		end)
		
		return
	end
end

return {
	EVENT_NAME = "Watch_MomentsFeed",
	start = function()
		-- upvalues: Count (ref), ClockTime (ref), TimeToInteractiveTracker (copy), SharedFlagsModule (copy), AnalyticsModule (copy)
		Count += 1
		ClockTime = os.clock()
		TimeToInteractiveTracker.trackStart("Watch_MomentsFeed", true)
		local Count1: number = Count
		local FIntMomentsSurfaceLoadTTIMaxMs: number = SharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
		
		if FIntMomentsSurfaceLoadTTIMaxMs > 0 then
			task.delay(FIntMomentsSurfaceLoadTTIMaxMs / 1000, function()
				-- upvalues: Count1 (copy), Count (upval), TimeToInteractiveTracker (upval), AnalyticsModule (upval), ClockTime (upval)
				if Count1 == Count then
					local Events = TimeToInteractiveTracker.getEvents()
					
					if Events ~= nil and Events.Watch_MomentsFeed ~= nil then
						local Events1 = TimeToInteractiveTracker.getEvents()
						
						if Events1 ~= nil and Events1.Watch_MomentsFeed ~= nil then
							AnalyticsModule.reportMomentsSurfaceLoadAbort("capped")
							TimeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
							ClockTime = nil
							
							return
						end
						return
					end
				end
			end)
			
			return
		end
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
	markSurfaceReady = function(Subcategory)
		-- upvalues: TimeToInteractiveTracker (copy), ClockTime (ref), SharedFlagsModule (copy), AnalyticsModule (copy), Milestone (copy), FIntMomentsSurfaceLoadTTISamplingRate (copy), FireAnalyticsEventFunction (copy), EventNames (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events == nil or Events.Watch_MomentsFeed == nil then return end
		local ScaledClockTime: number = if ClockTime == nil then 0 else (os.clock() - ClockTime) * 1000
		local FIntMomentsSurfaceLoadTTIMaxMs: number = SharedFlagsModule.FIntMomentsSurfaceLoadTTIMaxMs
		
		if FIntMomentsSurfaceLoadTTIMaxMs > 0 and FIntMomentsSurfaceLoadTTIMaxMs < ScaledClockTime then
			local Events1 = TimeToInteractiveTracker.getEvents()
			
			if Events1 ~= nil and Events1.Watch_MomentsFeed ~= nil then
				AnalyticsModule.reportMomentsSurfaceLoadAbort("capped")
				TimeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
				ClockTime = nil
				
				return
			end
			return
		else
			if Subcategory ~= nil then
				TimeToInteractiveTracker.updateMetadata("Watch_MomentsFeed", { subcategory = Subcategory })
			end
			TimeToInteractiveTracker.trackMilestone("Watch_MomentsFeed", Milestone.SurfaceReady)
			TimeToInteractiveTracker.trackEnd("Watch_MomentsFeed", {
				samplingRateOverride = FIntMomentsSurfaceLoadTTISamplingRate
			})
			FireAnalyticsEventFunction(EventNames.MomentsFirstContentLoadedTimestamp, { value = ScaledClockTime })
			ClockTime = nil
		end
	end,
	abort = function(p1)
		-- upvalues: TimeToInteractiveTracker (copy), AnalyticsModule (copy), ClockTime (ref)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events == nil or Events.Watch_MomentsFeed == nil then return end
		if p1 ~= nil then
			AnalyticsModule.reportMomentsSurfaceLoadAbort(p1)
		end
		TimeToInteractiveTracker.destroyEvent("Watch_MomentsFeed")
		ClockTime = nil
	end
}