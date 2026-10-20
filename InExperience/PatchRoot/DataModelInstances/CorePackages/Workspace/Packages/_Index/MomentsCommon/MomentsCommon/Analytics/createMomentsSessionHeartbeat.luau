local ReportMomentsRealtimeEventModule = require(script.Parent.reportMomentsRealtimeEvent)
local config = {
	schedule = function(Delay, Tick)
		return task.delay(Delay, Tick)
	end,
	cancel = function(ScheduleResult)
		task.cancel(ScheduleResult)
	end
}

return function(p1, p2, p3)
	-- upvalues: ReportMomentsRealtimeEventModule (copy), config (copy)
	local P2 = p1 or 60
	local Callback = p2 or ReportMomentsRealtimeEventModule.reportMomentsSessionHeartbeat
	local P4 = p3 or config
	local ScheduleResult = nil
	local v1 = nil
	
	local function tick()
		-- upvalues: v1 (ref), Callback (copy), ScheduleResult (ref), P4 (copy), P2 (copy), tick (copy)
		if v1 ~= nil then
			Callback(v1)
			ScheduleResult = P4.schedule(P2, tick)
			
			return
		end
	end
	
	return {
		start = function(p4)
			-- upvalues: ScheduleResult (ref), P4 (copy), v1 (ref), P2 (copy), tick (copy)
			if ScheduleResult ~= nil then
				P4.cancel(ScheduleResult)
				ScheduleResult = nil
			end
			v1 = nil
			v1 = p4
			ScheduleResult = P4.schedule(P2, tick)
		end,
		stop = function()
			-- upvalues: ScheduleResult (ref), P4 (copy), v1 (ref)
			if ScheduleResult ~= nil then
				P4.cancel(ScheduleResult)
				ScheduleResult = nil
			end
			v1 = nil
		end
	}
end