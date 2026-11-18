local _ = require(script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Utils.GameItemType)

return function(p1, p2): string
	return `GameItemDetails_{p1}_{p2}`
end