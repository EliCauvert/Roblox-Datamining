local EngineFeatureEnableDeferredAssetManagerServiceModule = require(script:FindFirstAncestor("ProgressLoading").Flags.EngineFeatureEnableDeferredAssetManagerService)
local DeferredAssetManagerService = if EngineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil

return {
	getJoiningPlaceId = function()
		-- upvalues: EngineFeatureEnableDeferredAssetManagerServiceModule (copy), DeferredAssetManagerService (copy)
		return EngineFeatureEnableDeferredAssetManagerServiceModule and DeferredAssetManagerService and DeferredAssetManagerService.JoiningPlaceId or 0
	end,
	getJoiningUniverseId = function()
		-- upvalues: EngineFeatureEnableDeferredAssetManagerServiceModule (copy), DeferredAssetManagerService (copy)
		return EngineFeatureEnableDeferredAssetManagerServiceModule and DeferredAssetManagerService and DeferredAssetManagerService.JoiningUniverseId or 0
	end
}