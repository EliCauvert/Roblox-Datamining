local Parent = script.Parent.Parent.Parent.Parent
local _ = require(Parent.React)
local UseCursorFunction = require(Parent.Foundation).Hooks.useCursor

return function(Radius, Offset, BorderWidth)
	-- upvalues: UseCursorFunction (copy)
	return UseCursorFunction({
		radius = Radius,
		offset = Offset,
		borderWidth = BorderWidth
	})
end