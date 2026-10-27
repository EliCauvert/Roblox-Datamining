local ScrollIntervalTrackerModule = require(script:FindFirstAncestor("IntervalPerformanceTracker").Parent.ScrollIntervalTracker)
local IntervalPerformanceTrackerModule = require(script.Parent.IntervalPerformanceTracker)
local IntervalPerformanceTrackerPerIntervalSampleRate = game:DefineFastFlag("IntervalPerformanceTrackerPerIntervalSampleRate", false)
game:DefineFastInt("ScrollIntervalPerformanceTrackerSampleRate", 1000)
local list = {
	"duration", "averageFPS", "framesCount", "longestFrameTime", "frameTimeAvgMs",
	"frameTimeStdDevMs", "frameTimeDistributionMs", "frameBuckets",
	"rawFrameTimesMs", "rawScrollPositionSamplesCsv"
}

return function(p1, p2, p3, p4)
	-- upvalues: list (copy), IntervalPerformanceTrackerModule (copy), IntervalPerformanceTrackerPerIntervalSampleRate (copy), ScrollIntervalTrackerModule (copy)
	local MetricsToTrack = if p4 and p4.metricsToTrack then p4.metricsToTrack else list
	local NoP3 = not p4 or p4.countersEnabled == nil or p4.countersEnabled
	local NoP3_1 = not p4 or p4.eventStreamEnabled == nil or p4.eventStreamEnabled
	local NoP3_2 = not p4 or p4.trackScrollType == nil or p4.trackScrollType
	local ExtraFields = if p4 then p4.extraFields else nil
	local Flag = false
	
	local function _()
		-- upvalues: Flag (ref), NoP3_2 (copy), ExtraFields (copy)
		local Warm: string = if Flag then "warm" else "cold"
		
		if not NoP3_2 then
			return ExtraFields
		end
		local t = {}
		
		if ExtraFields then
			for i, extraField in ExtraFields do
				t[i] = extraField
			end
		end
		t.scroll_type = Warm
		
		return t
	end
	
	return ScrollIntervalTrackerModule.createScrollIntervalTracker(function(_): boolean
		-- upvalues: IntervalPerformanceTrackerModule (upval), p1 (copy), MetricsToTrack (copy), NoP3 (copy), NoP3_1 (copy), Flag (ref), NoP3_2 (copy), ExtraFields (copy), p2 (copy), IntervalPerformanceTrackerPerIntervalSampleRate (upval)
		local v1 = nil
		local Warm: string = if Flag then "warm" else "cold"
		local ExtraFields1 = nil
		
		if NoP3_2 then
			local t = {}
			
			if ExtraFields then
				for i, extraField in ExtraFields do
					t[i] = extraField
				end
			end
			t.scroll_type = Warm
			ExtraFields1 = t
		else
			ExtraFields1 = ExtraFields
		end
		IntervalPerformanceTrackerModule:startTracking(p1, v1, MetricsToTrack, NoP3, NoP3_1, ExtraFields1, p2, if IntervalPerformanceTrackerPerIntervalSampleRate then game:GetFastInt("ScrollIntervalPerformanceTrackerSampleRate") else nil)
		Flag = true
		
		return true
	end, function(_)
		-- upvalues: IntervalPerformanceTrackerModule (upval), p1 (copy)
		IntervalPerformanceTrackerModule:stopAndLogTracking(p1)
	end, p2, p3, if p4 then p4.scrollOptions else nil)
end