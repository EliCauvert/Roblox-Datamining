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

local function lerpNumberSequence(startValue, endValue, alpha) --[[ line: 29 ]]
	local keypoints = startValue.Keypoints
	local keypoints_1 = endValue.Keypoints
	local t = {}
	
	for i, v in keypoints do
		local var14 = keypoints_1[i]
		t[i] = NumberSequenceKeypoint.new(v.Time + (var14.Time - v.Time) * alpha, v.Value + (var14.Value - v.Value) * alpha)
	end
	return NumberSequence.new(t)
end

return function(p0) --[[ line: 54 | named "Scrim" ]]
	-- upvalues: useTokensModule (ref), useBackgroundStyle (ref), useScrimVariantsModule (ref), reactOtterModule (ref), reactModule (ref), t (ref), lerpNumberSequence (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), iconModule (ref)
	local var15 = useBackgroundStyle()
	local var16 = useScrimVariantsModule(useTokensModule(), p0.alignment, p0.preferredInput)
	local var17 = p0.alignment == Enum.HorizontalAlignment.Right
	local var18 = if p0.preferredInput ~= Enum.PreferredInput.Touch then p0.preferredInput == Enum.PreferredInput.Gamepad else true
	local var19, var20 = reactOtterModule.useAnimatedBinding(if p0.isHovered then 1 else 0)
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: var20 (ref), reactOtterModule (copy), p0 (ref), t (copy)
		var20(reactOtterModule.ease(if p0.isHovered then 1 else 0, t))
	end, { p0.isHovered })
	local var21 = var19:map(function(p1) --[[ line: 68 ]]
		-- upvalues: var18 (ref), var17 (ref)
		return if var18 then UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(0.5 + (if var17 then 1 else -1) * (1 - p1), 0.5)
	end)
	local var22 = p0.rowHeight:map(function(p2) --[[ line: 76 ]]
		-- upvalues: var16 (ref)
		return UDim2.new(0, p2 + var16.fade, 1, 0)
	end)
	local var23 = var19:map(function(p3) --[[ line: 80 ]]
		-- upvalues: var18 (ref), var16 (ref), lerpNumberSequence (copy)
		return if var18 then var16.hoverGradient else lerpNumberSequence(var16.gradient, var16.hoverGradient, p3)
	end)
	local var24, var25 = reactOtterModule.useAnimatedBinding(if p0.isVisible then 0 else 1)
	reactModule.useEffect(function() --[[ line: 88 ]]
		-- upvalues: var25 (ref), reactOtterModule (copy), p0 (ref), t (copy)
		var25(reactOtterModule.ease(if p0.isVisible then 0 else 1, t))
	end, { p0.isVisible })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, { Size = var22, GroupTransparency = var24 }), {
		Scrim = reactModule.createElement(viewModule, {
			tag = "size-full",
			backgroundStyle = var15,
			onActivated = p0.onActivated,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onStateChanged = p0.onStateChanged,
			isDisabled = not p0.isVisible,
			selection = { Selectable = false },
			testId = `{p0.testId}--button`
		}, {
			Gradient = reactModule.createElement("UIGradient", { Transparency = var23 }),
			DirectionIcon = reactModule.createElement(viewModule, {
				ZIndex = 2,
				tag = var16.iconAlignmentTag,
				Size = UDim2.fromScale(0, 1),
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.ScaleWithParentSize,
					DominantAxis = Enum.DominantAxis.Height
				}
			}, {
				Icon = reactModule.createElement(iconModule, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = var21,
					size = p0.size,
					name = var16.directionIcon,
					testId = `{p0.testId}--direction-indicator`
				})
			})
		})
	})
end