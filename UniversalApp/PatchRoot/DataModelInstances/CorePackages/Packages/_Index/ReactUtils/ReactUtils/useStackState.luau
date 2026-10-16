local ReactUtils = script:FindFirstAncestor("ReactUtils")
local ReactModule = require(ReactUtils.Parent.React)
local LUAUANALYZEERRORModule = require(ReactUtils.LUAU_ANALYZE_ERROR)

return function(p1) --[[ Line: 9 | Named "useStackState" ]]
	-- upvalues: ReactModule (copy), LUAUANALYZEERRORModule (copy)
	local UseRefResult = ReactModule.useRef(p1 or {})
	assert(UseRefResult.current ~= nil, LUAUANALYZEERRORModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(#UseRefResult.current)
	
	return {
		push = ReactModule.useCallback(function(p2) --[[ Line: 21 ]]
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
			table.insert(UseRefResult.current, p2)
			UseStateResult2(#UseRefResult.current)
		end, {}),
		pop = ReactModule.useCallback(function() --[[ Line: 26 ]]
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
			local Removed = table.remove(UseRefResult.current)
			UseStateResult2(#UseRefResult.current)
			
			return Removed
		end, {}),
		getTop = ReactModule.useCallback(function() --[[ Line: 32 ]]
			-- upvalues: UseRefResult (copy)
			return UseRefResult.current[#UseRefResult.current]
		end, {}),
		clear = ReactModule.useCallback(function() --[[ Line: 36 ]]
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
			table.clear(UseRefResult.current)
			UseStateResult2(0)
		end, {}),
		size = UseStateResult
	}
end