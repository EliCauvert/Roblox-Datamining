local cryoModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Cryo)

return function(p0) --[[ line: 6 ]]
	-- upvalues: cryoModule (ref)
	local outfitTryOn = p0.AvatarExperience.AvatarScene.OutfitTryOn
	
	if outfitTryOn.LastToggledItem and outfitTryOn.AdjustableTryOnIds then
		local itemId = outfitTryOn.LastToggledItem.itemId
		
		return if cryoModule.List.find(outfitTryOn.AdjustableTryOnIds, itemId) then itemId else nil
	end
end