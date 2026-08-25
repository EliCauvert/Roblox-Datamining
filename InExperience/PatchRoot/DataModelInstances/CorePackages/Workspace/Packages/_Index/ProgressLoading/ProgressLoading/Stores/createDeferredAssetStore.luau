local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local engineFeatureEnableDeferredAssetManagerServiceModule = require(progressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService)
local var2 = if engineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil
local signalsModule = require(parent.Signals)

return function(value)
	-- upvalues: var2 (ref), engineFeatureEnableDeferredAssetManagerServiceModule (ref), signalsModule (ref)
	local value_1 = value or var2
	
	if engineFeatureEnableDeferredAssetManagerServiceModule or value ~= nil then
		local var5, var6 = signalsModule.createSignal(value_1:GetPrefetchDownloadStatus())
		local prefetchDownloadStatusChangedConnection = value_1.PrefetchDownloadStatusChanged:Connect(function(p0)
			-- upvalues: var6 (ref)
			var6(p0)
		end)
		local var8, var9 = signalsModule.createSignal(value_1.PregameLoadingScreenOnly)
		local var10 = value_1:GetPropertyChangedSignal("PregameLoadingScreenOnly"):Connect(function()
			-- upvalues: var9 (ref), value_1 (ref)
			var9(value_1.PregameLoadingScreenOnly)
		end)
		
		return {
			getDownloadStatus = var5,
			getPregameLoadingScreenOnly = var8,
			cleanUp = function()
				-- upvalues: prefetchDownloadStatusChangedConnection (ref), var10 (ref)
				prefetchDownloadStatusChangedConnection:Disconnect()
				var10:Disconnect()
			end
		}
	end
	return {
		getDownloadStatus = function() end,
		getPregameLoadingScreenOnly = function()
			return false
		end,
		cleanUp = function() end
	}
end