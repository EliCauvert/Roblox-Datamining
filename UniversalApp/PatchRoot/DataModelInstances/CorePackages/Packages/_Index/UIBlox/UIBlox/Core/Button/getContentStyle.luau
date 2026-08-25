local controlStateModule = require(script.Parent.Parent.Control.Enum.ControlState)

return function(p0, p1, p2)
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