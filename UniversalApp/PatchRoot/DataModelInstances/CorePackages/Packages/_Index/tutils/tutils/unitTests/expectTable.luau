local shallowEqualModule = require(script.Parent.Parent.shallowEqual)
local toStringModule = require(script.Parent.Parent.toString)

return function(p1)
	-- upvalues: shallowEqualModule (ref), toStringModule (ref)
	return {
		toEqual = function(p2)
			-- upvalues: shallowEqualModule (copy), p1 (ref), toStringModule (copy)
			assert(shallowEqualModule(p1, p2), string.format("expected: %s\ninstead got: %s", toStringModule(p2), toStringModule(p1)))
		end
	}
end