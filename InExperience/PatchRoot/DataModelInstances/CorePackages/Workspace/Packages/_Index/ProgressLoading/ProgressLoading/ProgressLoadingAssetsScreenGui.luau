local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local progressLoadingAssetsModule = require(script.Parent.ProgressLoadingAssets)
local progressLoadingTelemetryModule = require(script.Parent.ProgressLoadingTelemetry)
local getDeferredAssetStoreModule = require(script.Parent.Stores.GetDeferredAssetStore)
local constantsModule = require(script.Parent.Constants)

local function getIsLoadingAssets(value)
	-- upvalues: getDeferredAssetStoreModule (ref)
	local var1 = getDeferredAssetStoreModule(value)
	
	return if var1 then var1.getDownloadStatus(value) == Enum.PrefetchDownloadStatus.InProgress else false
end

return reactModule.memo(function(value)
	-- upvalues: signalsReactModule (ref), getIsLoadingAssets (ref), reactModule (ref), progressLoadingTelemetryModule (ref), constantsModule (ref), progressLoadingAssetsModule (ref)
	local var1 = signalsReactModule.useSignalState(getIsLoadingAssets)
	local var2, var3 = reactModule.useState(var1)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), progressLoadingTelemetryModule (copy), var3 (ref)
		if var1 then
			progressLoadingTelemetryModule.logLoadingAssetsActivated()
			var3(true)
		end
	end, { var1 })
	
	return if var2 then reactModule.createElement("ScreenGui", {
		Enabled = true,
		ClipToDeviceSafeArea = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = value.displayOrder or constantsModule.DISPLAY_ORDER,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		ProgressLoadingAssets = reactModule.createElement(progressLoadingAssetsModule, {
			isVisible = var1,
			onHideComplete = reactModule.useCallback(function()
				-- upvalues: progressLoadingTelemetryModule (copy), var3 (ref)
				progressLoadingTelemetryModule.logLoadingAssetsDeactivated()
				var3(false)
			end, {})
		})
	}) else nil
end)