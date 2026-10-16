local TModule = require(script:FindFirstAncestor("UnifiedLogging").Parent.t)

return {
	CollectionAnalyticsDataInterface = {
		collectionId = TModule.union(TModule.number, TModule.string),
		contentType = TModule.string,
		itemsPerRow = TModule.number,
		collectionPosition = TModule.number,
		startRowNumber = TModule.optional(TModule.number),
		totalNumberOfItems = TModule.number,
		refId = TModule.optional(TModule.string)
	},
	ItemAnalyticsDataInterface = {
		id = TModule.union(TModule.number, TModule.string),
		itemPosition = TModule.optional(TModule.number)
	}
}