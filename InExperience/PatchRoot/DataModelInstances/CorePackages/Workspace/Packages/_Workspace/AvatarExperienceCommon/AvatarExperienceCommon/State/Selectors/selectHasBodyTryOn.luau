local SelectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)

return function(p1): boolean --[[ Line: 3 | Named "selectHasBodyTryOn" ]]
	-- upvalues: SelectTryOnBodyIdsModule (copy)
	return #SelectTryOnBodyIdsModule(p1) > 0 or p1.AvatarExperience.AvatarScene.OutfitTryOn ~= nil and p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil
end