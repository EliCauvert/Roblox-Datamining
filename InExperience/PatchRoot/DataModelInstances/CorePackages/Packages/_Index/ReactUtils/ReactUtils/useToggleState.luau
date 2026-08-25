local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(value)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(value or false)
	
	return {
		enabled = var1,
		enable = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(true)
		end, {}),
		disable = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(false)
		end, {}),
		toggle = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(function(p0)
				return not p0
			end)
		end, {}),
		set = var2
	}
end