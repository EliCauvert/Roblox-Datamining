local parent = script:FindFirstAncestor("LazyRequire").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)

return function(p0) --[[ line: 13 | named "createLazyComponent" ]]
	-- upvalues: reactModule (ref), cryoModule (ref)
	return reactModule.forwardRef(function(p1, p2) --[[ line: 16 ]]
		-- upvalues: reactModule (copy), p0 (ref), cryoModule (copy)
		return reactModule.createElement(p0(), cryoModule.Dictionary.join(p1, { ref = p2 }))
	end)
end