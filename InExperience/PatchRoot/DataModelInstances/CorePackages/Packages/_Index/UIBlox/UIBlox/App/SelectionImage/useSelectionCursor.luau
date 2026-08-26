local useCursor = require(script.Parent.Parent.Parent.Parent.Foundation).Hooks.useCursor
local mapCursorTypeModule = require(script.Parent.Parent.Parent.App.SelectionCursor.mapCursorType)

return function(p1)
	-- upvalues: useCursor (ref), mapCursorTypeModule (ref)
	return useCursor(mapCursorTypeModule(p1, true))
end