local _ = require(script:FindFirstAncestor("Moments").Parent.Foundation)

return function(p1, p2)
	return {
		Color3 = p1.Color3,
		Transparency = 1 - (1 - (p1.Transparency or 0)) * (1 - p2)
	}
end