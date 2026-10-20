return function(Callback, p1)
	local DelayedThread = nil
	local Delay = p1 or 0.5
	
	return function(...)
		-- upvalues: DelayedThread (ref), Delay (copy), Callback (copy)
		local list = { ... }
		
		if DelayedThread then
			task.cancel(DelayedThread)
		end
		DelayedThread = task.delay(Delay, function()
			-- upvalues: Callback (upval), list (copy), DelayedThread (upval)
			Callback(unpack(list))
			DelayedThread = nil
		end)
	end
end