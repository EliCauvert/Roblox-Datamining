local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local backgroundStyleContextModule = require(foundation.Providers.Style.BackgroundStyleContext)
local iconModule = require(foundation.Components.Icon)
local _ = require(foundation.Enums.InputSize)
local tokensModule = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useBackgroundStyle = backgroundStyleContextModule.useBackgroundStyle
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local useScrimVariantsModule = require(script.Parent.useScrimVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local t = {
	easingStyle = tokensModule.defaultTokens.Ease.StandardOut,
	duration = tokensModule.defaultTokens.Time.Time_200
}

local function lerpNumberSequence(startValue, endValue, alpha)
	local keypoints = startValue.Keypoints
	local keypoints_1 = endValue.Keypoints
	local t = {}
	
	for i, v in keypoints do
		local var1 = keypoints_1[i]
		t[i] = NumberSequenceKeypoint.new(v.Time + (var1.Time - v.Time) * alpha, v.Value + (var1.Value - v.Value) * alpha)
	end
	return NumberSequence.new(t)
end

return function(p1)
	-- upvalues: useTokensModule (ref), useBackgroundStyle (ref), useScrimVariantsModule (ref), reactOtterModule (ref), reactModule (ref), t (ref), lerpNumberSequence (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), iconModule (ref)
	local var1 = useBackgroundStyle()
	local var2 = useScrimVariantsModule(useTokensModule(), p1.alignment, p1.preferredInput)
	local var3 = p1.alignment == Enum.HorizontalAlignment.Right
	local var4 = if p1.preferredInput ~= Enum.PreferredInput.Touch then p1.preferredInput == Enum.PreferredInput.Gamepad else true
	local var5, var6 = reactOtterModule.useAnimatedBinding(if p1.isHovered then 1 else 0)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), reactOtterModule (copy), p1 (ref), t (copy)
		var6(reactOtterModule.ease(if p1.isHovered then 1 else 0, t))
	end, { p1.isHovered })
	local var1 = var5:map(function(p1)
		-- upvalues: var4 (ref), var3 (ref)
		return if var4 then UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(0.5 + (if var3 then 1 else -1) * (1 - p1), 0.5)
	end)
	local var1 = p1.rowHeight:map(function(p1)
		-- upvalues: var2 (ref)
		return UDim2.new(0, p1 + var2.fade, 1, 0)
	end)
	local var2 = var5:map(function(p1)
		-- upvalues: var4 (ref), var2 (ref), lerpNumberSequence (copy)
		return if var4 then var2.hoverGradient else lerpNumberSequence(var2.gradient, var2.hoverGradient, p1)
	end)
	local var1, var2 = reactOtterModule.useAnimatedBinding(if p1.isVisible then 0 else 1)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), reactOtterModule (copy), p1 (ref), t (copy)
		var2(reactOtterModule.ease(if p1.isVisible then 0 else 1, t))
	end, { p1.isVisible })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, { Size = var1, GroupTransparency = var1 }), {
		Scrim = reactModule.createElement(viewModule, {
			tag = "size-full",
			backgroundStyle = var1,
			onActivated = p1.onActivated,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onStateChanged = p1.onStateChanged,
			isDisabled = not p1.isVisible,
			selection = { Selectable = false },
			testId = `{p1.testId}--button`
		}, {
			Gradient = reactModule.createElement("UIGradient", { Transparency = var2 }),
			DirectionIcon = reactModule.createElement(viewModule, {
				ZIndex = 2,
				tag = var2.iconAlignmentTag,
				Size = UDim2.fromScale(0, 1),
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.ScaleWithParentSize,
					DominantAxis = Enum.DominantAxis.Height
				}
			}, {
				Icon = reactModule.createElement(iconModule, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = var1,
					size = p1.size,
					name = var2.directionIcon,
					testId = `{p1.testId}--direction-indicator`
				})
			})
		})
	})
end