return function(Callback, p1: number) --[[ Line: 1 ]]
	local DelayedThread = nil
	local Delay = p1 / 1000
	
	return {
		cancel = function() --[[ Line: 5 ]]
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end,
		call = function(...) --[[ Line: 11 ]]
			-- upvalues: DelayedThread (ref), Delay (copy), Callback (copy)
			local list = { ... }
			DelayedThread = task.delay(Delay, function() --[[ Line: 13 ]]
				-- upvalues: Callback (upval), list (copy)
				Callback(unpack(list))
			end)
		end
	}
end