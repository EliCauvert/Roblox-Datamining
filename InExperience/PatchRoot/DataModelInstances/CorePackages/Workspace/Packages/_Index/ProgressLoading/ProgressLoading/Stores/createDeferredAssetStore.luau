local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local engineFeatureEnableDeferredAssetManagerServiceModule = require(progressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService)
local var2 = if engineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil
local signalsModule = require(parent.Signals)

return function(value) --[[ line: 22 | named "createDeferredAssetStore" ]]
	-- upvalues: var2 (ref), engineFeatureEnableDeferredAssetManagerServiceModule (ref), signalsModule (ref)
	local value_1 = value or var2
	
	if engineFeatureEnableDeferredAssetManagerServiceModule or value ~= nil then
		local var5, var6 = signalsModule.createSignal(value_1:GetPrefetchDownloadStatus())
		local prefetchDownloadStatusChangedConnection = value_1.PrefetchDownloadStatusChanged:Connect(function(p0) --[[ line: 35 ]]
			-- upvalues: var6 (ref)
			var6(p0)
		end)
		local var8, var9 = signalsModule.createSignal(value_1.PregameLoadingScreenOnly)
		local var10 = value_1:GetPropertyChangedSignal("PregameLoadingScreenOnly"):Connect(function() --[[ line: 43 ]]
			-- upvalues: var9 (ref), value_1 (ref)
			var9(value_1.PregameLoadingScreenOnly)
		end)
		
		return {
			getDownloadStatus = var5,
			getPregameLoadingScreenOnly = var8,
			cleanUp = function() --[[ line: 50 ]]
				-- upvalues: prefetchDownloadStatusChangedConnection (ref), var10 (ref)
				prefetchDownloadStatusChangedConnection:Disconnect()
				var10:Disconnect()
			end
		}
	end
	return {
		getDownloadStatus = function() --[[ line: 26 ]] end,
		getPregameLoadingScreenOnly = function() --[[ line: 27 ]]
			return false
		end,
		cleanUp = function() --[[ line: 30 ]] end
	}
end