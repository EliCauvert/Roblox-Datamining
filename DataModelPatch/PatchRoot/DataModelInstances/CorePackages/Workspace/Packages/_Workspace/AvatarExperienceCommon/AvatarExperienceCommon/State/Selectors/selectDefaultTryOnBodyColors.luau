local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p1)
	-- upvalues: ConstantsModule (copy)
	local OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	local OutfitInfos = p1.AvatarExperience.AvatarEditor.OutfitInfos
	local OutfitIdMap = OutfitTryOn.OutfitIdMap
	
	for _, tryOnItem in OutfitTryOn.TryOnItems do
		if OutfitIdMap and tryOnItem.itemType == "Bundle" and tryOnItem.itemSubType == ConstantsModule.BODY_BUNDLE_TYPE_ID and tryOnItem.receivedBundleInfo then
			local OutfitId = OutfitIdMap[tryOnItem.itemId]
			local OutfitInfo = if OutfitId then OutfitInfos[OutfitId] else nil
			
			return if OutfitInfo then OutfitInfo.bodyColor3s else nil
		end
	end
	return nil
end