local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local constantsModule = require(avatarExperienceCommon.Constants)
local useArrowNavScrollBehaviorModule = require(avatarExperienceCommon.Hooks.useArrowNavScrollBehavior)

return function(p1)
	-- upvalues: useArrowNavScrollBehaviorModule (ref), reactModule (ref), constantsModule (ref), foundationModule (ref), icon (ref), enums (ref)
	local var1 = useArrowNavScrollBehaviorModule({
		navDirection = p1.navDirection,
		onPressHoldInputBegan = p1.onPressHoldInputBegan,
		onPressHoldInputEnded = p1.onPressHoldInputEnded,
		defaultUseProps = p1.defaultUseProps
	})
	local handleInputBegan = var1.handleInputBegan
	local handleInputEnded = var1.handleInputEnded
	local var2 = reactModule.useCallback(function() end, {})
	local var3 = if p1.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then "chevron-small-left" else "chevron-small-right"
	local actionStandard = p1.tokens.Color.ActionStandard
	local color3 = p1.tokens.Color.Surface.Surface_0.Color3
	local transparency = p1.tokens.Color.Surface.Surface_0.Transparency
	local size900 = p1.tokens.Size.Size_900
	local medium = p1.tokens.Padding.Medium
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position,
		Visible = p1.Visible,
		Size = UDim2.fromOffset(size900, size900 + medium),
		BackgroundColor3 = color3,
		BackgroundTransparency = transparency
	}, {
		GradientFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = if p1.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
			Position = if p1.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(p1.tokens.Size.Size_700, size900 + medium),
			BackgroundColor3 = color3
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.9, 0),
					NumberSequenceKeypoint.new(1, 0)
				}),
				Rotation = if p1.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then 180 else 0
			})
		}),
		InnerFrame = reactModule.createElement(foundationModule.View, {
			AnchorPoint = if p1.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
			Position = if p1.navDirection == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then UDim2.new(0, p1.tokens.Size.Size_100, 0.5, 0) else UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(size900, size900),
			backgroundStyle = actionStandard.Background,
			cornerRadius = UDim.new(0.5, 0),
			onActivated = var2
		}, {
			ArrowIcon = reactModule.createElement(icon, {
				name = var3,
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