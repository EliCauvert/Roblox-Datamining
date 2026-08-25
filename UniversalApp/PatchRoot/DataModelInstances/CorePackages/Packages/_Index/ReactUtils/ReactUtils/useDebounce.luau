local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p0)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), p0 (ref), p1 (ref)
		local function updateValue()
			-- upvalues: var2 (copy), p0 (copy)
			var2(p0)
		end
		
		if p1 == nil or p1 == 0 then
			var2(p0)
			
			return
		end
		local delayedThread = task.delay(p1, updateValue)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p0, p1 })
	
	return var1
end