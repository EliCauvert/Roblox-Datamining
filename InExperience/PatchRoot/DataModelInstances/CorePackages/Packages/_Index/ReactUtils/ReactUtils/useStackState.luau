local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local LUAU_ANALYZE_ERROR = reactUtils.LUAU_ANALYZE_ERROR

return function(p0) --[[ line: 9 | named "useStackState" ]]
	-- upvalues: reactModule (ref), LUAU_ANALYZE_ERROR (ref)
	local var2 = reactModule.useRef(p0 or {})
	assert(var2.current ~= nil, LUAU_ANALYZE_ERROR)
	local var3, var4 = reactModule.useState(#var2.current)
	
	return {
		push = reactModule.useCallback(function(p1) --[[ line: 21 ]]
			-- upvalues: var2 (ref), var4 (ref)
			table.insert(var2.current, p1)
			var4(#var2.current)
		end, {}),
		pop = reactModule.useCallback(function() --[[ line: 26 ]]
			-- upvalues: var2 (ref), var4 (ref)
			local removed = table.remove(var2.current)
			var4(#var2.current)
			
			return removed
		end, {}),
		getTop = reactModule.useCallback(function() --[[ line: 32 ]]
			-- upvalues: var2 (ref)
			return var2.current[#var2.current]
		end, {}),
		clear = reactModule.useCallback(function() --[[ line: 36 ]]
			-- upvalues: var2 (ref), var4 (ref)
			table.clear(var2.current)
			var4(0)
		end, {}),
		size = var3
	}
end