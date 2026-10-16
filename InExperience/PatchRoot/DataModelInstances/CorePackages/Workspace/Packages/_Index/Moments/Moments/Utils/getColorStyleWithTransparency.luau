local _ = require(script:FindFirstAncestor("Moments").Parent.Foundation)

return function(p1, p2: number) --[[ Line: 10 | Named "getColorStyleWithTransparency" ]]
	return {
		Color3 = p1.Color3,
		Transparency = 1 - (1 - (p1.Transparency or 0)) * (1 - p2)
	}
end