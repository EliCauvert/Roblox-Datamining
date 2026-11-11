local DataHydration = script:FindFirstAncestor("DataHydration")
local TModule = require(DataHydration.Parent.t)
local _ = require(DataHydration.DataHydrationTypes)

return {
	gameMediaResponseValidator = TModule.interface({
		data = TModule.array(require(DataHydration.MediaAsset.MediaAssetStoreTypes).mediaAssetResponseItemValidator)
	})
}