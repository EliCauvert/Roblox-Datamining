-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local controlStateModule = require(script.Parent.Parent.Control.Enum.ControlState)

return function(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: controlStateModule (ref)
	local var1 = p0[p1] or p0[controlStateModule.Default]
	local t = {
		Color = p2.Theme[var1].Color,
		Transparency = p2.Theme[var1].Transparency
	}
	
	if p1 == controlStateModule.Disabled or p1 == controlStateModule.Pressed then
		t.Transparency = 0.5 * t.Transparency + 0.5
	end
	return t
end