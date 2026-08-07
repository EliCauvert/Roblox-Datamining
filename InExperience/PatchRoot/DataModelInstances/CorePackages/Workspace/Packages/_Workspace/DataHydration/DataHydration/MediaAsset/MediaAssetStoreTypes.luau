local dataHydration = script:FindFirstAncestor("DataHydration")
local tModule = require(dataHydration.Parent.t)
local _ = require(dataHydration.DataHydrationTypes)

return {
	mediaAssetResponseItemValidator = tModule.interface({
		imageId = tModule.optional(tModule.union(tModule.number, tModule.string)),
		assetTypeId = tModule.optional(tModule.number),
		videoId = tModule.optional(tModule.union(tModule.number, tModule.string)),
		videoHash = tModule.optional(tModule.string),
		videoTitle = tModule.optional(tModule.string)
	})
}