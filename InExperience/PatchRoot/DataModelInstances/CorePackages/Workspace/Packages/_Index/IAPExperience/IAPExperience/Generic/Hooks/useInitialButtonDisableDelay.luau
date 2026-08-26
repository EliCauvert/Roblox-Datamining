local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref)
	p2 = p2 or useTokens().Time.Time_300
	local var1, var2 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var2 (ref)
		local var3 = false
		task.delay(p2, function()
			-- upvalues: var3 (write), var2 (copy)
			if not var3 then
				var2(false)
			end
		end)
		
		return function()
			-- upvalues: var3 (write)
			var3 = true
		end
	end, { p2 })
	
	return p1 or var1
end