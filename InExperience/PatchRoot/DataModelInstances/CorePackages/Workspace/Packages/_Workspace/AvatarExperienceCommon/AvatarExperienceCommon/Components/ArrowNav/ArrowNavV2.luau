local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local ConstantsModule = require(AvatarExperienceCommon.Constants)
local UseArrowNavScrollBehaviorModule = require(AvatarExperienceCommon.Hooks.useArrowNavScrollBehavior)

return function(Frame) --[[ Line: 39 | Named "ArrowNavV2" ]]
	-- upvalues: UseArrowNavScrollBehaviorModule (copy), ReactModule (copy), ConstantsModule (copy), FoundationModule (copy), Icon (copy), Enums (copy)
	local UseArrowNavScrollBehaviorModuleResult = UseArrowNavScrollBehaviorModule({
		navDirection = Frame.navDirection,
		onPressHoldInputBegan = Frame.onPressHoldInputBegan,
		onPressHoldInputEnded = Frame.onPressHoldInputEnded,
		defaultUseProps = Frame.defaultUseProps
	})
	local ActionStandard = Frame.tokens.Color.ActionStandard
	local SurfaceColor3 = Frame.tokens.Color.Surface.Surface_0.Color3
	local Size900 = Frame.tokens.Size.Size_900
	local Medium = Frame.tokens.Padding.Medium
	local Size100 = Frame.tokens.Size.Size_100
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Visible = Frame.Visible,
		Size = UDim2.fromOffset(Size900, Size900 + Medium),
		BackgroundColor3 = SurfaceColor3,
		BackgroundTransparency = Frame.tokens.Color.Surface.Surface_0.Transparency
	}, {
		GradientFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = if Frame.navDirection == ConstantsModule.NAVIGATION_DIRECTION.IS_LEFT then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
			Position = if Frame.navDirection == ConstantsModule.NAVIGATION_DIRECTION.IS_LEFT then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(Frame.tokens.Size.Size_700, Size900 + Medium),
			BackgroundColor3 = SurfaceColor3
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.9, 0),
					NumberSequenceKeypoint.new(1, 0)
				}),
				Rotation = if Frame.navDirection == ConstantsModule.NAVIGATION_DIRECTION.IS_LEFT then 180 else 0
			})
		}),
		InnerFrame = ReactModule.createElement(FoundationModule.View, {
			AnchorPoint = if Frame.navDirection == ConstantsModule.NAVIGATION_DIRECTION.IS_LEFT then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
			Position = if Frame.navDirection == ConstantsModule.NAVIGATION_DIRECTION.IS_LEFT then UDim2.new(0, Size100, 0.5, 0) else UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(Size900, Size900),
			backgroundStyle = ActionStandard.Background,
			cornerRadius = UDim.new(0.5, 0),
			onActivated = ReactModule.useCallback(function() --[[ Line: 52 ]] end, {})
		}, {
			ArrowIcon = ReactModule.createElement(Icon, {
				name = if Frame.navDirection == ConstantsModule.NAVIGATION_DIRECTION.IS_LEFT then "chevron-small-left" else "chevron-small-right",
				size = Enums.IconSize.Medium,
				style = ActionStandard.Foreground,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}),
			StopPropagationOverlay = ReactModule.createElement("TextButton", {
				Active = false,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				ZIndex = 0,
				[ReactModule.Event.InputBegan] = UseArrowNavScrollBehaviorModuleResult.handleInputBegan,
				[ReactModule.Event.InputEnded] = UseArrowNavScrollBehaviorModuleResult.handleInputEnded
			})
		})
	})
end