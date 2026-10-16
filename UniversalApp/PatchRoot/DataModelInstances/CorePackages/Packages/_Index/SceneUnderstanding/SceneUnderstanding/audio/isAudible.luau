local CalculatePotentialAudibilityModule = require(script:FindFirstAncestor("SceneUnderstanding").audio.calculatePotentialAudibility)

return function(p1): boolean --[[ Line: 19 | Named "isAudible" ]]
	-- upvalues: CalculatePotentialAudibilityModule (copy)
	return CalculatePotentialAudibilityModule(p1) > 0.01
end