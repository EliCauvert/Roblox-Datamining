local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local CryoModule = require(ReactSceneUnderstanding.Parent.Cryo)
local SceneUnderstandingModule = require(ReactSceneUnderstanding.Parent.SceneUnderstanding)

return function(p1)
	-- upvalues: CryoModule (copy), SceneUnderstandingModule (copy)
	return CryoModule.List.sort(CryoModule.List.filter(p1, SceneUnderstandingModule.isAudible), function(p2, p3): boolean
		-- upvalues: SceneUnderstandingModule (upval)
		return SceneUnderstandingModule.calculatePotentialAudibility(p3) < SceneUnderstandingModule.calculatePotentialAudibility(p2)
	end)
end