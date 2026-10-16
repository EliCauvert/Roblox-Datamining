local ReportMomentsRealtimeEventModule = require(script.Parent.reportMomentsRealtimeEvent)
local config = {
	schedule = function(Delay, Tick) --[[ Line: 32 ]]
		return task.delay(Delay, Tick)
	end,
	cancel = function(ScheduleResult) --[[ Line: 35 ]]
		task.cancel(ScheduleResult)
	end
}

return function(p1, p2, p3) --[[ Line: 40 | Named "createMomentsSessionHeartbeat" ]]
	-- upvalues: ReportMomentsRealtimeEventModule (copy), config (copy)
	local P2 = p1 or 60
	local Callback = p2 or ReportMomentsRealtimeEventModule.reportMomentsSessionHeartbeat
	local P4 = p3 or config
	local ScheduleResult = nil
	local v1 = nil
	
	local function tick() --[[ Line: 54 ]]
		-- upvalues: v1 (ref), Callback (copy), ScheduleResult (ref), P4 (copy), P2 (copy), tick (copy)
		if v1 ~= nil then
			Callback(v1)
			ScheduleResult = P4.schedule(P2, tick)
			
			return
		end
	end
	
	return {
		start = function(p4) --[[ Line: 70 ]]
			-- upvalues: ScheduleResult (ref), P4 (copy), v1 (ref), P2 (copy), tick (copy)
			if ScheduleResult ~= nil then
				P4.cancel(ScheduleResult)
				ScheduleResult = nil
			end
			v1 = nil
			v1 = p4
			ScheduleResult = P4.schedule(P2, tick)
		end,
		stop = function() --[[ Line: 62 ]]
			-- upvalues: ScheduleResult (ref), P4 (copy), v1 (ref)
			if ScheduleResult ~= nil then
				P4.cancel(ScheduleResult)
				ScheduleResult = nil
			end
			v1 = nil
		end
	}
end