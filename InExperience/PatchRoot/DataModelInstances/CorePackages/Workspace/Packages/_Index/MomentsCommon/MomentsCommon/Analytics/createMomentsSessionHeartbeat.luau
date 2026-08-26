local reportMomentsRealtimeEventModule = require(script.Parent.reportMomentsRealtimeEvent)
local t = {
	schedule = function(p1, p2)
		return task.delay(p1, p2)
	end,
	cancel = function(p1)
		task.cancel(p1)
	end
}

return function(p1, p2, p3)
	-- upvalues: reportMomentsRealtimeEventModule (ref), t (ref)
	p1 = p1 or 60
	p2 = p2 or reportMomentsRealtimeEventModule.reportMomentsSessionHeartbeat
	p3 = p3 or t
	local var1 = nil
	local var2 = nil
	
	local function tick()
		-- upvalues: var2 (write), p2 (ref), var1 (write), p3 (ref), p1 (ref), tick (ref)
		if var2 == nil then
			return
		end
		p2(var2)
		var1 = p3.schedule(p1, tick)
	end
	
	return {
		start = function(p4)
			-- upvalues: var1 (write), p3 (ref), var2 (write), p1 (ref), tick (ref)
			if var1 ~= nil then
				p3.cancel(var1)
				var1 = nil
			end
			var2 = nil
			var2 = p4
			var1 = p3.schedule(p1, tick)
		end,
		stop = function()
			-- upvalues: var1 (write), p3 (ref), var2 (write)
			if var1 ~= nil then
				p3.cancel(var1)
				var1 = nil
			end
			var2 = nil
		end
	}
end