local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local EngineFeatureEnableDeferredAssetManagerServiceModule = require(ProgressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService)
local DeferredAssetManagerService = if EngineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil
local SignalsModule = require(ProgressLoading.Parent.Signals)

return function(p1)
	-- upvalues: DeferredAssetManagerService (copy), EngineFeatureEnableDeferredAssetManagerServiceModule (copy), SignalsModule (copy)
	local P0 = p1 or DeferredAssetManagerService
	
	if EngineFeatureEnableDeferredAssetManagerServiceModule or p1 ~= nil then
		local Signal, Signal2 = SignalsModule.createSignal((P0:GetPrefetchDownloadStatus()))
		local PrefetchDownloadStatusChangedConnection = P0.PrefetchDownloadStatusChanged:Connect(function(Status)
			-- upvalues: Signal2 (copy)
			Signal2(Status)
		end)
		
		return {
			getDownloadStatus = Signal,
			cleanUp = function()
				-- upvalues: PrefetchDownloadStatusChangedConnection (copy)
				PrefetchDownloadStatusChangedConnection:Disconnect()
			end
		}
	else
		return {
			getDownloadStatus = function() end,
			cleanUp = function() end
		}
	end
end