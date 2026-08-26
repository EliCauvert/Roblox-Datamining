local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local omniFeedPropsKey = require(parent.DiscoveryTypes).OmniFeedPropsKey
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local fIntLuaAppDelayImpressionsMaxUpdates = require(parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local sduiV2OmniFeedConstantsModule = require(serverDrivenUi.Migration.SduiV2OmniFeedConstants)

return reactModule.memo(function(p1)
	-- upvalues: omniFeedPropsKey (ref), argCheckModule (ref), reactModule (ref), fIntLuaAppDelayImpressionsMaxUpdates (ref), sduiFeatureEntryPoint (ref), sduiV2OmniFeedConstantsModule (ref)
	local var1 = p1[omniFeedPropsKey]
	local appPage = var1.appPage
	argCheckModule.assert(appPage ~= nil, "appPage must exist")
	argCheckModule.assert(p1.sortIndex ~= nil, "sortIndex must exist")
	argCheckModule.assert(p1.feedItemKey ~= nil and p1.feedItemKey ~= "", "feedItemKey must exist for V2 SDUI omni feed item")
	
	return reactModule.createElement(sduiFeatureEntryPoint, {
		shouldDisplayError = false,
		shouldDisplayLoading = false,
		appPage = appPage,
		configKey = sduiV2OmniFeedConstantsModule.HomeConfigKey,
		identifier = p1.feedItemKey,
		additionalAnalyticsData = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return { collectionPosition = p1.sortIndex }
		end, { p1.sortIndex }),
		extraLocalProps = reactModule.useMemo(function()
			-- upvalues: var1 (ref), fIntLuaAppDelayImpressionsMaxUpdates (copy), p1 (ref)
			return {
				scrollViewPositionChangedSignal = var1.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = var1.verticalScrollingFrameRef,
				startRow = var1.feedItemStartRow,
				numUpdatesToDelayImpressions = fIntLuaAppDelayImpressionsMaxUpdates,
				selectionOrderBase = var1.selectionOrderBase,
				onTileImageLoaded = var1.onTileImageLoaded,
				videoPlaybackContext = var1.videoPlaybackContext,
				index = p1.sortIndex,
				collectionPosition = p1.sortIndex
			}
		end, {
			var1.scrollViewPositionChangedSignal, var1.verticalScrollingFrameRef,
			var1.feedItemStartRow, var1.selectionOrderBase, var1.onTileImageLoaded,
			var1.videoPlaybackContext, p1.sortIndex
		}),
		appCompositionEnabledOverride = var1.appCompositionEnabled == true,
		LayoutOrder = p1.sortIndex
	})
end)