local parent = script.Parent.Parent.Parent.Parent
local _ = require(parent.React)
local useCursor = require(parent.Foundation).Hooks.useCursor

return function(p0, p1, p2) --[[ line: 7 | named "useCursor" ]]
	-- upvalues: useCursor (ref)
	return useCursor({ radius = p0, offset = p1, borderWidth = p2 })
end