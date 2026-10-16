local EngineFeatureEnableDeferredAssetManagerServiceModule = require(script:FindFirstAncestor("ProgressLoading").Flags.EngineFeatureEnableDeferredAssetManagerService)
local DeferredAssetManagerService = if EngineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil

return {
	getJoiningPlaceId = function() --[[ Line: 11 ]]
		-- upvalues: EngineFeatureEnableDeferredAssetManagerServiceModule (copy), DeferredAssetManagerService (copy)
		return EngineFeatureEnableDeferredAssetManagerServiceModule and DeferredAssetManagerService and DeferredAssetManagerService.JoiningPlaceId or 0
	end,
	getJoiningUniverseId = function() --[[ Line: 18 ]]
		-- upvalues: EngineFeatureEnableDeferredAssetManagerServiceModule (copy), DeferredAssetManagerService (copy)
		return EngineFeatureEnableDeferredAssetManagerServiceModule and DeferredAssetManagerService and DeferredAssetManagerService.JoiningUniverseId or 0
	end
}