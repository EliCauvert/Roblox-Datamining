local parent = script.Parent.Parent.Parent.Parent
local _ = require(parent.React)
local useCursor = require(parent.Foundation).Hooks.useCursor

return function(p1, p2, p3)
	-- upvalues: useCursor (ref)
	return useCursor({ radius = p1, offset = p2, borderWidth = p3 })
end