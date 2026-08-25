local useCursor = require(script.Parent.Parent.Parent.Parent.Foundation).Hooks.useCursor
local mapCursorTypeModule = require(script.Parent.Parent.Parent.App.SelectionCursor.mapCursorType)

return function(p0)
	-- upvalues: useCursor (ref), mapCursorTypeModule (ref)
	return useCursor(mapCursorTypeModule(p0, true))
end