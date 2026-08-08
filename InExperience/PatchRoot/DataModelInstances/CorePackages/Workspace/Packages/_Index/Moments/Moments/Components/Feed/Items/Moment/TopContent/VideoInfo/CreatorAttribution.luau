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
local imageWithSkeletonModule = require(moments.Components.ImageWithSkeleton)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local _ = require(script.Parent.Parent.Parent.createMomentStore)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local vector2 = Vector2.new(120, 16)
local t = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
local char = utf8.char(57344)

return reactModule.memo(function(p0) --[[ line: 62 | named "CreatorAttribution" ]]
	-- upvalues: useTokens (ref), momentContextModule (ref), reactModule (ref), reactOtterModule (ref), useUsernameModule (ref), getFFlagMomentsCreatorVerifiedBadgeModule (ref), useCreatorVerifiedModule (ref), useMomentsHost (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), makeFeedActionFieldsModule (ref), fireAnalyticsEvent (ref), eventNames (ref), char (ref), view (ref), stateLayerAffordance (ref), controlState (ref), imageWithSkeletonModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), radius (ref), getColorStyleWithTransparencyModule (ref), t (ref), text (ref), skeleton (ref), vector2 (ref)
	local var15 = useTokens()
	local var16 = momentContextModule.useMoment()
	local data = var16.store.getData(false)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function() --[[ line: 71 ]]
		-- upvalues: var21 (ref), reactOtterModule (copy), var18 (ref)
		var21(reactOtterModule.ease(if var18 then 0.6 else 0, {
			duration = if var18 then 0.05 else 0.03,
			easingStyle = Enum.EasingStyle.Quad
		}))
	end, { var18 })
	local var22 = reactModule.joinBindings({ var16.animationRatio, var20 }):map(function(p1) --[[ line: 79 ]]
		return 1 - (1 - p1[1]) * (1 - p1[2])
	end)
	local var23 = useUsernameModule(data.creatorId)
	local var24 = if getFFlagMomentsCreatorVerifiedBadgeModule() then useCreatorVerifiedModule(data.creatorId) else data.creatorIsVerified
	local openProfile = useMomentsHost().openProfile
	local var25 = reactModule.useCallback(function() --[[ line: 106 ]]
		-- upvalues: openProfile (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), makeFeedActionFieldsModule (copy), data (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if openProfile ~= nil then
			if getFFlagMomentsAnalyticsSchemaIdentity() then
				local var27 = makeFeedActionFieldsModule(data.momentId, data.feedItemId, data.feedSessionId)
				
				if var27 ~= nil then
					fireAnalyticsEvent(eventNames.ProfileCreatorInfoTapped, var27)
				end
			else
				fireAnalyticsEvent(eventNames.ProfileCreatorInfoTapped, { userId = tostring(data.creatorId) })
			end
			openProfile(data.creatorId)
		end
	end, if getFFlagMomentsAnalyticsSchemaIdentity() then {
		openProfile,
		data.creatorId,
		data.momentId,
		data.feedItemId,
		data.feedSessionId
	} else { openProfile, data.creatorId })
	local size800 = var15.Size.Size_800
	local var26 = if var23 and var24 then `{var23} {char}` else var23
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-small auto-xy",
		LayoutOrder = p0.LayoutOrder,
		stateLayer = { affordance = stateLayerAffordance.None },
		onActivated = if openProfile ~= nil then nil else var25,
		onStateChanged = function(p2) --[[ line: 145 ]]
			-- upvalues: var19 (ref), controlState (copy)
			var19(if p2 ~= controlState.Pressed then p2 == controlState.SelectedPressed else true)
		end
	}, {
		Avatar = reactModule.createElement(imageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = getRbxThumb(thumbnailType.AvatarHeadShot, data.creatorId, thumbnailSize.Medium),
			Size = UDim2.fromOffset(size800, size800),
			radius = radius.Circle,
			backgroundStyle = var22:map(function(p3) --[[ line: 156 ]]
				-- upvalues: getColorStyleWithTransparencyModule (copy), var15 (ref)
				return getColorStyleWithTransparencyModule(var15.Color.Shift.Shift_300, p3)
			end),
			imageStyle = var22:map(function(p4) --[[ line: 159 ]]
				-- upvalues: getColorStyleWithTransparencyModule (copy), t (copy)
				return getColorStyleWithTransparencyModule(t, p4)
			end)
		}),
		Username = if var26 then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-title-large text-align-x-left text-align-y-center text-truncate-end content-emphasis",
			Text = var26,
			textStyle = var22:map(function(p5) --[[ line: 169 ]]
				-- upvalues: getColorStyleWithTransparencyModule (copy), var15 (ref)
				return getColorStyleWithTransparencyModule(var15.Color.Content.Emphasis, p5)
			end)
		}) else reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			radius = radius.Medium,
			Size = UDim2.fromOffset(vector2.X, vector2.Y)
		})
	})
end)