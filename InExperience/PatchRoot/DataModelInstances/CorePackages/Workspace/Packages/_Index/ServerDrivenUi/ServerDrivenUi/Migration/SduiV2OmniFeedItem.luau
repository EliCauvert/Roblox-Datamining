local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local OmniFeedPropsKey = require(Parent.DiscoveryTypes).OmniFeedPropsKey
local SduiFeatureEntryPoint = require(Parent.SduiSharedUtilities).SduiFeatureEntryPoint
local FIntLuaAppDelayImpressionsMaxUpdates = require(Parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local SduiV2OmniFeedConstantsModule = require(ServerDrivenUi.Migration.SduiV2OmniFeedConstants)

return ReactModule.memo(function(p1) --[[ Line: 29 | Named "SduiV2OmniFeedItem" ]]
	-- upvalues: OmniFeedPropsKey (copy), ArgCheckModule (copy), ReactModule (copy), FIntLuaAppDelayImpressionsMaxUpdates (copy), SduiFeatureEntryPoint (copy), SduiV2OmniFeedConstantsModule (copy)
	local v1 = p1[OmniFeedPropsKey]
	local AppPage = v1.appPage
	ArgCheckModule.assert(AppPage ~= nil, "appPage must exist")
	ArgCheckModule.assert(p1.sortIndex ~= nil, "sortIndex must exist")
	ArgCheckModule.assert(p1.feedItemKey ~= nil and p1.feedItemKey ~= "", "feedItemKey must exist for V2 SDUI omni feed item")
	
	return ReactModule.createElement(SduiFeatureEntryPoint, {
		shouldDisplayError = false,
		shouldDisplayLoading = false,
		appPage = AppPage,
		configKey = SduiV2OmniFeedConstantsModule.HomeConfigKey,
		identifier = p1.feedItemKey,
		additionalAnalyticsData = ReactModule.useMemo(function() --[[ Line: 39 ]]
			-- upvalues: p1 (copy)
			return { collectionPosition = p1.sortIndex }
		end, { p1.sortIndex }),
		extraLocalProps = ReactModule.useMemo(function() --[[ Line: 46 ]]
			-- upvalues: v1 (copy), FIntLuaAppDelayImpressionsMaxUpdates (upval), p1 (copy)
			return {
				scrollViewPositionChangedSignal = v1.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = v1.verticalScrollingFrameRef,
				startRow = v1.feedItemStartRow,
				numUpdatesToDelayImpressions = FIntLuaAppDelayImpressionsMaxUpdates,
				selectionOrderBase = v1.selectionOrderBase,
				videoPlaybackContext = v1.videoPlaybackContext,
				index = p1.sortIndex,
				collectionPosition = p1.sortIndex
			}
		end, {
			v1.scrollViewPositionChangedSignal, v1.verticalScrollingFrameRef,
			v1.feedItemStartRow, v1.selectionOrderBase, v1.videoPlaybackContext,
			p1.sortIndex
		}),
		appCompositionEnabledOverride = v1.appCompositionEnabled == true,
		LayoutOrder = p1.sortIndex
	})
end)