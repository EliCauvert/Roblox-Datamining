local Parent = script.Parent.Parent
local ControlStateModule = require(Parent.Core.Control.Enum.ControlState)
local _ = require(Parent.App.Style.StyleTypes)

return function(Default, p1) --[[ Line: 10 ]]
	-- upvalues: ControlStateModule (copy)
	return if Default == ControlStateModule.Initialize then p1.Initialize elseif Default == ControlStateModule.Default then p1.Default elseif Default == ControlStateModule.Pressed then p1.Pressed elseif Default == ControlStateModule.Hover then p1.Hover elseif Default == ControlStateModule.Selected then p1.Selected elseif Default == ControlStateModule.SelectedPressed then p1.SelectedPressed elseif Default == ControlStateModule.Disabled then p1.Disabled else nil
end