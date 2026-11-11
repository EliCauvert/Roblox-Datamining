local Parent = script.Parent
local StandardBreakpointsModule = require(Parent.CommonConfigs.StandardBreakpoints)
local InputModeModule = require(Parent.InputMode)

return function(Vector, Touch): boolean
	-- upvalues: StandardBreakpointsModule (copy), InputModeModule (copy)
	local IsXBelow = Vector.X < Vector.Y
	
	return Vector.X <= StandardBreakpointsModule.sizes[StandardBreakpointsModule.Enum.Small].maxWidth and (IsXBelow and Touch == InputModeModule.Enum.Touch)
end