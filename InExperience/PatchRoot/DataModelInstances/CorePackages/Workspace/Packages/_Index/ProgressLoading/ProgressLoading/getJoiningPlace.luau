local engineFeatureEnableDeferredAssetManagerServiceModule = require(script:FindFirstAncestor("ProgressLoading").Flags.EngineFeatureEnableDeferredAssetManagerService)
local var1 = if engineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil

return {
	getJoiningPlaceId = function()
		-- upvalues: engineFeatureEnableDeferredAssetManagerServiceModule (ref), var1 (ref)
		return if engineFeatureEnableDeferredAssetManagerServiceModule and var1 then var1.JoiningPlaceId or 0 else 0
	end,
	getJoiningUniverseId = function()
		-- upvalues: engineFeatureEnableDeferredAssetManagerServiceModule (ref), var1 (ref)
		return if engineFeatureEnableDeferredAssetManagerServiceModule and var1 then var1.JoiningUniverseId or 0 else 0
	end
}