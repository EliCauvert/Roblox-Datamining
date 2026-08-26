return function(p1)
	local assetId = p1.detailsInformation.assetId
	
	if assetId == nil then
		return nil
	end
	local var1 = p1.assets[assetId]
	
	return var1 and var1.parentBundleId ~= nil
end