local _ = require(script:FindFirstAncestor("GameTile").GameTileTypes)

local function _(p1)
	return type(p1) == "string" and p1 ~= ""
end

return function(p1, p2)
	if p2 then
		return { assetId = p2 }
	end
	local primaryMediaAsset = p1 and p1.primaryMediaAsset
	
	if not primaryMediaAsset then
		return nil
	elseif primaryMediaAsset.wideVideoAssetId then
		return { assetId = primaryMediaAsset.wideVideoAssetId }
	end
	local momentVideoAssetId = primaryMediaAsset.momentVideoAssetId
	
	if type(momentVideoAssetId) == "string" and momentVideoAssetId ~= "" then
		momentVideoAssetId = primaryMediaAsset.momentVideoAssetAccessContext
		
		return if type(momentVideoAssetId) == "string" and momentVideoAssetId ~= "" then {
			assetId = primaryMediaAsset.momentVideoAssetId,
			accessContext = primaryMediaAsset.momentVideoAssetAccessContext
		} else nil
	end
end