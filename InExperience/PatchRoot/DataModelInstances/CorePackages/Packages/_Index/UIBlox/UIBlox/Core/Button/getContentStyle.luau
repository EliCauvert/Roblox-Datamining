local controlStateModule = require(script.Parent.Parent.Control.Enum.ControlState)

return function(p1, p2, p3)
	-- upvalues: controlStateModule (ref)
	local var1 = p1[p2] or p1[controlStateModule.Default]
	local t = {
		Color = p3.Theme[var1].Color,
		Transparency = p3.Theme[var1].Transparency
	}
	
	if p2 == controlStateModule.Disabled or p2 == controlStateModule.Pressed then
		t.Transparency = 0.5 * t.Transparency + 0.5
	end
	return t
end