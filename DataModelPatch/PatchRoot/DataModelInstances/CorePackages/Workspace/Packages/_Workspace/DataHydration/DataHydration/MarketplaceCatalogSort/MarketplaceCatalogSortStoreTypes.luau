local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local TModule = require(Parent.t)
local _ = require(Parent.Signals)
local _ = require(DataHydration.DataHydrationTypes)

return {
	marketplaceCatalogSortResponseItemValidator = TModule.interface({
		id = TModule.string,
		type = TModule.string,
		hydrationPriority = TModule.number,
		hydrationCount = TModule.number,
		content = TModule.table,
		previewColumns = TModule.optional(TModule.number),
		title = TModule.optional(TModule.string),
		description = TModule.optional(TModule.string),
		cardStyle = TModule.optional(TModule.table),
		cardFooters = TModule.optional(TModule.table),
		tagId = TModule.optional(TModule.string)
	})
}