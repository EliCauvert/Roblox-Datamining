local scrollIntervalTrackerModule = require(script:FindFirstAncestor("IntervalPerformanceTracker").Parent.ScrollIntervalTracker)
local intervalPerformanceTrackerModule = require(script.Parent.IntervalPerformanceTracker)
local list = {
	"duration", "averageFPS", "framesCount", "longestFrameTime", "frameTimeAvgMs",
	"frameTimeStdDevMs", "frameTimeDistributionMs", "frameBuckets",
	"rawFrameTimesMs"
}

return function(p0, p1, p2, p3)
	-- upvalues: list (ref), intervalPerformanceTrackerModule (ref), scrollIntervalTrackerModule (ref)
	local var3 = if p3 and p3.metricsToTrack then p3.metricsToTrack else list
	local var4 = if p3 and p3.countersEnabled ~= nil then p3.countersEnabled else true
	local var5 = if p3 and p3.eventStreamEnabled ~= nil then p3.eventStreamEnabled else true
	local var6 = if p3 then p3.scrollOptions else nil
	local var7 = if p3 and p3.trackScrollType ~= nil then p3.trackScrollType else true
	local var8 = if p3 then p3.extraFields else nil
	local var9 = false
	
	local function _()
		-- upvalues: var9 (write), var7 (ref), var8 (ref)
		local var10 = if var9 then "warm" else "cold"
		
		if not var7 then
			return var8
		end
		local t = {}
		
		if var8 then
			for i, v in var8 do
				t[i] = v
			end
		end
		t.scroll_type = var10
		
		return t
	end
	
	return scrollIntervalTrackerModule.createScrollIntervalTracker(function(_)
		-- upvalues: intervalPerformanceTrackerModule (copy), p0 (ref), var3 (ref), var4 (ref), var5 (ref), var9 (write), var7 (ref), var8 (ref)
		local var14
		local var12 = nil
		local var13 = if var9 then "warm" else "cold"
		
		if var7 then
			local t = {}
			
			if var8 then
				for i, v in var8 do
					t[i] = v
				end
			end
			t.scroll_type = var13
			var14 = t
		else
			var14 = var8
		end
		intervalPerformanceTrackerModule:startTracking(p0, var12, var3, var4, var5, var14)
		var9 = true
		
		return true
	end, function(_)
		-- upvalues: intervalPerformanceTrackerModule (copy), p0 (ref)
		intervalPerformanceTrackerModule:stopAndLogTracking(p0)
	end, p1, p2, var6)
end