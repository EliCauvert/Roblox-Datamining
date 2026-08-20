local parent = script:FindFirstAncestor("SquadsCore").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

local function defaultSchedule(p0, p1) --[[ line: 39 ]]
	local delayedThread = task.delay(p0, p1)
	
	return function() --[[ line: 41 ]]
		-- upvalues: delayedThread (ref)
		task.cancel(delayedThread)
	end
end

return function(p2) --[[ line: 46 ]]
	-- upvalues: defaultSchedule (ref), createSessionScopedSignal (ref)
	local var2 = if p2 then p2.schedule else defaultSchedule
	local var3, var4 = createSessionScopedSignal(nil)
	local var5 = nil
	
	local _ = function() --[[ line: 54 ]]
		-- upvalues: var5 (write)
		if var5 then
			var5()
			var5 = nil
		end
	end
	
	return {
		getBlockedSquadId = var3,
		block = function(p3, p4) --[[ line: 76 ]]
			-- upvalues: var5 (write), var4 (ref), var2 (ref)
			if var5 then
				var5()
				var5 = nil
			end
			if p4 <= 0 then
				var4(nil)
				
				return
			end
			var4(p3)
			var5 = var2(p4, function() --[[ line: 85 ]]
				-- upvalues: var5 (copy), var4 (copy)
				var5 = nil
				var4(nil)
			end)
		end,
		unblock = function(p5) --[[ line: 64 ]]
			-- upvalues: var3 (ref), var5 (write), var4 (ref)
			if p5 ~= nil and var3(false) ~= p5 then return end
			if var5 then
				var5()
				var5 = nil
			end
			var4(nil)
		end
	}
end