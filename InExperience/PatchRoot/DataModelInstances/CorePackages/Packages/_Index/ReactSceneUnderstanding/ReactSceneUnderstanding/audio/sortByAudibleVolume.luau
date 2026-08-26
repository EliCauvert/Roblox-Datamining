local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local cryoModule = require(reactSceneUnderstanding.Parent.Cryo)
local sceneUnderstandingModule = require(reactSceneUnderstanding.Parent.SceneUnderstanding)

return function(p1)
	-- upvalues: cryoModule (ref), sceneUnderstandingModule (ref)
	return cryoModule.List.sort(cryoModule.List.filter(p1, sceneUnderstandingModule.isAudible), function(p2, p3)
		-- upvalues: sceneUnderstandingModule (copy)
		return sceneUnderstandingModule.calculatePotentialAudibility(p3) < sceneUnderstandingModule.calculatePotentialAudibility(p2)
	end)
end