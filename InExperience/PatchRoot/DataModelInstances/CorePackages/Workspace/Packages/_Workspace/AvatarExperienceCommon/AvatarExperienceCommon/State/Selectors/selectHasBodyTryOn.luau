local selectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)

return function(p0)
	-- upvalues: selectTryOnBodyIdsModule (ref)
	return if #selectTryOnBodyIdsModule(p0) <= 0 then p0.AvatarExperience.AvatarScene.OutfitTryOn ~= nil and p0.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil else true
end