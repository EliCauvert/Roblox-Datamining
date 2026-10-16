local Parent = script:FindFirstAncestor("SquadsCore").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

local function defaultSchedule(Delay, p1) --[[ Line: 39 ]]
	local DelayedThread = task.delay(Delay, p1)
	
	return function() --[[ Line: 41 ]]
		-- upvalues: DelayedThread (copy)
		task.cancel(DelayedThread)
	end
end

return function(p1) --[[ Line: 46 ]]
	-- upvalues: defaultSchedule (copy), CreateSessionScopedSignalFunction (copy)
	local Schedule = p1 and p1.schedule or defaultSchedule
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
	local Callback: (() -> ())? = nil
	
	local function _() --[[ Line: 54 ]]
		-- upvalues: Callback (ref)
		if Callback then
			Callback()
			Callback = nil
		end
	end
	
	return {
		getBlockedSquadId = SessionScopedSignal,
		block = function(p2, p3: number) --[[ Line: 76 ]]
			-- upvalues: Callback (ref), SessionScopedSignal2 (copy), Schedule (copy)
			if Callback then
				Callback()
				Callback = nil
			end
			if p3 <= 0 then
				SessionScopedSignal2(nil)
				
				return
			else
				SessionScopedSignal2(p2)
				Callback = Schedule(p3, function() --[[ Line: 85 ]]
					-- upvalues: Callback (upval), SessionScopedSignal2 (upval)
					Callback = nil
					SessionScopedSignal2(nil)
				end)
			end
		end,
		unblock = function(p2) --[[ Line: 64 ]]
			-- upvalues: SessionScopedSignal (copy), Callback (ref), SessionScopedSignal2 (copy)
			if p2 ~= nil and SessionScopedSignal(false) ~= p2 then return end
			if Callback then
				Callback()
				Callback = nil
			end
			SessionScopedSignal2(nil)
		end
	}
end