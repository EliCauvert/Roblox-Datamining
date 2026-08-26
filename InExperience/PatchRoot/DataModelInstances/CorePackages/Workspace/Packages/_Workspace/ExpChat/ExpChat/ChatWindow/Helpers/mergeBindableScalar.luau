local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

local function _(p1, p2)
	return p1 + p2 * (1 - p1)
end

return function(p1, p2)
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings(if typeof(p1) == "number" then { p2 } else { p2, p1 }):map(function(p3)
		-- upvalues: p1 (ref)
		local var1 = p3[2] or p1
		
		return if var1 == nil then 1 else var1 + p3[1] * (1 - var1)
	end)
end