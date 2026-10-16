local DataHydration = script:FindFirstAncestor("DataHydration")
local TModule = require(DataHydration.Parent.t)
local _ = require(DataHydration.DataHydrationTypes)

return {
	mediaAssetResponseItemValidator = TModule.interface({
		imageId = TModule.optional(TModule.union(TModule.number, TModule.string)),
		assetTypeId = TModule.optional(TModule.number),
		videoId = TModule.optional(TModule.union(TModule.number, TModule.string)),
		videoHash = TModule.optional(TModule.string),
		videoTitle = TModule.optional(TModule.string)
	})
}