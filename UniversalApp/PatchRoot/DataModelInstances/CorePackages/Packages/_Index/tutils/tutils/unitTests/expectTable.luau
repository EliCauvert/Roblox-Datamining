local ShallowEqualModule = require(script.Parent.Parent.shallowEqual)
local ToStringModule = require(script.Parent.Parent.toString)

return function(p1)
	-- upvalues: ShallowEqualModule (copy), ToStringModule (copy)
	return {
		toEqual = function(p2)
			-- upvalues: ShallowEqualModule (upval), p1 (copy), ToStringModule (upval)
			assert(ShallowEqualModule(p1, p2), string.format("expected: %s\ninstead got: %s", ToStringModule(p2), ToStringModule(p1)))
		end
	}
end