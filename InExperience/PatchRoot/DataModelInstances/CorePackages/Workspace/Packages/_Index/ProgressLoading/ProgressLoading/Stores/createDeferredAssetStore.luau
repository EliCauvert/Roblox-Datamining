local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local engineFeatureEnableDeferredAssetManagerServiceModule = require(progressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService)
local var2 = if engineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil
local signalsModule = require(parent.Signals)

return function(value) --[[ line: 19 | named "createDeferredAssetStore" ]]
	-- upvalues: var2 (ref), engineFeatureEnableDeferredAssetManagerServiceModule (ref), signalsModule (ref)
	local value_1 = value or var2
	
	if engineFeatureEnableDeferredAssetManagerServiceModule or value ~= nil then
		local var5, var6 = signalsModule.createSignal(value_1:GetPrefetchDownloadStatus())
		local prefetchDownloadStatusChangedConnection = value_1.PrefetchDownloadStatusChanged:Connect(function(p0) --[[ line: 30 ]]
			-- upvalues: var6 (ref)
			var6(p0)
		end)
		
		return {
			getDownloadStatus = var5,
			cleanUp = function() --[[ line: 36 ]]
				-- upvalues: prefetchDownloadStatusChangedConnection (ref)
				prefetchDownloadStatusChangedConnection:Disconnect()
			end
		}
	end
	return {
		getDownloadStatus = function() --[[ line: 23 ]] end,
		cleanUp = function() --[[ line: 24 ]] end
	}
end