local selectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)

return function(p0) --[[ line: 3 | named "selectHasBodyTryOn" ]]
	-- upvalues: selectTryOnBodyIdsModule (ref)
	return if #selectTryOnBodyIdsModule(p0) <= 0 then p0.AvatarExperience.AvatarScene.OutfitTryOn ~= nil and p0.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil else true
end