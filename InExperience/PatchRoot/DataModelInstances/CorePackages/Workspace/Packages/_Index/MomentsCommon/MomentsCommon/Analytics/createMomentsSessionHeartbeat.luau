local reportMomentsRealtimeEventModule = require(script.Parent.reportMomentsRealtimeEvent)
local t = {
	schedule = function(p0, p1)
		return task.delay(p0, p1)
	end,
	cancel = function(p2)
		task.cancel(p2)
	end
}

return function(p3, p4, p5)
	-- upvalues: reportMomentsRealtimeEventModule (ref), t (ref)
	p3 = p3 or 60
	p4 = p4 or reportMomentsRealtimeEventModule.reportMomentsSessionHeartbeat
	p5 = p5 or t
	local var5 = nil
	local var6 = nil
	
	local function tick()
		-- upvalues: var6 (write), p4 (ref), var5 (write), p5 (ref), p3 (ref), tick (ref)
		if var6 == nil then
			return
		end
		p4(var6)
		var5 = p5.schedule(p3, tick)
	end
	
	return {
		start = function(p6)
			-- upvalues: var5 (write), p5 (ref), var6 (write), p3 (ref), tick (ref)
			if var5 ~= nil then
				p5.cancel(var5)
				var5 = nil
			end
			var6 = nil
			var6 = p6
			var5 = p5.schedule(p3, tick)
		end,
		stop = function()
			-- upvalues: var5 (write), p5 (ref), var6 (write)
			if var5 ~= nil then
				p5.cancel(var5)
				var5 = nil
			end
			var6 = nil
		end
	}
end