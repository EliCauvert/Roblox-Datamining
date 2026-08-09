local parent = script:FindFirstAncestor("ProfilePlatform").Parent
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
local momentMediaTile = momentsCommonModule.Media.MomentMediaTile
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local thumbUp = builderIconsModule.Icon.ThumbUp

return function(p0) --[[ line: 47 | named "MomentGridItem" ]]
	-- upvalues: useTokens (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), toMediaItemModule (ref), controlState (ref), fFlagProfileMomentsOrderingAndReactions (ref), view (ref), stateLayerAffordance (ref), momentMediaTile (ref), gradientBackdrop (ref), momentEngagementCountModule (ref), thumbUp (ref)
	local var9
	local moment = p0.moment
	local onHoverChanged = p0.onHoverChanged
	local var6 = useTokens()
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: p0 (ref), moment (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if p0.userId and moment.recommendationMetadata then
			fireAnalyticsEvent(eventNames.ProfileMomentTileImpression, {
				userId = p0.userId,
				itemId = moment.recommendationMetadata.itemId or "",
				gridIndex = tostring(p0.index or 0)
			})
		end
	end, {})
	local var7 = reactModule.useMemo(function() --[[ line: 67 ]]
		-- upvalues: toMediaItemModule (copy), moment (ref)
		return toMediaItemModule({ kind = "moment", moment = moment })
	end, { moment.momentId })
	local var8 = reactModule.useCallback(function(p1) --[[ line: 71 ]]
		-- upvalues: onHoverChanged (ref), controlState (copy)
		onHoverChanged(p1 == controlState.Hover)
	end, { onHoverChanged })
	
	if fFlagProfileMomentsOrderingAndReactions then
		var9 = false
		
		if moment.metadata.likeCount ~= nil then
			local _ = moment.metadata.likeCount > 0
		end
	else
		var9 = true
	end
	return reactModule.createElement(view, {
		tag = "clip",
		Size = UDim2.fromScale(1, 1),
		onActivated = p0.onActivated,
		onStateChanged = var8,
		stateLayer = { affordance = stateLayerAffordance.None }
	}, {
		Media = reactModule.createElement(momentMediaTile, { mediaItem = var7, isActive = p0.isActive }),
		BottomGradient = if var9 then reactModule.createElement(gradientBackdrop, {
			rotation = -90,
			startingTransparency = 0,
			zIndex = 2,
			anchorPoint = Vector2.new(0, 1),
			color3 = var6.Color.Common.Scrim.Color3,
			position = UDim2.fromScale(0, 1),
			size = UDim2.fromScale(1, 0.5)
		}) else nil,
		Engagement = if var9 then reactModule.createElement(view, {
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