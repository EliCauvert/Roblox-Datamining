local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(Modules.Common.Roact)
local TextModule = require(Modules.Common.Text)
local ConstantsModule = require(Modules.LuaApp.Constants)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local FFlagPeopleListContextualMenuFixFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPeopleListContextualMenuFixFocusNavigation
local Center = Enum.HorizontalAlignment.Center
local FitImageTextButton = RoactModule.PureComponent:extend("FitImageTextButton")
FitImageTextButton.defaultProps = {
	height = 32,
	iconRightPadding = 3,
	iconSize = 16,
	layoutOrder = 0,
	text = "",
	textSize = 20,
	horizontalPadding = 7,
	verticalPadding = 0,
	maxWidth = 0,
	minWidth = 1000,
	backgroundColor = ConstantsModule.Color.GREEN_PRIMARY,
	textColor = ConstantsModule.Color.WHITE,
	textFont = Enum.Font.SourceSans,
	scaleType = Enum.ScaleType.Slice,
	sliceCenter = Rect.new(3, 3, 4, 4),
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.new(0, 0, 0, 0)
}

function FitImageTextButton.getImageButtonAndTextWidth(p1)
	-- upvalues: TextModule (copy), Center (copy)
	local MaxWidth: number = p1.props.maxWidth
	local MinWidth: number = p1.props.minWidth
	local Left = Center
	local TextWidthDelta = TextModule.GetTextWidth(p1.props.text, p1.props.textFont, p1.props.textSize) - 2
	local NewTextWidthDelta = TextWidthDelta + 2 * p1.props.horizontalPadding
	
	if p1.props.leftIcon and true then
		NewTextWidthDelta = NewTextWidthDelta + p1.props.iconRightPadding + p1.props.iconSize
	end
	if MaxWidth < NewTextWidthDelta then
		Left = Enum.HorizontalAlignment.Left
	end
	return math.max(MinWidth, (math.min(NewTextWidthDelta, MaxWidth))), TextWidthDelta, Left
end

function FitImageTextButton.render(p1)
	-- upvalues: FFlagPeopleListContextualMenuFixFocusNavigation (copy), RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), DEPRECATEDImageSetLabelModule (copy)
	local BackgroundImage = p1.props.backgroundImage
	local BackgroundColor = p1.props.backgroundColor
	local BackgroundTransparency = p1.props.backgroundTransparency
	local Height = p1.props.height
	local HorizontalPadding = p1.props.horizontalPadding
	local VerticalPadding = p1.props.verticalPadding
	local IconRightPadding = p1.props.iconRightPadding
	local IconSize = p1.props.iconSize
	local IconColor = p1.props.iconColor
	local LayoutOrder = p1.props.layoutOrder
	local LeftIcon = p1.props.leftIcon
	local OnActivated = p1.props.onActivated
	local Text = p1.props.text
	local TextColor = p1.props.textColor
	local TextTransparency = p1.props.textTransparency
	local TextFont = p1.props.textFont
	local TextSize = p1.props.textSize
	local SliceCenter = p1.props.sliceCenter
	local ScaleType = p1.props.scaleType
	local v1: boolean = LeftIcon and true
	local AnchorPoint = p1.props.anchorPoint
	local Position = p1.props.position
	local SelectionOrder = if FFlagPeopleListContextualMenuFixFocusNavigation then p1.props.selectionOrder else nil
	local ImageButtonAndTextWidth, ImageButtonAndTextWidth2, ImageButtonAndTextWidth3 = p1:getImageButtonAndTextWidth()
	
	return RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = BackgroundImage,
		ImageColor3 = BackgroundColor,
		ImageTransparency = BackgroundTransparency,
		LayoutOrder = LayoutOrder,
		ScaleType = ScaleType,
		SliceCenter = SliceCenter,
		Size = UDim2.new(0, ImageButtonAndTextWidth, 0, Height),
		AnchorPoint = AnchorPoint,
		Position = Position,
		SelectionOrder = if FFlagPeopleListContextualMenuFixFocusNavigation then SelectionOrder else nil,
		[RoactModule.Event.Activated] = OnActivated,
		[RoactModule.Ref] = p1.props.forwardRef
	}, {
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, HorizontalPadding),
			PaddingRight = UDim.new(0, HorizontalPadding),
			PaddingTop = UDim.new(0, VerticalPadding),
			PaddingBottom = UDim.new(0, VerticalPadding)
		}),
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = ImageButtonAndTextWidth3,
			Padding = UDim.new(0, v1 and IconRightPadding or 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		LeftIcon = v1 and RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Image = LeftIcon,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.new(0, IconSize, 0, IconSize),
			ImageColor3 = IconColor
		}),
		Text = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Font = TextFont,
			Size = UDim2.new(0, ImageButtonAndTextWidth2, 1, 0),
			Text = Text,
			TextColor3 = TextColor,
			TextTransparency = TextTransparency,
			TextSize = TextSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), FitImageTextButton (copy), CryoModule (copy)
	return RoactModule.createElement(FitImageTextButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)