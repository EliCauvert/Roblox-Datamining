local reactModule = require(script:FindFirstAncestor("TiltLoadingScreen").Parent.Parent.React)

return function(value)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2(false)
		local delayedThread = task.delay(0.1, function()
			-- upvalues: var2 (copy)
			var2(true)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			pcall(task.cancel, delayedThread)
		end
	end, { value.X, value.Y })
	
	return var1
end