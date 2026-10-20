local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local IconModule = require(Foundation.Components.Icon)
local _ = require(Foundation.Enums.InputSize)
local TokensModule = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseBackgroundStyleFunction = require(Foundation.Providers.Style.BackgroundStyleContext).useBackgroundStyle
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local UseScrimVariantsModule = require(script.Parent.useScrimVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local config = {
	easingStyle = TokensModule.defaultTokens.Ease.StandardOut,
	duration = TokensModule.defaultTokens.Time.Time_200
}

local function lerpNumberSequence(Gradient, HoverGradient, p1): NumberSequence
	local Keypoints = HoverGradient.Keypoints
	local NumberSequenceKeypoints = {}
	
	for i, keypoint in Gradient.Keypoints do
		local Keypoint = Keypoints[i]
		NumberSequenceKeypoints[i] = NumberSequenceKeypoint.new(keypoint.Time + (Keypoint.Time - keypoint.Time) * p1, keypoint.Value + (Keypoint.Value - keypoint.Value) * p1)
	end
	return NumberSequence.new(NumberSequenceKeypoints)
end

return function(p2)
	-- upvalues: UseTokensModule (copy), UseBackgroundStyleFunction (copy), UseScrimVariantsModule (copy), ReactOtterModule (copy), ReactModule (copy), config (copy), lerpNumberSequence (copy), ViewModule (copy), WithCommonPropsModule (copy), StateLayerAffordanceModule (copy), IconModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseBackgroundStyleResult = UseBackgroundStyleFunction()
	local UseScrimVariantsModuleResult = UseScrimVariantsModule(UseTokensModuleResult, p2.alignment, p2.preferredInput)
	local IsAlignmentMatch = p2.alignment == Enum.HorizontalAlignment.Right
	local IsPreferredInputMatch: boolean = p2.preferredInput == Enum.PreferredInput.Touch or p2.preferredInput == Enum.PreferredInput.Gamepad
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if p2.isHovered then 1 else 0)
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), p2 (copy), config (upval)
		UseAnimatedBindingResult2(ReactOtterModule.ease(if p2.isHovered then 1 else 0, config))
	end, { p2.isHovered })
	local MapResult = UseAnimatedBindingResult:map(function(p3: number): UDim2
		-- upvalues: IsPreferredInputMatch (copy), IsAlignmentMatch (copy)
		return if IsPreferredInputMatch then UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(0.5 + (if IsAlignmentMatch then 1 else -1) * (1 - p3), 0.5)
	end)
	local MapResult1 = p2.rowHeight:map(function(p3): UDim2
		-- upvalues: UseScrimVariantsModuleResult (copy)
		return UDim2.new(0, p3 + UseScrimVariantsModuleResult.fade, 1, 0)
	end)
	local MapResult2 = UseAnimatedBindingResult:map(function(p3)
		-- upvalues: IsPreferredInputMatch (copy), UseScrimVariantsModuleResult (copy), lerpNumberSequence (upval)
		return if IsPreferredInputMatch then UseScrimVariantsModuleResult.hoverGradient else lerpNumberSequence(UseScrimVariantsModuleResult.gradient, UseScrimVariantsModuleResult.hoverGradient, p3)
	end)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(if p2.isVisible then 0 else 1)
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), p2 (copy), config (upval)
		UseAnimatedBindingResult2_1(ReactOtterModule.ease(if p2.isVisible then 0 else 1, config))
	end, { p2.isVisible })
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p2, {
		Size = MapResult1,
		GroupTransparency = UseAnimatedBindingResult1
	}), {
		Scrim = ReactModule.createElement(ViewModule, {
			tag = "size-full",
			backgroundStyle = UseBackgroundStyleResult,
			onActivated = p2.onActivated,
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onStateChanged = p2.onStateChanged,
			isDisabled = not p2.isVisible,
			selection = { Selectable = false },
			testId = `{p2.testId}--button`
		}, {
			Gradient = ReactModule.createElement("UIGradient", { Transparency = MapResult2 }),
			DirectionIcon = ReactModule.createElement(ViewModule, {
				ZIndex = 2,
				tag = UseScrimVariantsModuleResult.iconAlignmentTag,
				Size = UDim2.fromScale(0, 1),
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.ScaleWithParentSize,
					DominantAxis = Enum.DominantAxis.Height
				}
			}, {
				Icon = ReactModule.createElement(IconModule, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = MapResult,
					size = p2.size,
					name = UseScrimVariantsModuleResult.directionIcon,
					testId = `{p2.testId}--direction-indicator`
				})
			})
		})
	})
end