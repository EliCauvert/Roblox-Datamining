local roactUtils = script:FindFirstAncestor("RoactUtils")
local reactModule = require(roactUtils.Parent.React)
local _ = require(roactUtils.types)

return function(p0) --[[ line: 15 | named "createLazyComponent" ]]
	-- upvalues: reactModule (ref)
	local var2 = reactModule.memo(function(p1) --[[ line: 16 ]]
		-- upvalues: reactModule (copy), p0 (ref)
		return reactModule.createElement(reactModule.useMemo(p0, {}), p1)
	end)
	
	return function(p2) --[[ line: 20 ]]
		-- upvalues: reactModule (copy), var2 (ref)
		return reactModule.createElement(var2, p2)
	end
end