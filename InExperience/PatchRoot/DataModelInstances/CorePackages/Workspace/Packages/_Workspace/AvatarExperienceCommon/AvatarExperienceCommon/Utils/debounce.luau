return function(Callback, p1) --[[ Line: 1 ]]
	local DelayedThread = nil
	local Delay = p1 or 0.5
	
	return function(...) --[[ Line: 5 ]]
		-- upvalues: DelayedThread (ref), Delay (copy), Callback (copy)
		local list = { ... }
		
		if DelayedThread then
			task.cancel(DelayedThread)
		end
		DelayedThread = task.delay(Delay, function() --[[ Line: 12 ]]
			-- upvalues: Callback (upval), list (copy), DelayedThread (upval)
			Callback(unpack(list))
			DelayedThread = nil
		end)
	end
end