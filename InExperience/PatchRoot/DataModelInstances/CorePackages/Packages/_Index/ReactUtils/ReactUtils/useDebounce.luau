local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1, Delay)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy), Delay (copy)
		local function updateValue()
			-- upvalues: UseStateResult2 (upval), p1 (upval)
			UseStateResult2(p1)
		end
		
		if Delay == nil or Delay == 0 then
			UseStateResult2(p1)
			
			return
		end
		local DelayedThread = task.delay(Delay, updateValue)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { p1, Delay })
	
	return UseStateResult
end