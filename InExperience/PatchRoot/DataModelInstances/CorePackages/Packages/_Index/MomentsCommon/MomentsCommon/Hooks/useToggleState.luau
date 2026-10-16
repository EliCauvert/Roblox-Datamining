local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)

return function(p1) --[[ Line: 14 | Named "useToggleState" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1 or false)
	
	return {
		enabled = UseStateResult,
		enable = ReactModule.useCallback(function() --[[ Line: 17 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end, {}),
		disable = ReactModule.useCallback(function() --[[ Line: 21 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {}),
		toggle = ReactModule.useCallback(function() --[[ Line: 25 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p2): boolean --[[ Line: 26 ]]
				return not p2
			end)
		end, {}),
		set = UseStateResult2
	}
end