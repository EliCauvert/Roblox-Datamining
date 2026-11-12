local BlendColorsFunction = require(script.Parent.Parent.Parent.Foundation).Utility.blendColors

return function(p1, Transparency, p2, p3, p4)
	-- upvalues: BlendColorsFunction (copy)
	local _Color3 = p3.Color3
	
	return if BlendColorsFunction({ Color3 = p2.Color3, Transparency = p2.Transparency }, { Color3 = p1, Transparency = Transparency }).Color3:GetContrastingColor(_Color3, p4.Color3) == _Color3 then p3 else p4
end