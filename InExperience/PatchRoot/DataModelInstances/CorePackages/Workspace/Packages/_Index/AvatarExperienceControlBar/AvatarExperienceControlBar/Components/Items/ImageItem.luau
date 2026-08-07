local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local usePulseAnimationBinding = require(parent.AvatarExperienceCommon).Hooks.usePulseAnimationBinding
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local useHoverBindingModule = require(avatarExperienceControlBar.Hooks.useHoverBinding)

return reactModule.forwardRef(function(p0, p1) --[[ line: 25 | named "ImageItem" ]]
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), reactModule (ref), usePulseAnimationBinding (ref), foundationModule (ref)
	local var5 = useSemanticTokensModule()
	local var6, var7 = useHoverBindingModule()
	local var8 = reactModule.useRef(nil)
	local var9 = if p0.size then p0.size else var5.defaultIconContainerSize
	local var10 = usePulseAnimationBinding(p0.enableFocusAnimation)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle",
		ref = p1,
		LayoutOrder = p0.LayoutOrder,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		onStateChanged = var7,
		onActivated = p0.onActivated,
		disabled = p0.disabled,
		Visible = p0.Visible
	}, {
		Thumbnail = reactModule.createElement(foundationModule.Image, {
			tag = "radius-circle",
			Image = p0.thumbnailUrl,
			Size = UDim2.fromOffset(var9, var9),
			backgroundStyle = var6:map(function(p2) --[[ line: 49 ]]
				-- upvalues: var5 (ref)
				return if p2 then var5.hoverThumbnailBackgroundStyle else var5.thumbnailBackgroundStyle
			end)
		}),
		Indicator = if not p0.hideIndicator then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy position-bottom-right anchor-bottom-right bg-surface-300 radius-circle size-400-400",
			ZIndex = 2
		}, {
			IndicatorImage = reactModule.createElement(foundationModule.Image, {
				Image = "icons/actions/truncationExpand_small",
				tag = "radius-circle position-center-center anchor-center-center size-250-250",
				imageStyle = var5.contentForegroundStyle
			})
		}) else nil,
		UIStroke = if p0.enableFocusAnimation then reactModule.createElement("UIStroke", {
			Color = var5.imageBorderFocusStyle,
			Thickness = var10:map(function(p3) --[[ line: 71 ]]
				return p3.thickness
			end),
			Transparency = var10:map(function(p4) --[[ line: 74 ]]
				return p4.transparency
			end),
			ref = var8
		}) else nil
	})
end)