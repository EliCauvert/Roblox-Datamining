local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

local function _(p0, p1) --[[ line: 6 | named "calculateScaled" ]]
	return p0 + p1 * (1 - p0)
end

return function(p2, p3) --[[ line: 10 | named "mergeBindableScalar" ]]
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings(if typeof(p2) == "number" then { p3 } else { p3, p2 }):map(function(p4) --[[ line: 15 ]]
		-- upvalues: p2 (ref)
		local var1 = p4[2] or p2
		
		return if var1 == nil then 1 else var1 + p4[1] * (1 - var1)
	end)
end