local GameItemTypeModule = require(script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Utils.GameItemType)

return function(DeveloperProduct): boolean
	-- upvalues: GameItemTypeModule (copy)
	return DeveloperProduct == GameItemTypeModule.GamePass or (DeveloperProduct == GameItemTypeModule.DeveloperProduct or DeveloperProduct == GameItemTypeModule.Subscription)
end