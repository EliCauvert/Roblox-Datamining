local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local toMediaItemModule = require(parent.Moments.ToMediaItem)
local momentEngagementCountModule = require(script.Parent.MomentEngagementCount)
local fFlagProfileMomentsOrderingAndReactions = require(parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local analytics = momentsCommonModule.Analytics
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local eventNames = analytics.EventNames
local makeProfileTileFieldsModule = require(profilePlatform.Analytics.makeProfileTileFields)
local momentMediaTile = momentsCommonModule.Media.MomentMediaTile
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local thumbUp = builderIconsModule.Icon.ThumbUp

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), makeProfileTileFieldsModule (ref), fireAnalyticsEvent (ref), eventNames (ref), toMediaItemModule (ref), controlState (ref), fFlagProfileMomentsOrderingAndReactions (ref), view (ref), stateLayerAffordance (ref), momentMediaTile (ref), gradientBackdrop (ref), momentEngagementCountModule (ref), thumbUp (ref)
	local var11
	local moment = p0.moment
	local onHoverChanged = p0.onHoverChanged
	local var8 = useTokens()
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), moment (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if p0.userId and moment.recommendationMetadata then
			local grid = makeProfileTileFieldsModule.makeProfileTileImpressionFields(moment, p0.userId, "grid", p0.index or 0)
			
			if grid then
				fireAnalyticsEvent(eventNames.ProfileMomentTileImpression, grid)
			end
		end
	end, {})
	local var9 = reactModule.useMemo(function()
		-- upvalues: toMediaItemModule (copy), moment (ref)
		return toMediaItemModule({ kind = "moment", moment = moment })
	end, { moment.momentId })
	local var10 = reactModule.useCallback(function(p1)
		-- upvalues: onHoverChanged (ref), controlState (copy)
		onHoverChanged(p1 == controlState.Hover)
	end, { onHoverChanged })
	
	if fFlagProfileMomentsOrderingAndReactions then
		var11 = false
		
		if moment.metadata.likeCount ~= nil then
			local _ = moment.metadata.likeCount > 0
		end
	else
		var11 = true
	end
	return reactModule.createElement(view, {
		tag = "clip",
		Size = UDim2.fromScale(1, 1),
		onActivated = p0.onActivated,
		onStateChanged = var10,
		stateLayer = { affordance = stateLayerAffordance.None }
	}, {
		Media = reactModule.createElement(momentMediaTile, { mediaItem = var9, isActive = p0.isActive }),
		BottomGradient = if var11 then reactModule.createElement(gradientBackdrop, {
			rotation = -90,
			startingTransparency = 0,
			zIndex = 2,
			anchorPoint = Vector2.new(0, 1),
			color3 = var8.Color.Common.Scrim.Color3,
			position = UDim2.fromScale(0, 1),
			size = UDim2.fromScale(1, 0.5)
		}) else nil,
		Engagement = if var11 then reactModule.createElement(view, {
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