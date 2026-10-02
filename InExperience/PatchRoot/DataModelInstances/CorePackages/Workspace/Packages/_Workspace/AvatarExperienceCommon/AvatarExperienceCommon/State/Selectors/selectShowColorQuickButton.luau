local selectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)

return function(p1)
	-- upvalues: selectTryOnBodyIdsModule (ref)
	local lastToggledItem = p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem
	
	for i, v in selectTryOnBodyIdsModule(p1) do
		local var1 = p1.AvatarExperience.Common.BundleInfos[v]
		
		if var1 and var1.isRecolorable and (lastToggledItem and lastToggledItem.itemId == v) then
			return true
		end
	end
	return false
end