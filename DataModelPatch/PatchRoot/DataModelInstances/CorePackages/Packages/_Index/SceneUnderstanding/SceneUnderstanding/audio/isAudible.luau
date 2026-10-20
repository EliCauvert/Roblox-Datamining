local CalculatePotentialAudibilityModule = require(script:FindFirstAncestor("SceneUnderstanding").audio.calculatePotentialAudibility)

return function(p1): boolean
	-- upvalues: CalculatePotentialAudibilityModule (copy)
	return CalculatePotentialAudibilityModule(p1) > 0.01
end