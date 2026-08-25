local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p0, p1)
	-- upvalues: useTokens (ref), reactModule (ref)
	p1 = p1 or useTokens().Time.Time_300
	local var2, var3 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref)
		local var4 = false
		task.delay(p1, function()
			-- upvalues: var4 (write), var3 (copy)
			if not var4 then
				var3(false)
			end
		end)
		
		return function()
			-- upvalues: var4 (write)
			var4 = true
		end
	end, { p1 })
	
	return p0 or var2
end