local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1 or false)
	
	return {
		enabled = UseStateResult,
		enable = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end, {}),
		disable = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {}),
		toggle = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p2): boolean
				return not p2
			end)
		end, {}),
		set = UseStateResult2
	}
end