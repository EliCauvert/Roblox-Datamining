local GetTryOnItemReducerKeyFunction = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Utils.getTryOnItemReducerKey

return function(p1)
	-- upvalues: GetTryOnItemReducerKeyFunction (copy)
	local LineItems = {}
	
	for _, fulfillmentGroup in p1.fulfillmentGroups do
		for _, lineItem in fulfillmentGroup.lineItems do
			local AssetId = if lineItem.assetId then lineItem.assetId else lineItem.bundleId
			local Name = if lineItem.assetId then Enum.AvatarItemType.Asset.Name else Enum.AvatarItemType.Bundle.Name
			
			if AssetId and Name then
				LineItems[GetTryOnItemReducerKeyFunction(AssetId, Name)] = {
					collectibleProductId = lineItem.collectibleProductId,
					agreedPriceRobux = lineItem.agreedPriceRobux,
					assetId = lineItem.assetId,
					bundleId = lineItem.bundleId,
					status = lineItem.status,
					errorReason = lineItem.errorReason
				}
			end
		end
	end
	return { status = p1.status, lineItems = LineItems }
end