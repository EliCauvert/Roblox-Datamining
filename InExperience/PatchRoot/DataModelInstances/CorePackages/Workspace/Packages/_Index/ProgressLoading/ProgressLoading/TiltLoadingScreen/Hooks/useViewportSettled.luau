local reactModule = require(script:FindFirstAncestor("TiltLoadingScreen").Parent.Parent.React)

return function(value) --[[ line: 9 | named "useViewportSettled" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 12 ]]
		-- upvalues: var2 (ref)
		var2(false)
		local delayedThread = task.delay(0.1, function() --[[ line: 14 ]]
			-- upvalues: var2 (copy)
			var2(true)
		end)
		
		return function() --[[ line: 17 ]]
			-- upvalues: delayedThread (ref)
			pcall(task.cancel, delayedThread)
		end
	end, { value.X, value.Y })
	
	return var1
end