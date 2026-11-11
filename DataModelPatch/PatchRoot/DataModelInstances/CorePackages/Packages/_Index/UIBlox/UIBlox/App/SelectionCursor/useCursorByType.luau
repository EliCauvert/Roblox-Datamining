local Parent = script.Parent.Parent.Parent.Parent
local UseCursorFunction = require(Parent.Foundation).Hooks.useCursor
local _ = require(Parent.React)
local MapCursorTypeModule = require(script.Parent.mapCursorType)

return function(p1)
	-- upvalues: UseCursorFunction (copy), MapCursorTypeModule (copy)
	return UseCursorFunction(MapCursorTypeModule(p1))
end