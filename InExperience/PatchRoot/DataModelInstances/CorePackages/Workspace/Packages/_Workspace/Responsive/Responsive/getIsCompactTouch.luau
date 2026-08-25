local parent = script.Parent
local standardBreakpointsModule = require(parent.CommonConfigs.StandardBreakpoints)
local inputModeModule = require(parent.InputMode)

return function(p0, p1)
	-- upvalues: standardBreakpointsModule (ref), inputModeModule (ref)
	return p0.X <= standardBreakpointsModule.sizes[standardBreakpointsModule.Enum.Small].maxWidth and (p0.X < p0.Y and p1 == inputModeModule.Enum.Touch)
end