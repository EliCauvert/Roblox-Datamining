local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1) --[[ Line: 7 | Named "useToggleState" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1 or false)
	
	return {
		enabled = UseStateResult,
		enable = ReactModule.useCallback(function() --[[ Line: 16 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end, {}),
		disable = ReactModule.useCallback(function() --[[ Line: 20 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {}),
		toggle = ReactModule.useCallback(function() --[[ Line: 24 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p2): boolean --[[ Line: 25 ]]
				return not p2
			end)
		end, {}),
		set = UseStateResult2
	}
end