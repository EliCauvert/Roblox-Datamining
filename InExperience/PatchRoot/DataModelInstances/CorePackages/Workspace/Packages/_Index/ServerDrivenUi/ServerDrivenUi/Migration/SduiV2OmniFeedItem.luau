local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local omniFeedPropsKey = require(parent.DiscoveryTypes).OmniFeedPropsKey
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local fIntLuaAppDelayImpressionsMaxUpdates = require(parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local sduiV2OmniFeedConstantsModule = require(serverDrivenUi.Migration.SduiV2OmniFeedConstants)

return reactModule.memo(function(p0) --[[ line: 30 | named "SduiV2OmniFeedItem" ]]
	-- upvalues: omniFeedPropsKey (ref), argCheckModule (ref), reactModule (ref), fIntLuaAppDelayImpressionsMaxUpdates (ref), sduiFeatureEntryPoint (ref), sduiV2OmniFeedConstantsModule (ref)
	local var4 = p0[omniFeedPropsKey]
	local appPage = var4.appPage
	argCheckModule.assert(appPage ~= nil, "appPage must exist")
	argCheckModule.assert(p0.sortIndex ~= nil, "sortIndex must exist")
	argCheckModule.assert(p0.feedItemKey ~= nil and p0.feedItemKey ~= "", "feedItemKey must exist for V2 SDUI omni feed item")
	
	return reactModule.createElement(sduiFeatureEntryPoint, {
		shouldDisplayError = false,
		shouldDisplayLoading = false,
		appPage = appPage,
		configKey = sduiV2OmniFeedConstantsModule.HomeConfigKey,
		identifier = p0.feedItemKey,
		additionalAnalyticsData = reactModule.useMemo(function() --[[ line: 40 ]]
			-- upvalues: p0 (ref)
			return { collectionPosition = p0.sortIndex }
		end, { p0.sortIndex }),
		extraLocalProps = reactModule.useMemo(function() --[[ line: 47 ]]
			-- upvalues: var4 (ref), fIntLuaAppDelayImpressionsMaxUpdates (copy), p0 (ref)
			return {
				scrollViewPositionChangedSignal = var4.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = var4.verticalScrollingFrameRef,
				startRow = var4.feedItemStartRow,
				numUpdatesToDelayImpressions = fIntLuaAppDelayImpressionsMaxUpdates,
				selectionOrderBase = var4.selectionOrderBase,
				onTileImageLoaded = var4.onTileImageLoaded,
				videoPlaybackContext = var4.videoPlaybackContext,
				index = p0.sortIndex,
				collectionPosition = p0.sortIndex
			}
		end, {
			var4.scrollViewPositionChangedSignal, var4.verticalScrollingFrameRef,
			var4.feedItemStartRow, var4.selectionOrderBase, var4.onTileImageLoaded,
			var4.videoPlaybackContext, p0.sortIndex
		}),
		appCompositionEnabledOverride = var4.appCompositionEnabled == true,
		LayoutOrder = p0.sortIndex
	})
end)