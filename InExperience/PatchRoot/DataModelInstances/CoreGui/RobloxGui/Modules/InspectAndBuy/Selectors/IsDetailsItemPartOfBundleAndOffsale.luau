return function(p0) --[[ line: 4 ]]
	local assetId = p0.detailsInformation.assetId
	
	if assetId == nil then
		return nil
	end
	local var0 = p0.assets[assetId]
	
	return var0 and var0.parentBundleId ~= nil
end