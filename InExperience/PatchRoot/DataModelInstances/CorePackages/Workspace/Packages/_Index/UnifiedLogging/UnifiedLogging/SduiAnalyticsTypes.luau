local parent = script:FindFirstAncestor("UnifiedLogging").Parent
local tModule = require(parent.t)

return {
	CollectionAnalyticsDataInterface = {
		collectionId = tModule.union(tModule.number, tModule.string),
		contentType = tModule.string,
		itemsPerRow = tModule.number,
		collectionPosition = tModule.number,
		startRowNumber = tModule.optional(tModule.number),
		totalNumberOfItems = tModule.number,
		refId = if require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
	},
	ItemAnalyticsDataInterface = {
		id = tModule.union(tModule.number, tModule.string),
		itemPosition = tModule.optional(tModule.number)
	}
}