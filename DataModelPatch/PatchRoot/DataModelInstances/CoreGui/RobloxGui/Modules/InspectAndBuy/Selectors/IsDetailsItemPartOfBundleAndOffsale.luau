return function(p1): boolean?
	local AssetId = p1.detailsInformation.assetId
	
	if AssetId == nil then
		return nil
	else
		local Asset = p1.assets[AssetId]
		
		return Asset and Asset.parentBundleId ~= nil
	end
end