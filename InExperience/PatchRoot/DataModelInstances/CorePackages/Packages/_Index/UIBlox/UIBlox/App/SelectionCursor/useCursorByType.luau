local parent = script.Parent.Parent.Parent.Parent
local useCursor = require(parent.Foundation).Hooks.useCursor
local _ = require(parent.React)
local mapCursorTypeModule = require(script.Parent.mapCursorType)

return function(p0)
	-- upvalues: useCursor (ref), mapCursorTypeModule (ref)
	return useCursor(mapCursorTypeModule(p0))
end