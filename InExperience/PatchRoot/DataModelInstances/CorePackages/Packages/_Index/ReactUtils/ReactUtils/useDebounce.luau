local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p1)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), p1 (ref), p2 (ref)
		local function updateValue()
			-- upvalues: var2 (copy), p1 (copy)
			var2(p1)
		end
		
		if p2 == nil or p2 == 0 then
			var2(p1)
			
			return
		end
		local delayedThread = task.delay(p2, updateValue)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p1, p2 })
	
	return var1
end