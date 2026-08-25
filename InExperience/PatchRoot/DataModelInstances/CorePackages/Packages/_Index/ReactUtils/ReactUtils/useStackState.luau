local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local LUAU_ANALYZE_ERRORModule = require(reactUtils.LUAU_ANALYZE_ERROR)

return function(p0)
	-- upvalues: reactModule (ref), LUAU_ANALYZE_ERRORModule (ref)
	local var3 = reactModule.useRef(p0 or {})
	assert(var3.current ~= nil, LUAU_ANALYZE_ERRORModule)
	local var4, var5 = reactModule.useState(#var3.current)
	
	return {
		push = reactModule.useCallback(function(p1)
			-- upvalues: var3 (ref), var5 (ref)
			table.insert(var3.current, p1)
			var5(#var3.current)
		end, {}),
		pop = reactModule.useCallback(function()
			-- upvalues: var3 (ref), var5 (ref)
			local removed = table.remove(var3.current)
			var5(#var3.current)
			
			return removed
		end, {}),
		getTop = reactModule.useCallback(function()
			-- upvalues: var3 (ref)
			return var3.current[#var3.current]
		end, {}),
		clear = reactModule.useCallback(function()
			-- upvalues: var3 (ref), var5 (ref)
			table.clear(var3.current)
			var5(0)
		end, {}),
		size = var4
	}
end