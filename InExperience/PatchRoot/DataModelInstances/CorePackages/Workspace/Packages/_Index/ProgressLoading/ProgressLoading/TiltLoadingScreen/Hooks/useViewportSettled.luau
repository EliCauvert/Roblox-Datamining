local ReactModule = require(script:FindFirstAncestor("TiltLoadingScreen").Parent.Parent.React)

return function(Vector)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
		local DelayedThread = task.delay(0.1, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			pcall(task.cancel, DelayedThread)
		end
	end, { Vector.X, Vector.Y })
	
	return UseStateResult
end