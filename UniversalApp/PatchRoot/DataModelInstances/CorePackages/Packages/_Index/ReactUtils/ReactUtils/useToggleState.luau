local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(value) --[[ line: 7 | named "useToggleState" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(value or false)
	
	return {
		enabled = var1,
		enable = reactModule.useCallback(function() --[[ line: 16 ]]
			-- upvalues: var2 (ref)
			var2(true)
		end, {}),
		disable = reactModule.useCallback(function() --[[ line: 20 ]]
			-- upvalues: var2 (ref)
			var2(false)
		end, {}),
		toggle = reactModule.useCallback(function() --[[ line: 24 ]]
			-- upvalues: var2 (ref)
			var2(function(p0) --[[ line: 25 ]]
				return not p0
			end)
		end, {}),
		set = var2
	}
end