local playWithRewardExperimentDataModule = require(script:FindFirstAncestor("PlayWithRewardState").PlayWithRewardExperimentData)

return {
	new = function(p1, p2, p3, p4, p5)
		-- upvalues: playWithRewardExperimentDataModule (ref)
		return {
			adAvailabilityResult = p1,
			productId = p2,
			productName = p3,
			productImageAssetId = p4,
			experimentVariantData = playWithRewardExperimentDataModule.fromJsonData(p5)
		}
	end
}