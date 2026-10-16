local PlayWithRewardExperimentDataModule = require(script:FindFirstAncestor("PlayWithRewardState").PlayWithRewardExperimentData)

return {
	new = function(AdAvailabilityResult, ProductId, ProductName, ProductImageAssetId, p1) --[[ Line: 16 ]]
		-- upvalues: PlayWithRewardExperimentDataModule (copy)
		return {
			adAvailabilityResult = AdAvailabilityResult,
			productId = ProductId,
			productName = ProductName,
			productImageAssetId = ProductImageAssetId,
			experimentVariantData = PlayWithRewardExperimentDataModule.fromJsonData(p1)
		}
	end
}