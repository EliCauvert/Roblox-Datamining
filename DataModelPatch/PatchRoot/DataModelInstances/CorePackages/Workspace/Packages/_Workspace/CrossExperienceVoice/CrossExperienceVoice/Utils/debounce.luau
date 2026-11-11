return function(Callback, p1: number)
	local DelayedThread = nil
	local Delay = p1 / 1000
	
	return {
		cancel = function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end,
		call = function(...)
			-- upvalues: DelayedThread (ref), Delay (copy), Callback (copy)
			local list = { ... }
			DelayedThread = task.delay(Delay, function()
				-- upvalues: Callback (upval), list (copy)
				Callback(unpack(list))
			end)
		end
	}
end