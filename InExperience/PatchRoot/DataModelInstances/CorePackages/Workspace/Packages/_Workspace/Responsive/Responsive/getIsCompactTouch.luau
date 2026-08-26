local parent = script.Parent
local standardBreakpointsModule = require(parent.CommonConfigs.StandardBreakpoints)
local inputModeModule = require(parent.InputMode)

return function(p1, p2)
	-- upvalues: standardBreakpointsModule (ref), inputModeModule (ref)
	return p1.X <= standardBreakpointsModule.sizes[standardBreakpointsModule.Enum.Small].maxWidth and (p1.X < p1.Y and p2 == inputModeModule.Enum.Touch)
end