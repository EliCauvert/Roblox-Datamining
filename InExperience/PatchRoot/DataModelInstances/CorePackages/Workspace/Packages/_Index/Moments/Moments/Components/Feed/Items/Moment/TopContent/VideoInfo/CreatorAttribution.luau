local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local momentsCommonModule = require(parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local eventNames = analytics.EventNames
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity
local makeFeedActionFieldsModule = require(moments.Analytics.makeFeedActionFields)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local controlState = foundationModule.Enums.ControlState
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local getRbxThumb = foundationModule.Utility.getRbxThumb
local useTokens = foundationModule.Hooks.useTokens
local useUsernameModule = require(moments.Hooks.useUsername)
local useCreatorVerifiedModule = require(moments.Hooks.useCreatorVerified)
local getFFlagMomentsCreatorVerifiedBadgeModule = require(moments.Flags.GetFFlagMomentsCreatorVerifiedBadge)
local fFlagMomentsFlushDwellBeforeNavigationModule = require(moments.Flags.FFlagMomentsFlushDwellBeforeNavigation)
local imageWithSkeletonModule = require(moments.Components.ImageWithSkeleton)
local feedContextModule = require(moments.Components.Feed.FeedContext)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local _ = require(script.Parent.Parent.Parent.createMomentStore)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local vector2 = Vector2.new(120, 16)
local t = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
local char = utf8.char(57344)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), momentContextModule (ref), reactModule (ref), reactOtterModule (ref), useUsernameModule (ref), getFFlagMomentsCreatorVerifiedBadgeModule (ref), useCreatorVerifiedModule (ref), useMomentsHost (ref), fFlagMomentsFlushDwellBeforeNavigationModule (ref), feedContextModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), makeFeedActionFieldsModule (ref), fireAnalyticsEvent (ref), eventNames (ref), char (ref), view (ref), stateLayerAffordance (ref), controlState (ref), imageWithSkeletonModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), radius (ref), getColorStyleWithTransparencyModule (ref), t (ref), text (ref), skeleton (ref), vector2 (ref)
	local var1 = useTokens()
	local var2 = momentContextModule.useMoment()
	local data = var2.store.getData(false)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), reactOtterModule (copy), var3 (ref)
		var6(reactOtterModule.ease(if var3 then 0.6 else 0, {
			duration = if var3 then 0.05 else 0.03,
			easingStyle = Enum.EasingStyle.Quad
		}))
	end, { var3 })
	local var7 = reactModule.joinBindings({ var2.animationRatio, var5 }):map(function(p2)
		return 1 - (1 - p2[1]) * (1 - p2[2])
	end)
	local var8 = useUsernameModule(data.creatorId)
	local var9 = if getFFlagMomentsCreatorVerifiedBadgeModule() then useCreatorVerifiedModule(data.creatorId) else data.creatorIsVerified
	local openProfile = useMomentsHost().openProfile
	local var10 = if fFlagMomentsFlushDwellBeforeNavigationModule then feedContextModule.useFeedOptional() else nil
	local var11 = reactModule.useCallback(function()
		-- upvalues: openProfile (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), makeFeedActionFieldsModule (copy), data (ref), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsFlushDwellBeforeNavigationModule (copy), var10 (write)
		if openProfile ~= nil then
			if getFFlagMomentsAnalyticsSchemaIdentity() then
				local var12 = makeFeedActionFieldsModule(data.momentId, data.feedItemId, data.feedSessionId)
				
				if var12 ~= nil then
					fireAnalyticsEvent(eventNames.ProfileCreatorInfoTapped, var12)
				end
			else
				fireAnalyticsEvent(eventNames.ProfileCreatorInfoTapped, { userId = tostring(data.creatorId) })
			end
			if fFlagMomentsFlushDwellBeforeNavigationModule and var10 ~= nil then
				var10.flushView()
			end
			openProfile(data.creatorId)
		end
	end, if fFlagMomentsFlushDwellBeforeNavigationModule then if getFFlagMomentsAnalyticsSchemaIdentity() then {
		openProfile, var10, data.creatorId, data.momentId, data.feedItemId,
		data.feedSessionId
	} else { openProfile, var10, data.creatorId } elseif getFFlagMomentsAnalyticsSchemaIdentity() then {
		openProfile,
		data.creatorId,
		data.momentId,
		data.feedItemId,
		data.feedSessionId
	} else { openProfile, data.creatorId })
	local size800 = var1.Size.Size_800
	local var12 = if var8 and var9 then `{var8} {char}` else var8
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-small auto-xy",
		LayoutOrder = p1.LayoutOrder,
		testId = if fFlagMomentsFlushDwellBeforeNavigationModule then "--moments-creator-attribution" else nil,
		stateLayer = { affordance = stateLayerAffordance.None },
		onActivated = if openProfile ~= nil then nil else var11,
		onStateChanged = function(p2)
			-- upvalues: var4 (ref), controlState (copy)
			var4(if p2 ~= controlState.Pressed then p2 == controlState.SelectedPressed else true)
		end
	}, {
		Avatar = reactModule.createElement(imageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = getRbxThumb(thumbnailType.AvatarHeadShot, data.creatorId, thumbnailSize.Medium),
			Size = UDim2.fromOffset(size800, size800),
			radius = radius.Circle,
			backgroundStyle = var7:map(function(p2)
				-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
				return getColorStyleWithTransparencyModule(var1.Color.Shift.Shift_300, p2)
			end),
			imageStyle = var7:map(function(p2)
				-- upvalues: getColorStyleWithTransparencyModule (copy), t (copy)
				return getColorStyleWithTransparencyModule(t, p2)
			end)
		}),
		Username = if var12 then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-title-large text-align-x-left text-align-y-center text-truncate-end content-emphasis",
			Text = var12,
			textStyle = var7:map(function(p2)
				-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
				return getColorStyleWithTransparencyModule(var1.Color.Content.Emphasis, p2)
			end)
		}) else reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			radius = radius.Medium,
			Size = UDim2.fromOffset(vector2.X, vector2.Y)
		})
	})
end)