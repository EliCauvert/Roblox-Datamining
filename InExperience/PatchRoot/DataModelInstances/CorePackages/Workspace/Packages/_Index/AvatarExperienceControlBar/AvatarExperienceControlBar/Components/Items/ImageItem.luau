local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UsePulseAnimationBindingFunction = require(Parent.AvatarExperienceCommon).Hooks.usePulseAnimationBinding
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local UseHoverBindingModule = require(AvatarExperienceControlBar.Hooks.useHoverBinding)

return ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 25 | Named "ImageItem" ]]
	-- upvalues: UseSemanticTokensModule (copy), UseHoverBindingModule (copy), ReactModule (copy), UsePulseAnimationBindingFunction (copy), FoundationModule (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseHoverBindingModuleResult, UseHoverBindingModuleResult2 = UseHoverBindingModule()
	local UseRefResult = ReactModule.useRef(nil)
	local Size = if Frame.size then Frame.size else UseSemanticTokensModuleResult.defaultIconContainerSize
	local UsePulseAnimationBindingResult = UsePulseAnimationBindingFunction(Frame.enableFocusAnimation)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy radius-circle",
		ref = Ref,
		LayoutOrder = Frame.LayoutOrder,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		onStateChanged = UseHoverBindingModuleResult2,
		onActivated = Frame.onActivated,
		disabled = Frame.disabled,
		Visible = Frame.Visible
	}, {
		Thumbnail = ReactModule.createElement(FoundationModule.Image, {
			tag = "radius-circle",
			Image = Frame.thumbnailUrl,
			Size = UDim2.fromOffset(Size, Size),
			backgroundStyle = UseHoverBindingModuleResult:map(function(p1) --[[ Line: 49 ]]
				-- upvalues: UseSemanticTokensModuleResult (copy)
				return if p1 then UseSemanticTokensModuleResult.hoverThumbnailBackgroundStyle else UseSemanticTokensModuleResult.thumbnailBackgroundStyle
			end)
		}),
		Indicator = if Frame.hideIndicator then nil else ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy position-bottom-right anchor-bottom-right bg-surface-300 radius-circle size-400-400",
			ZIndex = 2
		}, {
			IndicatorImage = ReactModule.createElement(FoundationModule.Image, {
				Image = "icons/actions/truncationExpand_small",
				tag = "radius-circle position-center-center anchor-center-center size-250-250",
				imageStyle = UseSemanticTokensModuleResult.contentForegroundStyle
			})
		}),
		UIStroke = if Frame.enableFocusAnimation then ReactModule.createElement("UIStroke", {
			Color = UseSemanticTokensModuleResult.imageBorderFocusStyle,
			Thickness = UsePulseAnimationBindingResult:map(function(p1) --[[ Line: 71 ]]
				return p1.thickness
			end),
			Transparency = UsePulseAnimationBindingResult:map(function(p1) --[[ Line: 74 ]]
				return p1.transparency
			end),
			ref = UseRefResult
		}) else nil
	})
end)