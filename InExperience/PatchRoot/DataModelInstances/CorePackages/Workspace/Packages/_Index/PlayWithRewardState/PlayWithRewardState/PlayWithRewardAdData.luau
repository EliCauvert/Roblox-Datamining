local playWithRewardExperimentDataModule = require(script:FindFirstAncestor("PlayWithRewardState").PlayWithRewardExperimentData)

return {
	new = function(p0, p1, p2, p3, p4)
		-- upvalues: playWithRewardExperimentDataModule (ref)
		return {
			adAvailabilityResult = p0,
			productId = p1,
			productName = p2,
			productImageAssetId = p3,
			experimentVariantData = playWithRewardExperimentDataModule.fromJsonData(p4)
		}
	end
}