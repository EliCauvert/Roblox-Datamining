local _ = require(script:FindFirstAncestor("GameTile").GameTileTypes)

return {
	getWideImageAssetId = function(p1) --[[ Line: 9 ]]
		return if p1 and p1.primaryMediaAsset and p1.primaryMediaAsset.wideImageAssetId and p1.primaryMediaAsset.wideImageAssetId ~= "" then p1.primaryMediaAsset.wideImageAssetId else nil
	end
}