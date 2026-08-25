local _ = require(script:FindFirstAncestor("Moments").Parent.Foundation)

return function(p0, p1)
	return {
		Color3 = p0.Color3,
		Transparency = 1 - (1 - (p0.Transparency or 0)) * (1 - p1)
	}
end