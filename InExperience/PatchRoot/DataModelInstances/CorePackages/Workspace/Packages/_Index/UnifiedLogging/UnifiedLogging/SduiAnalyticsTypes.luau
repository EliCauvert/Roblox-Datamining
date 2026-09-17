local tModule = require(script:FindFirstAncestor("UnifiedLogging").Parent.t)

return {
	CollectionAnalyticsDataInterface = {
		collectionId = tModule.union(tModule.number, tModule.string),
		contentType = tModule.string,
		itemsPerRow = tModule.number,
		collectionPosition = tModule.number,
		startRowNumber = tModule.optional(tModule.number),
		totalNumberOfItems = tModule.number,
		refId = tModule.optional(tModule.string)
	},
	ItemAnalyticsDataInterface = {
		id = tModule.union(tModule.number, tModule.string),
		itemPosition = tModule.optional(tModule.number)
	}
}