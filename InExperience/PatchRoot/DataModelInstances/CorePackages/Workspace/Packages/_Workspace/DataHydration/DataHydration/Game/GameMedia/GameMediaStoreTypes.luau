local dataHydration = script:FindFirstAncestor("DataHydration")
local tModule = require(dataHydration.Parent.t)
local _ = require(dataHydration.DataHydrationTypes)

return {
	gameMediaResponseValidator = tModule.interface({
		data = tModule.array(require(dataHydration.MediaAsset.MediaAssetStoreTypes).mediaAssetResponseItemValidator)
	})
}