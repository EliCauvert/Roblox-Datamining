local calculatePotentialAudibilityModule = require(script:FindFirstAncestor("SceneUnderstanding").audio.calculatePotentialAudibility)

return function(p0) --[[ line: 19 | named "isAudible" ]]
	-- upvalues: calculatePotentialAudibilityModule (ref)
	return calculatePotentialAudibilityModule(p0) > 0.01
end