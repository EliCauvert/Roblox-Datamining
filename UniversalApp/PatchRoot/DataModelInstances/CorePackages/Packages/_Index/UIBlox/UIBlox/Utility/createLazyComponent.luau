local parent = script.Parent.Parent.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)

return function(p0)
	-- upvalues: reactModule (ref), cryoModule (ref)
	return reactModule.forwardRef(function(p1, p2)
		-- upvalues: reactModule (copy), p0 (ref), cryoModule (copy)
		return reactModule.createElement(p0(), cryoModule.Dictionary.join(p1, { ref = p2 }))
	end)
end