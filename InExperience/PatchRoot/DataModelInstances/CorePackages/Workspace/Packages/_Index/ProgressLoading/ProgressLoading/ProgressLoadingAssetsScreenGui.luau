local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local progressLoadingAssetsModule = require(script.Parent.ProgressLoadingAssets)
local progressLoadingTelemetryModule = require(script.Parent.ProgressLoadingTelemetry)
local getDeferredAssetStoreModule = require(script.Parent.Stores.GetDeferredAssetStore)
local constantsModule = require(script.Parent.Constants)

local function getIsLoadingAssets(value) --[[ line: 14 ]]
	-- upvalues: getDeferredAssetStoreModule (ref)
	local var7 = getDeferredAssetStoreModule(value)
	
	return if var7 then var7.getDownloadStatus(value) == Enum.PrefetchDownloadStatus.InProgress else false
end

return reactModule.memo(function(value) --[[ line: 28 | named "ProgressLoadingAssetsScreenGui" ]]
	-- upvalues: signalsReactModule (ref), getIsLoadingAssets (ref), reactModule (ref), progressLoadingTelemetryModule (ref), constantsModule (ref), progressLoadingAssetsModule (ref)
	local var8 = signalsReactModule.useSignalState(getIsLoadingAssets)
	local var9, var10 = reactModule.useState(var8)
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: var8 (ref), progressLoadingTelemetryModule (copy), var10 (ref)
		if var8 then
			progressLoadingTelemetryModule.logLoadingAssetsActivated()
			var10(true)
		end
	end, { var8 })
	
	return if var9 then reactModule.createElement("ScreenGui", {
		Enabled = true,
		ClipToDeviceSafeArea = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = value.displayOrder or constantsModule.DISPLAY_ORDER,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		ProgressLoadingAssets = reactModule.createElement(progressLoadingAssetsModule, {
			isVisible = var8,
			onHideComplete = reactModule.useCallback(function() --[[ line: 39 ]]
				-- upvalues: progressLoadingTelemetryModule (copy), var10 (ref)
				progressLoadingTelemetryModule.logLoadingAssetsDeactivated()
				var10(false)
			end, {})
		})
	}) else nil
end)