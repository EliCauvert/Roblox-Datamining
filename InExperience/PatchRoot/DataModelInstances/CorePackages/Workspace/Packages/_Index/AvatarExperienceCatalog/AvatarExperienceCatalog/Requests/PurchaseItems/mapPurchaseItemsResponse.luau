local getTryOnItemReducerKey = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Utils.getTryOnItemReducerKey

return function(p0) --[[ line: 9 | named "mapPurchaseItemsResponse" ]]
	-- upvalues: getTryOnItemReducerKey (ref)
	local t = {}
	
	for i, v in p0.fulfillmentGroups do
		for i_1, v_1 in v.lineItems do
			local var1 = if v_1.assetId then v_1.assetId else v_1.bundleId
			local var2 = if v_1.assetId then Enum.AvatarItemType.Asset.Name else Enum.AvatarItemType.Bundle.Name
			
			if var1 and var2 then
				t[getTryOnItemReducerKey(var1, var2)] = {
					collectibleProductId = v_1.collectibleProductId,
					agreedPriceRobux = v_1.agreedPriceRobux,
					assetId = v_1.assetId,
					bundleId = v_1.bundleId,
					status = v_1.status,
					errorReason = v_1.errorReason
				}
			end
		end
	end
	return { status = p0.status, lineItems = t }
end