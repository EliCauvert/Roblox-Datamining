return require(script.Parent.Parent.ActionCreator)("SetSettings", function(p0)
	return {
		preferredTransparency = p0.preferredTransparency,
		reducedMotion = p0.reducedMotion
	}
end)