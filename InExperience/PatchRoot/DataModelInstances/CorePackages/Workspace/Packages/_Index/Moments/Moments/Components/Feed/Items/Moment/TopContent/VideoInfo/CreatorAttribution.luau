local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local analytics = require(parent.MomentsCommon).Analytics
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local eventNames = analytics.EventNames
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
local imageWithSkeletonModule = require(moments.Components.ImageWithSkeleton)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local _ = require(script.Parent.Parent.Parent.createMomentStore)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local vector2 = Vector2.new(120, 16)
local t = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
local char = utf8.char(57344)

return reactModule.memo(function(p0) --[[ line: 57 | named "CreatorAttribution" ]]
	-- upvalues: useTokens (ref), momentContextModule (ref), reactModule (ref), reactOtterModule (ref), useUsernameModule (ref), useMomentsHost (ref), fireAnalyticsEvent (ref), eventNames (ref), char (ref), view (ref), stateLayerAffordance (ref), controlState (ref), imageWithSkeletonModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), radius (ref), getColorStyleWithTransparencyModule (ref), t (ref), text (ref), skeleton (ref), vector2 (ref)
	local var11 = useTokens()
	local var12 = momentContextModule.useMoment()
	local data = var12.store.getData(false)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function() --[[ line: 66 ]]
		-- upvalues: var17 (ref), reactOtterModule (copy), var14 (ref)
		var17(reactOtterModule.ease(if var14 then 0.6 else 0, {
			duration = if var14 then 0.05 else 0.03,
			easingStyle = Enum.EasingStyle.Quad
		}))
	end, { var14 })
	local var18 = reactModule.joinBindings({ var12.animationRatio, var16 }):map(function(p1) --[[ line: 74 ]]
		return 1 - (1 - p1[1]) * (1 - p1[2])
	end)
	local var19 = useUsernameModule(data.creatorId)
	local openProfile = useMomentsHost().openProfile
	local var20 = reactModule.useCallback(function() --[[ line: 84 ]]
		-- upvalues: openProfile (ref), fireAnalyticsEvent (copy), eventNames (copy), data (ref)
		if openProfile ~= nil then
			fireAnalyticsEvent(eventNames.ProfileCreatorInfoTapped, { userId = tostring(data.creatorId) })
			openProfile(data.creatorId)
		end
	end, { openProfile, data.creatorId })
	local size800 = var11.Size.Size_800
	local var21 = if var19 and data.creatorIsVerified then `{var19} {char}` else var19
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-small auto-xy",
		LayoutOrder = p0.LayoutOrder,
		stateLayer = { affordance = stateLayerAffordance.None },
		onActivated = if openProfile ~= nil then nil else var20,
		onStateChanged = function(p2) --[[ line: 104 ]]
			-- upvalues: var15 (ref), controlState (copy)
			var15(if p2 ~= controlState.Pressed then p2 == controlState.SelectedPressed else true)
		end
	}, {
		Avatar = reactModule.createElement(imageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = getRbxThumb(thumbnailType.AvatarHeadShot, data.creatorId, thumbnailSize.Medium),
			Size = UDim2.fromOffset(size800, size800),
			radius = radius.Circle,
			backgroundStyle = var18:map(function(p3) --[[ line: 115 ]]
				-- upvalues: getColorStyleWithTransparencyModule (copy), var11 (ref)
				return getColorStyleWithTransparencyModule(var11.Color.Shift.Shift_300, p3)
			end),
			imageStyle = var18:map(function(p4) --[[ line: 118 ]]
				-- upvalues: getColorStyleWithTransparencyModule (copy), t (copy)
				return getColorStyleWithTransparencyModule(t, p4)
			end)
		}),
		Username = if var21 then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-title-large text-align-x-left text-align-y-center text-truncate-end content-emphasis",
			Text = var21,
			textStyle = var18:map(function(p5) --[[ line: 128 ]]
				-- upvalues: getColorStyleWithTransparencyModule (copy), var11 (ref)
				return getColorStyleWithTransparencyModule(var11.Color.Content.Emphasis, p5)
			end)
		}) else reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			radius = radius.Medium,
			Size = UDim2.fromOffset(vector2.X, vector2.Y)
		})
	})
end)