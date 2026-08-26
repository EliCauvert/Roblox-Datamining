local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local usePulseAnimationBinding = require(parent.AvatarExperienceCommon).Hooks.usePulseAnimationBinding
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local useHoverBindingModule = require(avatarExperienceControlBar.Hooks.useHoverBinding)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), reactModule (ref), usePulseAnimationBinding (ref), foundationModule (ref)
	local var1 = useSemanticTokensModule()
	local var2, var3 = useHoverBindingModule()
	local var4 = reactModule.useRef(nil)
	local var5 = if p1.size then p1.size else var1.defaultIconContainerSize
	local var6 = usePulseAnimationBinding(p1.enableFocusAnimation)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle",
		ref = p2,
		LayoutOrder = p1.LayoutOrder,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		onStateChanged = var3,
		onActivated = p1.onActivated,
		disabled = p1.disabled,
		Visible = p1.Visible
	}, {
		Thumbnail = reactModule.createElement(foundationModule.Image, {
			tag = "radius-circle",
			Image = p1.thumbnailUrl,
			Size = UDim2.fromOffset(var5, var5),
			backgroundStyle = var2:map(function(p3)
				-- upvalues: var1 (ref)
				return if p3 then var1.hoverThumbnailBackgroundStyle else var1.thumbnailBackgroundStyle
			end)
		}),
		Indicator = if not p1.hideIndicator then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy position-bottom-right anchor-bottom-right bg-surface-300 radius-circle size-400-400",
			ZIndex = 2
		}, {
			IndicatorImage = reactModule.createElement(foundationModule.Image, {
				Image = "icons/actions/truncationExpand_small",
				tag = "radius-circle position-center-center anchor-center-center size-250-250",
				imageStyle = var1.contentForegroundStyle
			})
		}) else nil,
		UIStroke = if p1.enableFocusAnimation then reactModule.createElement("UIStroke", {
			Color = var1.imageBorderFocusStyle,
			Thickness = var6:map(function(p3)
				return p3.thickness
			end),
			Transparency = var6:map(function(p3)
				return p3.transparency
			end),
			ref = var4
		}) else nil
	})
end)