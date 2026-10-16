local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local ToMediaItemModule = require(Parent.Moments.ToMediaItem)
local MomentEngagementCountModule = require(script.Parent.MomentEngagementCount)
local FFlagProfileMomentsOrderingAndReactions = require(Parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions
local FFlagMomentsEngagementMetricsFeature = MomentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Analytics = MomentsCommonModule.Analytics
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local EventNames = Analytics.EventNames
local MakeProfileTileFieldsModule = require(ProfilePlatform.Analytics.makeProfileTileFields)
local MomentMediaTile = MomentsCommonModule.Media.MomentMediaTile
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local ThumbUp = require(Parent.BuilderIcons).Icon.ThumbUp

return function(p1) --[[ Line: 52 | Named "MomentGridItem" ]]
	-- upvalues: UseTokensFunction (copy), FFlagMomentsEngagementMetricsFeature (copy), UseSignalStateFunction (copy), GetMomentsCapabilitiesFunction (copy), ReactModule (copy), MakeProfileTileFieldsModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), ToMediaItemModule (copy), ControlState (copy), FFlagProfileMomentsOrderingAndReactions (copy), View (copy), StateLayerAffordance (copy), MomentMediaTile (copy), GradientBackdrop (copy), MomentEngagementCountModule (copy), ThumbUp (copy)
	local Moment = p1.moment
	local OnHoverChangedFunction = p1.onHoverChanged
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = if FFlagMomentsEngagementMetricsFeature then UseSignalStateFunction(GetMomentsCapabilitiesFunction(false).getIsEngagementMetricsEnabled) else nil
	ReactModule.useEffect(function() --[[ Line: 64 ]]
		-- upvalues: p1 (copy), Moment (copy), MakeProfileTileFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		if p1.userId and Moment.recommendationMetadata then
			local Grid = MakeProfileTileFieldsModule.makeProfileTileImpressionFields(Moment, p1.userId, "grid", p1.index or 0)
			
			if Grid then
				FireAnalyticsEventFunction(EventNames.ProfileMomentTileImpression, Grid)
			end
		end
	end, {})
	local NoFFlagProfileMomentsOrderingAndReactions: boolean = if FFlagMomentsEngagementMetricsFeature then UseSignalStateResult and (not FFlagProfileMomentsOrderingAndReactions or Moment.metadata.likeCount ~= nil and Moment.metadata.likeCount > 0) else not FFlagProfileMomentsOrderingAndReactions or Moment.metadata.likeCount ~= nil and Moment.metadata.likeCount > 0
	
	return ReactModule.createElement(View, {
		tag = "clip",
		Size = UDim2.fromScale(1, 1),
		onActivated = p1.onActivated,
		onStateChanged = ReactModule.useCallback(function(Hover) --[[ Line: 82 ]]
			-- upvalues: OnHoverChangedFunction (copy), ControlState (upval)
			OnHoverChangedFunction(Hover == ControlState.Hover)
		end, { OnHoverChangedFunction }),
		stateLayer = { affordance = StateLayerAffordance.None }
	}, {
		Media = ReactModule.createElement(MomentMediaTile, {
			mediaItem = ReactModule.useMemo(function() --[[ Line: 78 ]]
				-- upvalues: ToMediaItemModule (upval), Moment (copy)
				return (ToMediaItemModule({ kind = "moment", moment = Moment }))
			end, { Moment.momentId }),
			isActive = p1.isActive
		}),
		BottomGradient = if NoFFlagProfileMomentsOrderingAndReactions then ReactModule.createElement(GradientBackdrop, {
			rotation = -90,
			startingTransparency = 0,
			zIndex = 2,
			anchorPoint = Vector2.new(0, 1),
			color3 = UseTokensResult.Color.Common.Scrim.Color3,
			position = UDim2.fromScale(0, 1),
			size = UDim2.fromScale(1, 0.5)
		}) else nil,
		Engagement = if NoFFlagProfileMomentsOrderingAndReactions then ReactModule.createElement(View, {
			tag = "row align-x-right align-y-center gap-small position-bottom-right anchor-bottom-right auto-xy padding-small",
			ZIndex = 3
		}, {
			Reactions = ReactModule.createElement(MomentEngagementCountModule, {
				layoutOrder = 1,
				onMedia = true,
				icon = ThumbUp,
				count = Moment.metadata.likeCount
			})
		}) else nil
	})
end