-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local controlStateModule = require(parent.Core.Control.Enum.ControlState)
local _ = require(parent.App.Style.StyleTypes)

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: controlStateModule (ref)
	return if p0 == controlStateModule.Initialize then p1.Initialize elseif p0 == controlStateModule.Default then p1.Default elseif p0 == controlStateModule.Pressed then p1.Pressed elseif p0 == controlStateModule.Hover then p1.Hover elseif p0 == controlStateModule.Selected then p1.Selected elseif p0 == controlStateModule.SelectedPressed then p1.SelectedPressed elseif p0 == controlStateModule.Disabled then p1.Disabled else nil
end