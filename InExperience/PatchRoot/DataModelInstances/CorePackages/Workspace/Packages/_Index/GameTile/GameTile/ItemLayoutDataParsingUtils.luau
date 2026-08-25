local _ = require(script:FindFirstAncestor("GameTile").GameTileTypes)

return {
	getWideImageAssetId = function(value)
		return if value and value.primaryMediaAsset and (value.primaryMediaAsset.wideImageAssetId and value.primaryMediaAsset.wideImageAssetId ~= "") then value.primaryMediaAsset.wideImageAssetId else nil
	end
}