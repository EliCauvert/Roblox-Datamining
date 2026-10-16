local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local CryoModule = require(ReactSceneUnderstanding.Parent.Cryo)
local SceneUnderstandingModule = require(ReactSceneUnderstanding.Parent.SceneUnderstanding)

return function(p1) --[[ Line: 6 | Named "sortByAudibleVolume" ]]
	-- upvalues: CryoModule (copy), SceneUnderstandingModule (copy)
	return CryoModule.List.sort(CryoModule.List.filter(p1, SceneUnderstandingModule.isAudible), function(p2, p3): boolean --[[ Line: 9 ]]
		-- upvalues: SceneUnderstandingModule (upval)
		return SceneUnderstandingModule.calculatePotentialAudibility(p3) < SceneUnderstandingModule.calculatePotentialAudibility(p2)
	end)
end