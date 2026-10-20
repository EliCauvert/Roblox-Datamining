local Parent = script:FindFirstAncestor("UnifiedLogging").Parent
local TModule = require(Parent.t)

return {
	CollectionAnalyticsDataInterface = {
		collectionId = TModule.union(TModule.number, TModule.string),
		contentType = TModule.string,
		itemsPerRow = TModule.number,
		collectionPosition = TModule.number,
		startRowNumber = TModule.optional(TModule.number),
		totalNumberOfItems = TModule.number,
		refId = if require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
	},
	ItemAnalyticsDataInterface = {
		id = TModule.union(TModule.number, TModule.string),
		itemPosition = TModule.optional(TModule.number)
	}
}