local UseCursorFunction = require(script.Parent.Parent.Parent.Parent.Foundation).Hooks.useCursor
local MapCursorTypeModule = require(script.Parent.Parent.Parent.App.SelectionCursor.mapCursorType)

return function(p1) --[[ Line: 14 | Named "useSelectionCursor" ]]
	-- upvalues: UseCursorFunction (copy), MapCursorTypeModule (copy)
	return UseCursorFunction(MapCursorTypeModule(p1, true))
end