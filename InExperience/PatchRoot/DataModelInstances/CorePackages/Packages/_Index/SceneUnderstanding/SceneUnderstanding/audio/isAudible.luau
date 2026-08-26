local calculatePotentialAudibilityModule = require(script:FindFirstAncestor("SceneUnderstanding").audio.calculatePotentialAudibility)

return function(p1)
	-- upvalues: calculatePotentialAudibilityModule (ref)
	return calculatePotentialAudibilityModule(p1) > 0.01
end