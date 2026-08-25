local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local constantsModule = require(avatarExperienceCommon.Constants)
local useArrowNavScrollBehaviorModule = require(avatarExperienceCommon.Hooks.useArrowNavScrollBehavior)

return function(p0)
	-- upvalues: useArrowNavScrollBehaviorModule (ref), reactModule (ref), constantsModule (ref), foundationModule (ref), icon (ref), enums (ref)
	local var5 = useArrowNavScrollBehaviorModule({
		navDirection = p0.navDirection,
		onPressHoldInputBegan = p0.onPressHoldInputBegan,
		onPressHoldInputEnded = p0.onPressHoldInputEnded,
		defaultUseProps = p0.defaultUseProps
	})
	local handleInputBegan = var5.handleInputBegan
	local handleInputEnded = var5.handleInputEnded
	local var6 = reactModule.useCallback(function() end, {})
	local var7 = if p0.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then "chevron-small-left" else "chevron-small-right"
	local actionStandard = p0.tokens.Color.ActionStandard
	local color3 = p0.tokens.Color.Surface.Surface_0.Color3
	local transparency = p0.tokens.Color.Surface.Surface_0.Transparency
	local size900 = p0.tokens.Size.Size_900
	local medium = p0.tokens.Padding.Medium
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p0.AnchorPoint,
		Position = p0.Position,
		Visible = p0.Visible,
		Size = UDim2.fromOffset(size900, size900 + medium),
		BackgroundColor3 = color3,
		BackgroundTransparency = transparency
	}, {
		GradientFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = if p0.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
			Position = if p0.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(p0.tokens.Size.Size_700, size900 + medium),
			BackgroundColor3 = color3
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.9, 0),
					NumberSequenceKeypoint.new(1, 0)
				}),
				Rotation = if p0.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then 180 else 0
			})
		}),
		InnerFrame = reactModule.createElement(foundationModule.View, {
			AnchorPoint = if p0.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
			Position = if p0.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then UDim2.new(0, p0.tokens.Size.Size_100, 0.5, 0) else UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(size900, size900),
			backgroundStyle = actionStandard.Background,
			cornerRadius = UDim.new(0.5, 0),
			onActivated = var6
		}, {
			ArrowIcon = reactModule.createElement(icon, {
				name = var7,
				size = enums.IconSize.Medium,
				style = actionStandard.Foreground,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}),
			StopPropagationOverlay = reactModule.createElement("TextButton", {
				Active = false,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				ZIndex = 0,
				[reactModule.Event.InputBegan] = handleInputBegan,
				[reactModule.Event.InputEnded] = handleInputEnded
			})
		})
	})
end