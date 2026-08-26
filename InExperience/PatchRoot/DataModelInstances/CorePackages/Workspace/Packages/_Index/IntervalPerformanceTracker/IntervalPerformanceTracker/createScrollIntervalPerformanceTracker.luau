local scrollIntervalTrackerModule = require(script:FindFirstAncestor("IntervalPerformanceTracker").Parent.ScrollIntervalTracker)
local intervalPerformanceTrackerModule = require(script.Parent.IntervalPerformanceTracker)
local list = {
	"duration", "averageFPS", "framesCount", "longestFrameTime", "frameTimeAvgMs",
	"frameTimeStdDevMs", "frameTimeDistributionMs", "frameBuckets",
	"rawFrameTimesMs"
}

return function(p1, p2, p3, p4)
	-- upvalues: list (ref), intervalPerformanceTrackerModule (ref), scrollIntervalTrackerModule (ref)
	local var1 = if p4 and p4.metricsToTrack then p4.metricsToTrack else list
	local var2 = if p4 and p4.countersEnabled ~= nil then p4.countersEnabled else true
	local var3 = if p4 and p4.eventStreamEnabled ~= nil then p4.eventStreamEnabled else true
	local var4 = if p4 then p4.scrollOptions else nil
	local var5 = if p4 and p4.trackScrollType ~= nil then p4.trackScrollType else true
	local var6 = if p4 then p4.extraFields else nil
	local var7 = false
	
	local function _()
		-- upvalues: var7 (write), var5 (ref), var6 (ref)
		local var8 = if var7 then "warm" else "cold"
		
		if not var5 then
			return var6
		end
		local t = {}
		
		if var6 then
			for i, v in var6 do
				t[i] = v
			end
		end
		t.scroll_type = var8
		
		return t
	end
	
	return scrollIntervalTrackerModule.createScrollIntervalTracker(function(_)
		-- upvalues: intervalPerformanceTrackerModule (copy), p1 (ref), var1 (ref), var2 (ref), var3 (ref), var7 (write), var5 (ref), var6 (ref)
		local var9
		local var10 = nil
		local var11 = if var7 then "warm" else "cold"
		
		if var5 then
			local t = {}
			
			if var6 then
				for i, v in var6 do
					t[i] = v
				end
			end
			t.scroll_type = var11
			var9 = t
		else
			var9 = var6
		end
		intervalPerformanceTrackerModule:startTracking(p1, var10, var1, var2, var3, var9)
		var7 = true
		
		return true
	end, function(_)
		-- upvalues: intervalPerformanceTrackerModule (copy), p1 (ref)
		intervalPerformanceTrackerModule:stopAndLogTracking(p1)
	end, p2, p3, var4)
end