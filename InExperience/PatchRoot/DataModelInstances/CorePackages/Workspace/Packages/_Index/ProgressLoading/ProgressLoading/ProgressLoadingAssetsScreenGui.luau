local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ProgressLoadingAssetsModule = require(script.Parent.ProgressLoadingAssets)
local ProgressLoadingTelemetryModule = require(script.Parent.ProgressLoadingTelemetry)
local GetDeferredAssetStoreModule = require(script.Parent.Stores.GetDeferredAssetStore)
local ConstantsModule = require(script.Parent.Constants)

local function getIsLoadingAssets(p1): boolean --[[ Line: 14 ]]
	-- upvalues: GetDeferredAssetStoreModule (copy)
	local DeferredAssetStoreModule = GetDeferredAssetStoreModule(p1)
	
	return if DeferredAssetStoreModule then DeferredAssetStoreModule.getDownloadStatus(p1) == Enum.PrefetchDownloadStatus.InProgress else false
end

return ReactModule.memo(function(p1) --[[ Line: 28 | Named "ProgressLoadingAssetsScreenGui" ]]
	-- upvalues: SignalsReactModule (copy), getIsLoadingAssets (copy), ReactModule (copy), ProgressLoadingTelemetryModule (copy), ConstantsModule (copy), ProgressLoadingAssetsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(getIsLoadingAssets)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSignalStateResult)
	ReactModule.useEffect(function() --[[ Line: 32 ]]
		-- upvalues: UseSignalStateResult (copy), ProgressLoadingTelemetryModule (upval), UseStateResult2 (copy)
		if UseSignalStateResult then
			ProgressLoadingTelemetryModule.logLoadingAssetsActivated()
			UseStateResult2(true)
		end
	end, { UseSignalStateResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 39 ]]
		-- upvalues: ProgressLoadingTelemetryModule (upval), UseStateResult2 (copy)
		ProgressLoadingTelemetryModule.logLoadingAssetsDeactivated()
		UseStateResult2(false)
	end, {})
	
	return if UseStateResult then ReactModule.createElement("ScreenGui", {
		Enabled = true,
		ClipToDeviceSafeArea = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = p1.displayOrder or ConstantsModule.DISPLAY_ORDER,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		ProgressLoadingAssets = ReactModule.createElement(ProgressLoadingAssetsModule, {
			isVisible = UseSignalStateResult,
			onHideComplete = UseResult
		})
	}) else nil
end)