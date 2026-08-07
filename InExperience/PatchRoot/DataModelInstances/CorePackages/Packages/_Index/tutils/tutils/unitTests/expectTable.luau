local shallowEqualModule = require(script.Parent.Parent.shallowEqual)
local toStringModule = require(script.Parent.Parent.toString)

return function(p0) --[[ line: 4 | named "expectTable" ]]
	-- upvalues: shallowEqualModule (ref), toStringModule (ref)
	return {
		toEqual = function(p1) --[[ line: 6 ]]
			-- upvalues: shallowEqualModule (copy), p0 (ref), toStringModule (copy)
			assert(shallowEqualModule(p0, p1), string.format("expected: %s\ninstead got: %s", toStringModule(p1), toStringModule(p0)))
		end
	}
end