local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local CreateDeferredAssetStoreModule = require(script.Parent.createDeferredAssetStore)
local EngineFeatureEnableDeferredAssetManagerServiceModule = require(ProgressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService)

return require(ProgressLoading.Parent.Signals).createComputed(function() --[[ Line: 12 ]]
	-- upvalues: EngineFeatureEnableDeferredAssetManagerServiceModule (copy), CreateDeferredAssetStoreModule (copy)
	return if EngineFeatureEnableDeferredAssetManagerServiceModule then CreateDeferredAssetStoreModule() else nil
end)