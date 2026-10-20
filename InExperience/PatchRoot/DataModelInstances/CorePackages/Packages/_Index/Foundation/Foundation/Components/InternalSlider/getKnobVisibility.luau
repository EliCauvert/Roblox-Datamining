local Foundation = script:FindFirstAncestor("Foundation")
local ControlStateModule = require(Foundation.Enums.ControlState)
local VisibilityModule = require(Foundation.Enums.Visibility)

return function(p1)
	-- upvalues: VisibilityModule (copy), ControlStateModule (copy)
	return not p1.isDisabled and (if p1.knobVisibility == VisibilityModule.None then p1.isSelected else p1.knobVisibility == VisibilityModule.Always or (p1.isDragging or (p1.isSelected or (p1.controlState == ControlStateModule.Hover or p1.controlState == ControlStateModule.Pressed))))
end