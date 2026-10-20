local Parent = script:FindFirstAncestor("SquadsCore").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

local function defaultSchedule(Delay, p1)
	local DelayedThread = task.delay(Delay, p1)
	
	return function()
		-- upvalues: DelayedThread (copy)
		task.cancel(DelayedThread)
	end
end

return function(p1)
	-- upvalues: defaultSchedule (copy), CreateSessionScopedSignalFunction (copy)
	local Schedule = p1 and p1.schedule or defaultSchedule
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
	local Callback: (() -> ())? = nil
	
	local function _()
		-- upvalues: Callback (ref)
		if Callback then
			Callback()
			Callback = nil
		end
	end
	
	return {
		getBlockedSquadId = SessionScopedSignal,
		block = function(p2, p3: number)
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
				Callback = Schedule(p3, function()
					-- upvalues: Callback (upval), SessionScopedSignal2 (upval)
					Callback = nil
					SessionScopedSignal2(nil)
				end)
			end
		end,
		unblock = function(p2)
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