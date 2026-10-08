local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local signalsReactModule = require(parent.SignalsReact)
local toMediaItemModule = require(parent.Moments.ToMediaItem)
local momentEngagementCountModule = require(script.Parent.MomentEngagementCount)
local fFlagProfileMomentsOrderingAndReactions = require(parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions
local fFlagMomentsEngagementMetricsFeature = momentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
local analytics = momentsCommonModule.Analytics
local getMomentsCapabilities = momentsCommonModule.Stores.GetMomentsCapabilities
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local eventNames = analytics.EventNames
local makeProfileTileFieldsModule = require(profilePlatform.Analytics.makeProfileTileFields)
local momentMediaTile = momentsCommonModule.Media.MomentMediaTile
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local thumbUp = builderIconsModule.Icon.ThumbUp

return function(p1)
	-- upvalues: useTokens (ref), fFlagMomentsEngagementMetricsFeature (ref), useSignalState (ref), getMomentsCapabilities (ref), reactModule (ref), makeProfileTileFieldsModule (ref), fireAnalyticsEvent (ref), eventNames (ref), toMediaItemModule (ref), controlState (ref), fFlagProfileMomentsOrderingAndReactions (ref), view (ref), stateLayerAffordance (ref), momentMediaTile (ref), gradientBackdrop (ref), momentEngagementCountModule (ref), thumbUp (ref)
	local var1
	local moment = p1.moment
	local onHoverChanged = p1.onHoverChanged
	local var2 = useTokens()
	local var3 = if fFlagMomentsEngagementMetricsFeature then useSignalState(getMomentsCapabilities(false).getIsEngagementMetricsEnabled) else nil
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), moment (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if p1.userId and moment.recommendationMetadata then
			local grid = makeProfileTileFieldsModule.makeProfileTileImpressionFields(moment, p1.userId, "grid", p1.index or 0)
			
			if grid then
				fireAnalyticsEvent(eventNames.ProfileMomentTileImpression, grid)
			end
		end
	end, {})
	local var4 = reactModule.useMemo(function()
		-- upvalues: toMediaItemModule (copy), moment (ref)
		return toMediaItemModule({ kind = "moment", moment = moment })
	end, { moment.momentId })
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: onHoverChanged (ref), controlState (copy)
		onHoverChanged(p2 == controlState.Hover)
	end, { onHoverChanged })
	
	if fFlagMomentsEngagementMetricsFeature then
		var1 = var3
		
		if var1 then
			if fFlagProfileMomentsOrderingAndReactions then
				var1 = false
				
				if moment.metadata.likeCount ~= nil then
					var1 = moment.metadata.likeCount > 0
					var1 = nil
				end
			else
				var1 = true
			end
		end
		return reactModule.createElement(view, {
			tag = "clip",
			Size = UDim2.fromScale(1, 1),
			onActivated = p1.onActivated,
			onStateChanged = var5,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Media = reactModule.createElement(momentMediaTile, { mediaItem = var4, isActive = p1.isActive }),
			BottomGradient = if var1 then reactModule.createElement(gradientBackdrop, {
				rotation = -90,
				startingTransparency = 0,
				zIndex = 2,
				anchorPoint = Vector2.new(0, 1),
				color3 = var2.Color.Common.Scrim.Color3,
				position = UDim2.fromScale(0, 1),
				size = UDim2.fromScale(1, 0.5)
			}) else nil,
			Engagement = if var1 then reactModule.createElement(view, {
				tag = "row align-x-right align-y-center gap-small position-bottom-right anchor-bottom-right auto-xy padding-small",
				ZIndex = 3
			}, {
				Reactions = reactModule.createElement(momentEngagementCountModule, {
					layoutOrder = 1,
					onMedia = true,
					icon = thumbUp,
					count = moment.metadata.likeCount
				})
			}) else nil
		})
	end
end