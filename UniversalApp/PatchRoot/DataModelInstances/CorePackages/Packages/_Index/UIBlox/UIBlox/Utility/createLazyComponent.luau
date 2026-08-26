local parent = script.Parent.Parent.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref)
	return reactModule.forwardRef(function(p2, p3)
		-- upvalues: reactModule (copy), p1 (ref), cryoModule (copy)
		return reactModule.createElement(p1(), cryoModule.Dictionary.join(p2, { ref = p3 }))
	end)
end