local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local cryoModule = require(reactSceneUnderstanding.Parent.Cryo)
local sceneUnderstandingModule = require(reactSceneUnderstanding.Parent.SceneUnderstanding)

return function(p0)
	-- upvalues: cryoModule (ref), sceneUnderstandingModule (ref)
	return cryoModule.List.sort(cryoModule.List.filter(p0, sceneUnderstandingModule.isAudible), function(p1, p2)
		-- upvalues: sceneUnderstandingModule (copy)
		return sceneUnderstandingModule.calculatePotentialAudibility(p2) < sceneUnderstandingModule.calculatePotentialAudibility(p1)
	end)
end