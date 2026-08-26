local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local LUAU_ANALYZE_ERRORModule = require(reactUtils.LUAU_ANALYZE_ERROR)

return function(p1)
	-- upvalues: reactModule (ref), LUAU_ANALYZE_ERRORModule (ref)
	local var1 = reactModule.useRef(p1 or {})
	assert(var1.current ~= nil, LUAU_ANALYZE_ERRORModule)
	local var2, var3 = reactModule.useState(#var1.current)
	
	return {
		push = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), var3 (ref)
			table.insert(var1.current, p2)
			var3(#var1.current)
		end, {}),
		pop = reactModule.useCallback(function()
			-- upvalues: var1 (ref), var3 (ref)
			local removed = table.remove(var1.current)
			var3(#var1.current)
			
			return removed
		end, {}),
		getTop = reactModule.useCallback(function()
			-- upvalues: var1 (ref)
			return var1.current[#var1.current]
		end, {}),
		clear = reactModule.useCallback(function()
			-- upvalues: var1 (ref), var3 (ref)
			table.clear(var1.current)
			var3(0)
		end, {}),
		size = var2
	}
end