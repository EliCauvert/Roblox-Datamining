local parent = script:FindFirstAncestor("SquadsCore").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

local function defaultSchedule(p1, p2)
	local delayedThread = task.delay(p1, p2)
	
	return function()
		-- upvalues: delayedThread (ref)
		task.cancel(delayedThread)
	end
end

return function(p1)
	-- upvalues: defaultSchedule (ref), createSessionScopedSignal (ref)
	local var1 = if p1 then p1.schedule else defaultSchedule
	local var2, var3 = createSessionScopedSignal(nil)
	local var4 = nil
	
	local _ = function()
		-- upvalues: var4 (write)
		if var4 then
			var4()
			var4 = nil
		end
	end
	
	return {
		getBlockedSquadId = var2,
		block = function(p2, p3)
			-- upvalues: var4 (write), var3 (ref), var1 (ref)
			if var4 then
				var4()
				var4 = nil
			end
			if p3 <= 0 then
				var3(nil)
				
				return
			end
			var3(p2)
			var4 = var1(p3, function()
				-- upvalues: var4 (copy), var3 (copy)
				var4 = nil
				var3(nil)
			end)
		end,
		unblock = function(p2)
			-- upvalues: var2 (ref), var4 (write), var3 (ref)
			if p2 ~= nil and var2(false) ~= p2 then return end
			if var4 then
				var4()
				var4 = nil
			end
			var3(nil)
		end
	}
end