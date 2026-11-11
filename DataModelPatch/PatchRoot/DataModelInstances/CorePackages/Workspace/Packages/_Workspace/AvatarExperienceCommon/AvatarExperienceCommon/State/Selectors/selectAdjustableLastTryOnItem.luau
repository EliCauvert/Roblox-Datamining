local CryoModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Cryo)

return function(p1)
	-- upvalues: CryoModule (copy)
	local OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	
	if OutfitTryOn.LastToggledItem and OutfitTryOn.AdjustableTryOnIds then
		local ItemId = OutfitTryOn.LastToggledItem.itemId
		
		if CryoModule.List.find(OutfitTryOn.AdjustableTryOnIds, ItemId) then
			return ItemId
		end
	end
	return nil
end