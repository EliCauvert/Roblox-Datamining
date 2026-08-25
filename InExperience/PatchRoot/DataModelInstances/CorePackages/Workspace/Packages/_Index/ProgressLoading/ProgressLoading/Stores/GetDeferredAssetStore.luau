local progressLoading = script:FindFirstAncestor("ProgressLoading")
local signalsModule = require(progressLoading.Parent.Signals)
local createDeferredAssetStoreModule = require(script.Parent.createDeferredAssetStore)
local engineFeatureEnableDeferredAssetManagerServiceModule = require(progressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService)

return signalsModule.createComputed(function()
	-- upvalues: engineFeatureEnableDeferredAssetManagerServiceModule (ref), createDeferredAssetStoreModule (ref)
	return if engineFeatureEnableDeferredAssetManagerServiceModule then createDeferredAssetStoreModule() else nil
end)