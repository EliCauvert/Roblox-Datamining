local parent = script.Parent.Parent
local controlStateModule = require(parent.Core.Control.Enum.ControlState)
local _ = require(parent.App.Style.StyleTypes)

return function(p1, p2)
	-- upvalues: controlStateModule (ref)
	return if p1 == controlStateModule.Initialize then p2.Initialize elseif p1 == controlStateModule.Default then p2.Default elseif p1 == controlStateModule.Pressed then p2.Pressed elseif p1 == controlStateModule.Hover then p2.Hover elseif p1 == controlStateModule.Selected then p2.Selected elseif p1 == controlStateModule.SelectedPressed then p2.SelectedPressed elseif p1 == controlStateModule.Disabled then p2.Disabled else nil
end