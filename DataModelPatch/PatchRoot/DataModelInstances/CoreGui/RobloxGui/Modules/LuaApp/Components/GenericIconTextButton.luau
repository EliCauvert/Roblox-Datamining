local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local ShimmerAnimationModule = require(Modules.LuaApp.Components.ShimmerAnimation)
local WithStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Style.withStyle
local _Rect = Rect.new(8, 8, 9, 9)
local GenericIconTextButton = RoactModule.PureComponent:extend("GenericIconTextButton")
GenericIconTextButton.defaultProps = {
	LayoutOrder = 1,
	iconRightPadding = 3,
	setIconTransparencyEnabled = false,
	iconTransparency = 0,
	leftIconEnabled = false,
	TextSize = 20,
	Text = "",
	isDisabled = false,
	isLoading = false,
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, 0, 1, 0),
	iconSize = UDim2.new(0, 16, 0, 16),
	horizontalAlignment = Enum.HorizontalAlignment.Center,
	Font = Enum.Font.SourceSans
}

function GenericIconTextButton.init(p1)
	p1.state = { isButtonPressed = false }
	
	function p1.onInputBegan()
		-- upvalues: p1 (copy)
		p1:setState({ isButtonPressed = true })
	end
	
	function p1.onInputEnded()
		-- upvalues: p1 (copy)
		p1:setState({ isButtonPressed = false })
	end
end

local function _(p1: number, p2: number): number
	return 1 - (1 - p1) * (1 - p2)
end

function GenericIconTextButton.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), DEPRECATEDImageSetLabelModule (copy), _Rect (copy), ShimmerAnimationModule (copy)
	local ThemeSettings = p1.props.themeSettings
	local Size = p1.props.Size
	local Text = p1.props.Text
	local PropsFont = p1.props.Font
	local TextSize = p1.props.TextSize
	local ButtonRef = p1.props.buttonRef
	local LayoutOrder = p1.props.LayoutOrder
	local IconImage = p1.props.iconImage
	local IconSize = p1.props.iconSize
	local OnActivated = p1.props.onActivated
	local IsDisabled = p1.props.isDisabled
	local IsLoading = p1.props.isLoading
	local NoIsLoading = not IsLoading
	local IsNotHidden = ThemeSettings.Border.Hidden == false
	local IconRightPadding = p1.props.iconRightPadding
	local IsButtonPressed = p1.state.isButtonPressed
	local HorizontalAlignment = p1.props.horizontalAlignment
	local LeftIconEnabled = p1.props.leftIconEnabled
	local Color = ThemeSettings.Color
	local DisabledTransparency = 0
	
	if IsLoading or IsDisabled then
		Color = ThemeSettings.DisabledColor
		DisabledTransparency = ThemeSettings.DisabledTransparency
	elseif IsButtonPressed then
		Color = ThemeSettings.OnPressColor
		DisabledTransparency = ThemeSettings.OnPressTransparency
	end
	local NextSelectionDown = p1.props.NextSelectionDown
	local NextSelectionLeft = p1.props.NextSelectionLeft
	local NextSelectionRight = p1.props.NextSelectionRight
	local NextSelectionUp = p1.props.NextSelectionUp
	local v1 = 1 - (1 - DisabledTransparency) * (1 - ThemeSettings.Transparency)
	local ImageTransparency: number = IsNotHidden and 1 - (1 - DisabledTransparency) * (1 - ThemeSettings.Border.Transparency) or 1
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), DEPRECATEDImageSetButtonModule (upval), Size (copy), LayoutOrder (copy), Color (ref), v1 (copy), NextSelectionDown (copy), NextSelectionLeft (copy), NextSelectionRight (copy), NextSelectionUp (copy), NoIsLoading (copy), OnActivated (copy), p1 (copy), ButtonRef (copy), DEPRECATEDImageSetLabelModule (upval), ImageTransparency (copy), ThemeSettings (copy), _Rect (upval), HorizontalAlignment (copy), LeftIconEnabled (copy), IconSize (copy), IconImage (copy), IconRightPadding (copy), Text (copy), PropsFont (copy), TextSize (copy), IsLoading (copy), ShimmerAnimationModule (upval)
		return RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
			Size = Size,
			LayoutOrder = LayoutOrder,
			BackgroundTransparency = 1,
			Image = "LuaApp/buttons/buttonFill",
			ImageColor3 = Color or p2.Theme.SystemPrimaryDefault.Color,
			ImageTransparency = v1 or p2.Theme.SystemPrimaryDefault.Transparency,
			BorderSizePixel = 0,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			NextSelectionDown = NextSelectionDown,
			NextSelectionLeft = NextSelectionLeft,
			NextSelectionRight = NextSelectionRight,
			NextSelectionUp = NextSelectionUp,
			ClipsDescendants = false,
			[RoactModule.Event.Activated] = NoIsLoading and OnActivated or nil,
			[RoactModule.Event.InputBegan] = p1.onInputBegan,
			[RoactModule.Event.InputEnded] = p1.onInputEnded,
			[RoactModule.Ref] = ButtonRef
		}, {
			Border = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Image = "LuaApp/buttons/buttonStroke",
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = ImageTransparency,
				ImageColor3 = ThemeSettings.Border.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = _Rect
			}),
			AlignmentContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = Size,
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = HorizontalAlignment,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				LeftIcon = LeftIconEnabled and RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
					Size = IconSize,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Image = IconImage,
					ImageTransparency = p2.Theme.IconEmphasis.Transparency,
					ImageColor3 = p2.Theme.IconEmphasis.Color,
					LayoutOrder = 1,
					ScaleType = Enum.ScaleType.Fit,
					[RoactModule.Children] = {
						UIPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, IconRightPadding) })
					}
				}),
				Text = RoactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Text = Text,
					Font = PropsFont,
					TextSize = TextSize,
					TextColor3 = ThemeSettings.Text.Color or p2.Theme.SystemPrimaryContent.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center
				})
			}),
			ShimmerAnimation = IsLoading and RoactModule.createElement(ShimmerAnimationModule, {
				shimmerSpeed = 1.5,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0)
			})
		})
	end)
end

return GenericIconTextButton