local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

local function _(p1: number, p2): number --[[ Line: 6 | Named "calculateScaled" ]]
	return p1 + p2 * (1 - p1)
end

return function(p1, p2) --[[ Line: 10 | Named "mergeBindableScalar" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.joinBindings(if typeof(p1) == "number" then { p2 } else { p2, p1 }):map(function(Entry) --[[ Line: 15 ]]
		-- upvalues: p1 (copy)
		local Entry1 = Entry[1]
		local Entry2 = Entry[2] or p1
		
		return if Entry2 == nil then 1 else Entry2 + Entry1 * (1 - Entry2)
	end)
end