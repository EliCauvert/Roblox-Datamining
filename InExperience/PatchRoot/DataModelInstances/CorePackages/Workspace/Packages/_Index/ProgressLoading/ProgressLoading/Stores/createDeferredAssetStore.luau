local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local engineFeatureEnableDeferredAssetManagerServiceModule = require(progressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService)
local var1 = if engineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil
local signalsModule = require(parent.Signals)

return function(value)
	-- upvalues: var1 (ref), engineFeatureEnableDeferredAssetManagerServiceModule (ref), signalsModule (ref)
	local value_1 = value or var1
	
	if engineFeatureEnableDeferredAssetManagerServiceModule or value ~= nil then
		local var2, var3 = signalsModule.createSignal(value_1:GetPrefetchDownloadStatus())
		local prefetchDownloadStatusChangedConnection = value_1.PrefetchDownloadStatusChanged:Connect(function(p1)
			-- upvalues: var3 (ref)
			var3(p1)
		end)
		local var4, var5 = signalsModule.createSignal(value_1.PregameLoadingScreenOnly)
		local var6 = value_1:GetPropertyChangedSignal("PregameLoadingScreenOnly"):Connect(function()
			-- upvalues: var5 (ref), value_1 (ref)
			var5(value_1.PregameLoadingScreenOnly)
		end)
		
		return {
			getDownloadStatus = var2,
			getPregameLoadingScreenOnly = var4,
			cleanUp = function()
				-- upvalues: prefetchDownloadStatusChangedConnection (ref), var6 (ref)
				prefetchDownloadStatusChangedConnection:Disconnect()
				var6:Disconnect()
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