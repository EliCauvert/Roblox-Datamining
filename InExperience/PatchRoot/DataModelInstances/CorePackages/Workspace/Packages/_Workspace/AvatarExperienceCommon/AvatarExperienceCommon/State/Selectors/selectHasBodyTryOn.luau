local selectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)

return function(p1)
	-- upvalues: selectTryOnBodyIdsModule (ref)
	return if #selectTryOnBodyIdsModule(p1) <= 0 then p1.AvatarExperience.AvatarScene.OutfitTryOn ~= nil and p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil else true
end