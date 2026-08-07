local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local tModule = require(parent.t)
local _ = require(parent.Signals)
local _ = require(dataHydration.DataHydrationTypes)

return {
	marketplaceCatalogSortResponseItemValidator = tModule.interface({
		id = tModule.string,
		type = tModule.string,
		hydrationPriority = tModule.number,
		hydrationCount = tModule.number,
		content = tModule.table,
		previewColumns = tModule.optional(tModule.number),
		title = tModule.optional(tModule.string),
		description = tModule.optional(tModule.string),
		cardStyle = tModule.optional(tModule.table),
		cardFooters = tModule.optional(tModule.table),
		tagId = tModule.optional(tModule.string)
	})
}