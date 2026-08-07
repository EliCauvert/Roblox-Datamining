local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p0) --[[ line: 4 | named "selectDefaultTryOnBodyColors" ]]
	-- upvalues: constantsModule (ref)
	local outfitTryOn = p0.AvatarExperience.AvatarScene.OutfitTryOn
	local outfitInfos = p0.AvatarExperience.AvatarEditor.OutfitInfos
	local outfitIdMap = outfitTryOn.OutfitIdMap
	
	for i, v in outfitTryOn.TryOnItems do
		if outfitIdMap and v.itemType == "Bundle" and (v.itemSubType == constantsModule.BODY_BUNDLE_TYPE_ID and v.receivedBundleInfo) then
			local itemId = outfitIdMap[v.itemId]
			local var1 = if itemId then outfitInfos[itemId] else nil
			
			return if var1 then var1.bodyColor3s else nil
		end
	end
	return nil
end